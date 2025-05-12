import 'package:flutter/material.dart';
import 'package:green_route/Common/color_extension.dart';

enum ButtonType { primary, secondary }

class RoundedButton extends StatelessWidget {
  const RoundedButton({
    super.key,
    required this.title,
    this.prefixIcon,
    required this.onPressed,
    required this.type,
  });

  final String title;
  final Image? prefixIcon;
  final VoidCallback onPressed;
  final ButtonType type;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.075),
      child: InkWell(
        onTap: onPressed,
        child: Container(
          width: double.infinity,
          height: 55,
          decoration: BoxDecoration(
            color: type == ButtonType.primary
                ? ColorExtension.primaryColor
                : Colors.white,
            borderRadius: BorderRadius.circular(25),
            border: Border.all(
              color: type == ButtonType.primary
                  ? Colors.transparent
                  : ColorExtension.primaryColor,
              width: 2,
            ),
          ),
          child: Center(
            child: Text(
              title,
              style: TextStyle(
                color: type == ButtonType.primary
                    ? Colors.white
                    : ColorExtension.primaryColor,
                fontSize: 20,
                fontWeight: FontWeight.w600,
                fontFamily: 'Poppins',
              ),
            ),
          ),
        ),
      ),
    );
  }
}
