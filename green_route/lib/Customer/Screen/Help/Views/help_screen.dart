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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: size.height * 0.02,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Help and Support',
                style: TextStyle(
                  fontSize: 25,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.bold,
                  color: ColorExtension.primarytextColor,
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.04,
            ),
            InkWell(
              onTap: () {},
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Row(
                  children: [
                    Icon(
                      Icons.call_outlined,
                      color: ColorExtension.primaryColor,
                    ),
                    SizedBox(
                      width: size.width * 0.08,
                    ),
                    Text(
                      'Contact Us',
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'Poppins',
                        color: ColorExtension.primarytextColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Divider(
              color: ColorExtension.primarytextColor,
              indent: size.width * 0.05,
              endIndent: size.width * 0.05,
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            InkWell(
              onTap: () {},
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Row(
                  children: [
                    Icon(
                      Icons.info_outlined,
                      color: ColorExtension.primaryColor,
                    ),
                    SizedBox(
                      width: size.width * 0.08,
                    ),
                    Text(
                      'About Us',
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'Poppins',
                        color: ColorExtension.primarytextColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Divider(
              color: ColorExtension.primarytextColor,
              indent: size.width * 0.05,
              endIndent: size.width * 0.05,
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            InkWell(
              onTap: () {},
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Row(
                  children: [
                    Icon(
                      Icons.message_outlined,
                      color: ColorExtension.primaryColor,
                    ),
                    SizedBox(
                      width: size.width * 0.08,
                    ),
                    Text(
                      'Feedback',
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'Poppins',
                        color: ColorExtension.primarytextColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Divider(
              color: ColorExtension.primarytextColor,
              indent: size.width * 0.05,
              endIndent: size.width * 0.05,
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            InkWell(
              onTap: () {},
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.question_answer_outlined,
                      color: ColorExtension.primaryColor,
                    ),
                    SizedBox(
                      width: size.width * 0.08,
                    ),
                    Text(
                      'FAQs',
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'Poppins',
                        color: ColorExtension.primarytextColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Divider(
              color: ColorExtension.primarytextColor,
              indent: size.width * 0.05,
              endIndent: size.width * 0.05,
            )
          ],
        ),
      ),
    );
  }
}
