import 'package:flutter/material.dart';

class PhoneNumInput extends StatelessWidget {
  final TextEditingController phoneNumController;

  const PhoneNumInput({
    super.key,
    required this.phoneNumController,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250,
      height: 50,
      child: TextField(
        controller: phoneNumController,
        style: const TextStyle(
            color: Colors.white, fontSize: 14, fontWeight: FontWeight.w500),
        cursorColor: Colors.white,
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
            hintText: "Nhập số điện thoại",
            hintStyle: const TextStyle(color: Colors.white)),
      ),
    );
  }
}
