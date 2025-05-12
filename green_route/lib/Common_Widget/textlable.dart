import 'package:flutter/material.dart';
import 'package:green_route/Common/color_extension.dart';

class Textlable extends StatelessWidget {
  const Textlable({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 15,
      ),
      child: Text(
        text,
        style: TextStyle(
          fontFamily: 'poppins',
          fontSize: 18,
          fontWeight: FontWeight.w500,
          color: ColorExtension.primarytextColor,
        ),
      ),
    );
  }
}
