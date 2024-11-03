// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CustomTextfield extends StatelessWidget {
  final TextEditingController? controller;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? hintText;
  final bool obscureText;
  const CustomTextfield({
    Key? key,
    this.controller,
    this.prefixIcon,
    this.suffixIcon,
    this.hintText,
    this.obscureText = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
      ),
    );
  }
}

class InputItemSection extends StatelessWidget {
  final String title;
  final CustomTextfield textfield;
  const InputItemSection({
    Key? key,
    required this.title,
    required this.textfield,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 12,
            color: Colors.white,
          ),
        ),
        textfield
      ],
    );
  }
}

class UsernamePasswordSection extends StatelessWidget {
  final TextEditingController userNameTextController;
  final TextEditingController passwordTextController;
  const UsernamePasswordSection({
    Key? key,
    required this.userNameTextController,
    required this.passwordTextController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InputItemSection(
          title: "Username",
          textfield: CustomTextfield(
            controller: userNameTextController,
            hintText: "Enter your username",
            prefixIcon: const Icon(Icons.person),
          ),
        ),
        const SizedBox(
          height: 24,
        ),
        InputItemSection(
          title: "Password",
          textfield: CustomTextfield(
            controller: passwordTextController,
            hintText: "Enter your password",
            prefixIcon: const Icon(Icons.lock),
            obscureText: true,
            suffixIcon:
                const IconButton(onPressed: null, icon: Icon(Icons.visibility)),
          ),
        ),
      ],
    );
  }
}
