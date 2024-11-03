// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class MovieTypeSection extends StatelessWidget {
  final String title;
  final Widget child;
  final Widget? suffix;
  const MovieTypeSection({
    Key? key,
    required this.title,
    required this.child,
    this.suffix,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 24,
                    color: Colors.white),
              ),
              if (suffix != null) suffix!
            ],
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        child
      ],
    );
  }
}
