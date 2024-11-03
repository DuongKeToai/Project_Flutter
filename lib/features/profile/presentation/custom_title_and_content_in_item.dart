import 'package:flutter/material.dart';

class CustomTitleAndContentInItem extends StatelessWidget {
  final String title;
  final Widget content;
  const CustomTitleAndContentInItem({
    super.key,
    required this.title,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(color: Colors.white, fontSize: 14),
        ),
        content
      ],
    );
  }
}
