import 'package:flutter/material.dart';
import 'package:green_route/Common/color_extension.dart';

class TabScreenButton extends StatelessWidget {
  const TabScreenButton({
    super.key,
    required this.title,
    required this.onTap,
    required this.selectedPage,
    required this.icon,
  });
  final bool selectedPage;
  final String title;
  final IconData icon;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      splashColor: Colors.transparent,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: selectedPage
                ? ColorExtension.primaryColor
                : const Color.fromARGB(255, 55, 54, 54),
            size: 30,
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            title,
            style: TextStyle(
              color: const Color.fromARGB(255, 55, 54, 54),
              fontSize: 12,
              fontWeight: FontWeight.w500,
              fontFamily: 'poppins',
            ),
          ),
        ],
      ),
    );
  }
}
