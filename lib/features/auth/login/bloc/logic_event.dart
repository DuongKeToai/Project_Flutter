// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'logic_bloc.dart';

//?   - Có 3 event tương ứng với 3 hành động được gọi trên UI:
//        - login với username password,
//        - login với third party,
//        - forgot password
class ForgotPassword extends LoginEvent {
  final String username;
  ForgotPassword({
    required this.username,
  });
}

abstract class LoginEvent {}

class LoginWithThirdParty extends LoginEvent {
  final bool isGoogle;
  LoginWithThirdParty({
    required this.isGoogle,
  });
}

class LoginWithUsernamePassword extends LoginEvent {
  final String username;
  final String pasword;
  LoginWithUsernamePassword({
    required this.username,
    required this.pasword,
  });
}
