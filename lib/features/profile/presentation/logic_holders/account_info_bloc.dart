import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_learning/core/enums/status_state.dart';
import 'package:flutter_learning/features/profile/domain/entities/account_entity.dart';
import 'package:flutter_learning/features/profile/domain/repositories/account_repository.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/services/logger_service.dart';

part 'account_info_event.dart';
part 'account_info_state.dart';

class AccountInfoBloc extends Bloc<AccountInfoEvent, AccountInfoState> {
  final AccountRepository repository;
  final ImagePicker _picker = ImagePicker();
  AccountInfoBloc(this.repository) : super(const AccountInfoState()) {
    on<UpdateDob>((event, emit) {
      final localAccountInfo = state.updatedLocalAccountData;
      final updatedInfo = localAccountInfo.copyWith(dob: event.newDob);
      emit(state.copyWith(updatedLocalAccountData: updatedInfo));
    });
    on<UpdateGender>((event, emit) {
      final localAccountInfo = state.updatedLocalAccountData;
      final updatedInfo = localAccountInfo.copyWith(gender: event.newGender);
      emit(state.copyWith(updatedLocalAccountData: updatedInfo));
    });
    on<UpdateFullname>((event, emit) {
      printS("[UpdateFullname] value: ${event.newName}");
      final localAccountInfo = state.updatedLocalAccountData;
      final updatedInfo = localAccountInfo.copyWith(fullName: event.newName);
      emit(state.copyWith(updatedLocalAccountData: updatedInfo));
    });
    on<UpdatePhoneNum>((event, emit) {
      printS("[UpdatePhoneNum] value: ${event.newPhoneNum}");
      final localAccountInfo = state.updatedLocalAccountData;
      final updatedInfo =
          localAccountInfo.copyWith(phoneNumber: event.newPhoneNum);
      emit(state.copyWith(updatedLocalAccountData: updatedInfo));
    });
    on<UpdateEmail>((event, emit) {
      printS("[UpdateEmail] value: ${event.newEmail}");
      final localAccountInfo = state.updatedLocalAccountData;
      final updatedInfo = localAccountInfo.copyWith(email: event.newEmail);
      emit(state.copyWith(updatedLocalAccountData: updatedInfo));
    });
    on<SaveInfo>((event, emit) async {
      final userId = FirebaseAuth.instance.currentUser?.uid;
      if (userId != null) {
        emit(state.copyWith(status: StatusState.loading));
        final localImageFile = state.updatedLocalImageFile;
        var localAccountInfo = state.updatedLocalAccountData;
        if (localImageFile != null) {
          final avatarUrl = await uploadImageToFirebase(
              userId: userId, imageFile: localImageFile);
          if (avatarUrl != null) {
            localAccountInfo = localAccountInfo.copyWith(avatarUrl: avatarUrl);
          }
        }

        printS("[SaveInfo] Info is ready to save: $localAccountInfo");
        await repository.createOrUpdateAccountData(userId, localAccountInfo);
        emit(state.copyWithoutLocalImageFile(
            successMsg: "Lưu thông tin thành công", status: StatusState.idle));
        add(FetchAccountInfo());
      }
    });
    on<FetchAccountInfo>((event, emit) async {
      try {
        emit(state.copyWith(status: StatusState.loading));
        final userId = FirebaseAuth.instance.currentUser?.uid;
        if (userId != null) {
          final result = await repository.getAccountData(userId);
          emit(state.copyWith(
              accountDataFromFirestore: result,
              updatedLocalAccountData: const AccountEntity()));
        }
      } catch (e) {
        printE("[FetchAccountInfo] error: $e");
      } finally {
        emit(state.copyWith(status: StatusState.idle));
      }
    });
    on<PickImage>((event, emit) async {
      try {
        final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
        if (pickedFile != null) {
          emit(state.copyWith(updatedLocalImageFile: File(pickedFile.path)));
        }
      } catch (e) {
        printE("[AccountInfoBloc] - [PickImage] error: $e");
        emit(state.copyWith(errorMsg: "Đã xảy ra lỗi, ko thể lấy hình ảnh"));
      } finally {
        emit(state.copyWith(status: StatusState.idle));
      }

    });
  }

  bool get canUpdate {
    final updatedAccountInfo = state.updatedLocalAccountData;
    final fullname = updatedAccountInfo.fullName;
    final dob = updatedAccountInfo.dob;
    final phoneNum = updatedAccountInfo.phoneNumber;
    final email = updatedAccountInfo.email;
    final gender = updatedAccountInfo.gender;
    final updatedLocalImageFile = state.updatedLocalImageFile;
    return fullname != null ||
        dob != null ||
        phoneNum != null ||
        email != null ||
        gender != null ||
        updatedLocalImageFile != null;
  }

  Future<String?> uploadImageToFirebase(
      {required String userId, required File imageFile}) async {
    try {
      // Tạo đường dẫn nơi lưu ảnh trong Firebase Storage
      Reference storageReference =
          FirebaseStorage.instance.ref().child('uploads/$userId');

      // Upload ảnh lên Firebase Storage
      await storageReference.putFile(imageFile);
      // Chờ cho quá trình upload hoàn thành
      // Lấy download url để hiển thị hình ảnh
      String downloadURL = await storageReference.getDownloadURL();
      return downloadURL;
    } catch (e) {
      printE('Upload failed: $e');
      return null;
    }
  }

}
