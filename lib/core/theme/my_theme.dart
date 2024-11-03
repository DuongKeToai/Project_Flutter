import 'package:flutter/material.dart';

class MyTheme {
  static ThemeData darkTheme() {
    return ThemeData(
      fontFamily: "Inter",
      brightness: Brightness.dark, // Sử dụng chủ đề tối làm cơ sở
      primaryColor: Colors.orange, // Màu chính cho ứng dụng
      colorScheme: ColorScheme.fromSwatch(
        primarySwatch: Colors
            .orange, // Điều này sẽ tạo ra màu chính và các sắc thái của nó
        brightness: Brightness.dark, // Độ sáng chung của bảng màu này
      ).copyWith(
        secondary:
            Colors.orangeAccent, // Được sử dụng cho nút bấm và công tắc, v.v.
      ),
      scaffoldBackgroundColor: const Color(0xff1A2232), // Màu nền cho Scaffold
      appBarTheme: const AppBarTheme(
        backgroundColor: Color(0xff1A2232), // Màu nền cho AppBar
        titleTextStyle: TextStyle(
            fontSize: 18,
            color: Colors.white,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w700),
        iconTheme: IconThemeData(color: Color(0xff637394)),
      ),
      textTheme: const TextTheme(
        displayLarge: TextStyle(
          fontSize: 57,
          fontWeight: FontWeight.w400,
          color: Colors.white,
        ),
        bodyLarge: TextStyle(
            color: Colors.white,
            fontSize: 18), // Kiểu văn bản mặc định cho văn bản cơ thể
        bodyMedium: TextStyle(
            color: Colors.grey, fontSize: 16), // Văn bản nhỏ hơn một chút
        headlineMedium: TextStyle(
            color: Colors.orange,
            fontSize: 20,
            fontWeight: FontWeight.bold), // Cho tiêu đề
      ),
      // inputDecorationTheme: const InputDecorationTheme(
      //     filled: true,
      //     fillColor: Colors.transparent,
      //     enabledBorder: UnderlineInputBorder(
      //         borderSide: BorderSide(
      //             color: Color(
      //               0xffFF8036,
      //             ),
      //             width: 2)),
      //     focusedBorder: UnderlineInputBorder(
      //         borderSide: BorderSide(color: Color(0xffFF8036), width: 2)),
      //     labelStyle: TextStyle(color: Colors.white70),
      //     hintStyle: TextStyle(color: Colors.white54),
      //     suffixIconColor: Color(0xff637394),
      //     prefixIconColor: Color(0xffFF8036)),

      tabBarTheme: TabBarTheme(
        indicatorColor: const Color(0xffFF8036),
        unselectedLabelStyle: const TextStyle(
          color: Color(0xFF637394),
          fontSize: 16,
          fontWeight: FontWeight.w700,
        ),
        labelStyle: TextStyle(
            color: const Color(0xffFF8036),
            fontSize: 16,
            fontWeight: FontWeight.w700,
            shadows: [
              Shadow(
                blurRadius: 16,
                color: const Color(0xffFF8036).withOpacity(.5),
              )
            ]),
        indicatorSize: TabBarIndicatorSize.tab,
        dividerColor: Colors.transparent,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor:
              MaterialStateProperty.all(const Color(0xffFF8036)), // Màu nền
          foregroundColor:
          MaterialStateProperty.all(Colors.white), // Màu chữ và icon
          elevation: MaterialStateProperty.all(5), // Độ cao của bóng
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              // Hình dạng của nút
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          textStyle: MaterialStateProperty.all(const TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 18,
          )),
          shadowColor:
          MaterialStateProperty.all(const Color(0xffFF8036).withOpacity(.5)),
          padding: MaterialStateProperty.all(
            const EdgeInsets.symmetric(
                horizontal: 30, vertical: 16), // Khoảng cách bên trong
          ),
        ),
      ),
      splashColor:
          const Color(0xff637394).withOpacity(.05), // Màu splash effect
      highlightColor: Colors.transparent,
    );
  }
}
