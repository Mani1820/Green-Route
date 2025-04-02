import 'package:flutter/material.dart';
import 'package:green_route/Common/color_extension.dart';

class RoundedTextField extends StatelessWidget {
  const RoundedTextField({
    super.key,
    required this.hintText,
    required this.controller,
    this.validator,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.suffixIcon,
  });

  final String hintText;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final bool obscureText;
  final TextInputType keyboardType;
  final Icon? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 27),
      child: Container(
        height: 55,
        decoration: BoxDecoration(
          color: ColorExtension.placeholderColor,
          borderRadius: BorderRadius.circular(25),
        ),
        child: TextFormField(
          keyboardType: keyboardType,
          controller: controller,
          obscureText: obscureText,
          autocorrect: false,
          validator: validator,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: hintText,
            contentPadding: EdgeInsets.only(left: 25, top: 10),
            hintStyle: TextStyle(
              color: ColorExtension.secondarytextColor,
              fontSize: 14,
              fontWeight: FontWeight.w400,
              fontFamily: 'Poppins',
            ),
            suffixIcon: suffixIcon,
          ),
        ),
      ),
    );
  }
}
