import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_learning/core/common/presentation/home_screen.dart';
import 'package:flutter_learning/features/auth/login/login_screen.dart';
//! Tạo một widget gốc để xử lý điều hướng
class RootPage extends StatelessWidget {
  const RootPage({super.key});

  @override
  Widget build(BuildContext context) {
    //! sử dụng StreamBuilder để theo dõi các thay đổi trong trạng thái đăng nhập
    //! và quyết định màn hình nào để hiển thị.
    return StreamBuilder<User?>(
      //? Khi bạn sử dụng authStateChanges(),
      //? nó sẽ tự động phát hiện bất kỳ thay đổi nào về trạng thái đăng nhập của người dùng.
      //? Khi người dùng đăng nhập, Firebase sẽ lưu một token trên thiết bị
      //? và sử dụng token này để duy trì trạng thái đăng nhập qua các phiên.
      //? Token này sẽ được làm mới tự động.
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          User? user = snapshot.data;
          if (user == null) {
            return const LoginScreen(); // Màn hình đăng nhập nếu chưa đăng nhập
          }
          return const HomeScreen(); // Màn hình chính nếu đã đăng nhập
        }
        return const Scaffold(
          body: Center(
            child:
                CircularProgressIndicator(), // Hiển thị spinner trong lúc đợi
          ),
        );
      },
    );
  }
}
