import 'package:flutter/material.dart';
import 'package:green_route/Common/color_extension.dart';
import 'package:green_route/Common_Widget/rounded_text_field.dart';
import 'package:green_route/Screen/Onboarding/Login/login_screen.dart';

import '../../../Common_Widget/rounded_button.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            Column(
              children: [
                SizedBox(
                  width: size.width * 1,
                  child: Image(
                    image: AssetImage(
                      'Assets/Images/page_view_3.png',
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
            Positioned(
              bottom: 0,
              child: Container(
                alignment: Alignment.bottomCenter,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                height: size.height * 0.6,
                width: size.width,
                child: Center(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Sign Up',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Poppins',
                            color: ColorExtension.primaryColor),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      RoundedTextField(
                        hintText: 'Enter your email or phone',
                        controller: TextEditingController(),
                      ),
                      SizedBox(
                        height: 17,
                      ),
                      RoundedTextField(
                        hintText: 'Enter your password',
                        controller: TextEditingController(),
                        obscureText: true,
                      ),
                      SizedBox(
                        height: 17,
                      ),
                      RoundedTextField(
                        hintText: 'Confirm your password',
                        controller: TextEditingController(),
                        obscureText: true,
                      ),
                      SizedBox(
                        height: 17,
                      ),
                      RoundedButton(
                        title: 'Sign up',
                        type: ButtonType.primary,
                        onPressed: () {},
                      ),
                      SizedBox(
                        height: 17,
                      ),
                      Text('or login with'),
                      SizedBox(
                        height: 17,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: InkWell(
                          onTap: () {},
                          child: Container(
                            width: size.width * 1,
                            height: 60,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: const Color.fromARGB(255, 188, 44, 34),
                            ),
                            child: Center(
                              child: Text(
                                'Google',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'Poppins'),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 17,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'already have an account? ',
                            style: TextStyle(
                              fontSize: 14,
                              color: ColorExtension.primarytextColor,
                              fontWeight: FontWeight.w300,
                              fontFamily: 'Poppins',
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LoginScreen()),
                                  (route) => false);
                            },
                            child: Text(
                              'login',
                              style: TextStyle(
                                fontSize: 14,
                                color: ColorExtension.primaryColor,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'Poppins',
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
