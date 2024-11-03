
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

part 'logic_event.dart';
part 'logic_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(InitialLoginState()) {
    on<LoginWithUsernamePassword>((event, emit) async {
      final username = event.username;
      final password = event.pasword;
      emit(LoadingLoginState());
      final isSuccess = await signInWithEmailAndPassword(username, password);
      if (isSuccess) {
        emit(SuccessfullyLoginState(
            successfulMsg: "Chúc mừng email: $username đã login thành công"));
      } else {
        emit(FailedLoginState(
            errorMessage:
                "Đăng nhập bằng username và password thất bại. Hãy thử lại sau!!!"));
      }
    });

    on<LoginWithThirdParty>((event, emit) async {
      final isGoogleSignIn = event.isGoogle;
      final signInMethod = isGoogleSignIn ? "Google" : "Facebook";
      try {
        emit(LoadingLoginState());
        if (isGoogleSignIn) {
          final isSuccess = await signInWithGoogle();
          if (isSuccess) {
            emit(SuccessfullyLoginState(
                successfulMsg:
                    "Bạn đã đăng nhập bằng $signInMethod thành công"));
          } else {
            emit(FailedLoginState(
                errorMessage:
                    "Đăng nhập bằng $signInMethod thất bại. Hãy thử lại sau!!!"));
          }
        } else {
          final isSuccess = await signInWithFacebook();
          if (isSuccess) {
            emit(SuccessfullyLoginState(
                successfulMsg:
                    "Bạn đã đăng nhập bằng $signInMethod thành công"));
          } else {
            emit(FailedLoginState(
                errorMessage:
                    "Đăng nhập bằng $signInMethod thất bại. Hãy thử lại sau!!!"));
          }
        }
      } catch (e) {
        print("Error while using third-party authen service: $e");
      } finally {
        emit(InitialLoginState());
      }
    });

    on<ForgotPassword>((event, emit) {});
  }

  Future<bool> signInWithEmailAndPassword(String email, String password) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      print('User signed in: ${credential.user}');
      return true;
    } on FirebaseAuthException catch (e) {
      print('Error: ${e.code}');
      return false;
    }
  }

  Future<bool> signInWithFacebook() async {
    try {
      final LoginResult result = await FacebookAuth.instance.login();

      final OAuthCredential facebookAuthCredential =
          FacebookAuthProvider.credential(result.accessToken!.tokenString);

      await FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
      return true;
    } on FirebaseAuthException catch (e) {
      print('Error while signing in with Facebook: ${e.code}');
      return false;
    } catch (e) {
      print('Exception: $e');
      return false;
    }
  }

  Future<bool> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn(
        scopes: [
          'email',
        ],
      ).signIn();

      if (googleUser != null) {
        final GoogleSignInAuthentication googleAuth =
            await googleUser.authentication;

        final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );

        final userCredential =
            await FirebaseAuth.instance.signInWithCredential(credential);
        print('User signed in: ${userCredential.user}');
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print('Error signing in with Google: $e');
      return false;
    }
  }
}
