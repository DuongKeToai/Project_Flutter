import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AppIconSection extends StatelessWidget {
  const AppIconSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/svg/app_icon.svg',
      width: 142,
      height: 142,
    );
  }
}
