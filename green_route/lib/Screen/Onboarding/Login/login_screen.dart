import 'package:flutter/material.dart';
import 'package:green_route/Common/color_extension.dart';
import 'package:green_route/Common_Widget/rounded_button.dart';
import 'package:green_route/Common_Widget/rounded_text_field.dart';
import 'package:green_route/Screen/Onboarding/Signup/signup_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(left: 70),
                child: Text(
                  'Welcome to Green Route',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: ColorExtension.primarytextColor,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Poppins'),
                ),
              ),
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
                height: size.height * 0.55,
                width: size.width,
                child: Center(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Login',
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
                      Text(
                        'Forgot Password?',
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          fontSize: 14,
                          color: ColorExtension.primaryColor,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Poppins',
                        ),
                      ),
                      SizedBox(
                        height: 17,
                      ),
                      RoundedButton(
                        title: 'Login',
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
                            'Don\'t have an account? ',
                            style: TextStyle(
                              fontSize: 14,
                              color: ColorExtension.primarytextColor,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Poppins',
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SignupScreen(),
                                      fullscreenDialog: true),
                                  (route) => false);
                            },
                            child: Text(
                              'Sign Up',
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
