import 'package:flutter/material.dart';

class LoginButtonSection extends StatelessWidget {
  final void Function()? onPressed;
  final bool isLoading;
  const LoginButtonSection({
    super.key,
    this.onPressed,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        child: ElevatedButton(
            onPressed: isLoading ? null : onPressed,
            style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 8)),
            child: isLoading
                ? const CircularProgressIndicator(
                    color: Colors.white,
                  )
                : const Text(
                    'Login',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 24,
                    ),
                  )));
  }
}
