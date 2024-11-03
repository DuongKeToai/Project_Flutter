// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'account_info_bloc.dart';

abstract class AccountInfoEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class FetchAccountInfo extends AccountInfoEvent {}

class PickImage extends AccountInfoEvent {}

class SaveInfo extends AccountInfoEvent {}

class UpdateDob extends AccountInfoEvent {
  final DateTime newDob;
  UpdateDob({
    required this.newDob,
  });
  @override
  List<Object?> get props => [newDob];
}

class UpdateEmail extends AccountInfoEvent {
  final String newEmail;
  UpdateEmail({
    required this.newEmail,
  });
}

class UpdateFullname extends AccountInfoEvent {
  final String newName;
  UpdateFullname({
    required this.newName,
  });
}

class UpdateGender extends AccountInfoEvent {
  final int newGender;
  UpdateGender({
    required this.newGender,
  });
}

class UpdatePhoneNum extends AccountInfoEvent {
  final String newPhoneNum;
  UpdatePhoneNum({
    required this.newPhoneNum,
  });
}
