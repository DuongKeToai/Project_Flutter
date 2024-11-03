import 'package:flutter/material.dart';

class CustomTitleAndContentSection extends StatelessWidget {
  final String title;
  final Widget content;

  const CustomTitleAndContentSection({
    super.key,
    required this.title,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
              color: Color.fromARGB(255, 130, 142, 166), fontSize: 18),
        ),
        const SizedBox(
          height: 16,
        ),
        content
      ],
    );
  }
}
