// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_learning/features/auth/login/widgets/sign_in_method_item.dart';

class OtherSignInMethodSection extends StatelessWidget {
  final void Function()? onGoogleSignInTap;
  final void Function()? onFBSignInTap;
  const OtherSignInMethodSection({
    Key? key,
    this.onGoogleSignInTap,
    this.onFBSignInTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          const Text(
            'Or sign in with',
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 12,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SignInMethodItem(
                imgPath: "assets/images/gg_ic.png",
                title: "Google",
                onTap: onGoogleSignInTap,
              ),
              const SizedBox(
                width: 8,
              ),
              SignInMethodItem(
                imgPath: "assets/images/fb_ic.png",
                title: "Facebook",
                onTap: onFBSignInTap,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
