// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'logic_bloc.dart';

//?   - State gồm 3 trạng thái: iniial, success, failed, loading.
//?     Và có thêm 2 thông điệp cần hiển thị trong một số tình huống error message, toast successfully message

class FailedLoginState extends LoginState {
  final String? errorMessage;
  FailedLoginState({
    this.errorMessage,
  });
}

class InitialLoginState extends LoginState {}

class LoadingLoginState extends LoginState {}

abstract class LoginState {}

class SuccessfullyLoginState extends LoginState {
  final String? successfulMsg;
  SuccessfullyLoginState({
    this.successfulMsg,
  });
}
