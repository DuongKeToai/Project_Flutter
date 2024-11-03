import 'package:flutter/material.dart';

class ForgotPasswordSection extends StatelessWidget {
  final void Function()? onTap;
  const ForgotPasswordSection({
    super.key,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: InkWell(
        onTap: onTap,
        child: const Padding(
          padding: EdgeInsets.symmetric(vertical: 24),
          child: Text(
            'Forgot password?',
            style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 12,
                color: Color(0xffFF8036)),
          ),
        ),
      ),
    );
  }
}
