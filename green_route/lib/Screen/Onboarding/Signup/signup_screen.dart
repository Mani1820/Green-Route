import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:green_route/Common/color_extension.dart';
import 'package:green_route/Common_Widget/rounded_text_field.dart';
import 'package:green_route/Screen/Onboarding/Login/login_screen.dart';
import 'package:green_route/Screen/home/view/tab_screen.dart';

import '../../../Common_Widget/rounded_button.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  String? _nameValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your name';
    }
    return null;
  }

  String? _emailValidator(String? value) {
    var regex = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
    if (value == null || value.isEmpty || !regex.hasMatch(value)) {
      return 'Please enter your email';
    }
    return null;
  }

  String? _passwordValidator(String? value) {
    var hasUppercase = RegExp(r'[A-Z]');
    var hasLowercase = RegExp(r'[a-z]');
    var hasDigit = RegExp(r'[0-9]');
    var hasSpecialChar = RegExp(r'[!@#$%^&*(),.?":{}|<>]');
    if (value == null ||
        value.isEmpty ||
        !hasUppercase.hasMatch(value) ||
        !hasLowercase.hasMatch(value) ||
        !hasDigit.hasMatch(value) ||
        !hasSpecialChar.hasMatch(value)) {
      return 'Please enter a valid Password';
    }
    return null;
  }

  String? _confirmPasswordValidator(String? value) {
    if (value != _passwordController.text) {
      return 'Passwords do not match';
    }
    return null;
  }

  Future<void> _signupWithEmailAndPassword() async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );
    } on FirebaseAuthException catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              e.toString(),
            ),
          ),
        );
      }
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: Container(
          width: size.width * 1,
          height: size.height * 1,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('Assets/Images/page_view_3.png'),
                fit: BoxFit.cover),
          ),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    alignment: Alignment.bottomCenter,
                    decoration: BoxDecoration(
                      color: Colors.white.withAlpha(100),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                    ),
                    height: size.height * 0.7,
                    width: size.width,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Sign Up',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w800,
                              fontFamily: 'Poppins',
                              color: ColorExtension.primaryColor),
                        ),
                        SizedBox(
                          height: size.height * 0.015,
                        ),
                        Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              RoundedTextField(
                                hintText: 'Enter your name',
                                controller: _nameController,
                                validator: _nameValidator,
                              ),
                              SizedBox(
                                height: size.height * 0.015,
                              ),
                              RoundedTextField(
                                hintText: 'Enter your email or phone',
                                controller: _emailController,
                                validator: _emailValidator,
                              ),
                              SizedBox(
                                height: size.height * 0.015,
                              ),
                              RoundedTextField(
                                hintText: 'Enter your password',
                                controller: _passwordController,
                                validator: _passwordValidator,
                                obscureText: true,
                              ),
                              SizedBox(
                                height: size.height * 0.015,
                              ),
                              RoundedTextField(
                                hintText: 'Confirm your password',
                                controller: _confirmPasswordController,
                                validator: _confirmPasswordValidator,
                                obscureText: true,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.015,
                        ),
                        RoundedButton(
                          title: 'Sign up',
                          type: ButtonType.primary,
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              await _signupWithEmailAndPassword();

                              Navigator.pushAndRemoveUntil(
                                // ignore: use_build_context_synchronously
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const TabScreen(),
                                ),
                                (route) => false,
                              );
                            }
                          },
                        ),
                        SizedBox(
                          height: size.height * 0.015,
                        ),
                        Text('or login with'),
                        SizedBox(
                          height: size.height * 0.015,
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
                                    fontFamily: 'Poppins',
                                  ),
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
