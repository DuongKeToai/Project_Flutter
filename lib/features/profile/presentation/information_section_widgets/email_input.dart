import 'package:flutter/material.dart';

class EmailInput extends StatelessWidget {
  final TextEditingController emailController;

  const EmailInput({
    super.key,
    required this.emailController,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250,
      child: TextFormField(
        controller: emailController,
        style: const TextStyle(
            color: Colors.white, fontSize: 14, fontWeight: FontWeight.w500),
        cursorColor: Colors.white,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: (value) {
          if (value != null) {
            if (value.length < 5) {
              return "Email ko hợp lệ, vui lòng thử lại";
            }
          }
          return null;
        },
        decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: const Color(0xff6D9EFF).withOpacity(.1),
                ),
                borderRadius: BorderRadius.circular(12)),
            border: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.white),
                borderRadius: BorderRadius.circular(12)),
            hintText: "Nhập email",
            hintStyle: const TextStyle(color: Colors.white)),
      ),
    );
  }
}
