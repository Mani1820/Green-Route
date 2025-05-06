import 'package:flutter/material.dart';
import 'package:green_route/Common/color_extension.dart';

class HelpScreen extends StatelessWidget {
  const HelpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: size.height * 0.02,
            ),
            Text(
              'Help and Support',
              style: TextStyle(
                fontSize: 25,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.bold,
                color: ColorExtension.primarytextColor,
              ),
            ),
            SizedBox(
              height: size.height * 0.04,
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                'Contact Us',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  color: ColorExtension.primarytextColor,
                  fontSize: 18,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
