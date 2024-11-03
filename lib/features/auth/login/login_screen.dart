import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_learning/features/auth/login/bloc/logic_bloc.dart';
import 'package:flutter_learning/features/auth/login/widgets/app_icon_section.dart';
import 'package:flutter_learning/features/auth/login/widgets/forgot_password_section.dart';
import 'package:flutter_learning/features/auth/login/widgets/loading_overlay.dart';
import 'package:flutter_learning/features/auth/login/widgets/login_button_section.dart';
import 'package:flutter_learning/features/auth/login/widgets/other_sign_in_method_section.dart';
import 'package:flutter_learning/features/auth/login/widgets/username_password_section.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late final TextEditingController userNameTextController;
  late final TextEditingController passwordTextController;

  @override
  Widget build(BuildContext context) {
    //! BlocProvider
    //? được sử dụng để tạo một instance của LoginBloc và cung cấp nó cho cây widget con.
    //? Điều này đảm bảo rằng LoginBloc có thể được truy cập từ bất kỳ widget nào bên trong cây mà cần tới nó.
    return BlocProvider(
      create: (context) => LoginBloc(),
      child: Scaffold(
        body: Builder(builder: (context) {
          //! BlocListener

          return BlocConsumer<LoginBloc, LoginState>(
            //? được dùng để lắng nghe các thay đổi trạng thái từ LoginBloc và phản hồi (thông qua UI)
            //? dựa trên các trạng thái này.
            listener: (context, state) {
              //?  Trong trường hợp này, nó đang lắng nghe các trạng thái thất bại và thành công của quá trình đăng nhập.
              if (state is FailedLoginState) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(
                    state.errorMessage ?? '',
                    style: const TextStyle(color: Colors.white),
                  ),
                  backgroundColor: Colors.red,
                ));
              } else if (state is SuccessfullyLoginState) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(
                    state.successfulMsg ?? '',
                    style: const TextStyle(color: Colors.white),
                  ),
                  backgroundColor: Colors.green,
                ));
              }
            },
            builder: (_, state) {
              final isLoading = state is LoadingLoginState;
              return Stack(
                children: [
                  GestureDetector(
                    onTap: () {
                      FocusScope.of(context).unfocus();
                    },
                    behavior: HitTestBehavior
                        .opaque, // Ensure taps on the empty space are registered
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 36),
                      child: SafeArea(
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Padding(
                                padding: EdgeInsets.symmetric(vertical: 45),
                                child: AppIconSection(),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 43),
                                child: Column(
                                  children: [
                                    UsernamePasswordSection(
                                      userNameTextController:
                                          userNameTextController,
                                      passwordTextController:
                                          passwordTextController,
                                    ),
                                    ForgotPasswordSection(
                                      onTap: () {
                                        Navigator.of(context)
                                            .pushNamed("forgot-password");
                                      },
                                    ),
                                    // //! BlocBuilder
                                    // //? được sử dụng để xây dựng UI phụ thuộc vào trạng thái hiện tại của LoginBloc
                                    // BlocBuilder<LoginBloc, LoginState>(
                                    //   builder: (context, state) {
                                    //     //? Trong trường hợp này, BlocBuilder xác định
                                    //     //? nếu trạng thái là LoadingLoginState để hiển thị giao diện loading.
                                    //     final isLoading =
                                    //         state is LoadingLoginState;
                                    //     return LoginButtonSection(
                                    //       isLoading: isLoading,
                                    //       onPressed: () {
                                    //         //? Khi nút đăng nhập được nhấn,
                                    //         //? một sự kiện LoginWithUsernamePassword sẽ được gửi tới LoginBloc
                                    //         //? với tên người dùng và mật khẩu từ các trường nhập liệu.
                                    //         BlocProvider.of<LoginBloc>(context)
                                    //             .add(LoginWithUsernamePassword(
                                    //                 username:
                                    //                     userNameTextController
                                    //                         .text,
                                    //                 pasword:
                                    //                     passwordTextController
                                    //                         .text));
                                    //       },
                                    //     );
                                    //   },
                                    // ),
                                    LoginButtonSection(
                                      onPressed: () {
                                        //? Khi nút đăng nhập được nhấn,
                                        //? một sự kiện LoginWithUsernamePassword sẽ được gửi tới LoginBloc
                                        //? với tên người dùng và mật khẩu từ các trường nhập liệu.
                                        BlocProvider.of<LoginBloc>(context).add(
                                            LoginWithUsernamePassword(
                                                username:
                                                    userNameTextController.text,
                                                pasword: passwordTextController
                                                    .text));
                                      },
                                    )
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 45,
                              ),
                              OtherSignInMethodSection(
                                onGoogleSignInTap: () {
                                  BlocProvider.of<LoginBloc>(context)
                                      .add(LoginWithThirdParty(isGoogle: true));
                                },
                                onFBSignInTap: () {
                                  BlocProvider.of<LoginBloc>(context).add(
                                      LoginWithThirdParty(isGoogle: false));
                                },
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  if (isLoading) const LoadingOverylay()
                ],
              );
            },
          );
        }),
      ),
    );
  }

  @override
  void dispose() {
    userNameTextController.dispose();
    passwordTextController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    userNameTextController = TextEditingController();
    passwordTextController = TextEditingController();
    super.initState();
  }
}
