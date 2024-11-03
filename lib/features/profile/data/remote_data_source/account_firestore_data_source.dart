import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_learning/core/services/logger_service.dart';
import 'package:flutter_learning/features/profile/data/models/account_model.dart';

abstract class AccountFirestoreDataSource {
  Future<AccountModel?> getAccountData(String userId);
  Future<void> updateOrCreateAccountData(String userId, AccountModel account);
}

class AccountFirestoreDataSourceImpl implements AccountFirestoreDataSource {
  @override
  Future<AccountModel?> getAccountData(String userId) async {
    final db = FirebaseFirestore.instance;
    final accountRef = db.collection('accounts').doc(userId);
    final result = await accountRef.get();
    final data = result.data();
    if (result.exists && data != null) {
      return AccountModel.fromJson(data);
    } else {
      return null;
    }
  }

  @override
  Future<void> updateOrCreateAccountData(
      String userId, AccountModel account) async {
    final db = FirebaseFirestore.instance;
    //! Lấy tham chiếu tới document bằng userId
    DocumentReference userDocRef = db.collection('accounts').doc(userId);
    //! Kiểm tra xem tài liệu có tồn tại hay không
    DocumentSnapshot docSnapshot = await userDocRef.get();
    if (docSnapshot.exists) {
      //! Nếu tồn tại, thực hiện cập nhật (update)
      await userDocRef.update(account.toJson());
      printS("Account Info updated!");
    } else {
      //! Nếu không tồn tại, thực hiện tạo mới (create)
      await userDocRef.set(account.toJson());
      printS("Account Info updated!");
    }
  }
}
