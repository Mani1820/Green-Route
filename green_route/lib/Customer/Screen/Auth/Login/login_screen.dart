import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:green_route/Common/color_extension.dart';
import 'package:green_route/Common_Widget/rounded_button.dart';
import 'package:green_route/Common_Widget/rounded_text_field.dart';
import 'package:green_route/Customer/Screen/Auth/Signup/signup_screen.dart';
import 'package:green_route/Customer/Screen/home/view/tab_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final formKey = GlobalKey<FormState>();

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

  Future<void> _loginWithEmailAndPassword() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
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
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: size.width,
        height: size.height * 1,
        decoration: BoxDecoration(
            color: ColorExtension.primaryColor,
            image: DecorationImage(
              image: AssetImage(
                'Assets/Images/page_view_3.png',
              ),
              fit: BoxFit.cover,
            )),
        child: Center(
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.white.withAlpha(100),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            height: size.height * 0.64,
            width: size.width,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  Text(
                    'Login',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Poppins',
                        color: Colors.black),
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  Form(
                    key: formKey,
                    child: Column(
                      children: [
                        RoundedTextField(
                          hintText: 'Enter your email or phone',
                          controller: _emailController,
                          validator: _emailValidator,
                        ),
                        SizedBox(
                          height: 17,
                        ),
                        RoundedTextField(
                          hintText: 'Enter your password',
                          controller: _passwordController,
                          obscureText: true,
                          validator: _passwordValidator,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 17,
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Text(
                      'Forgot Password?',
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Poppins',
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 17,
                  ),
                  RoundedButton(
                    title: 'Login',
                    type: ButtonType.primary,
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        _loginWithEmailAndPassword();
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const TabScreen(),
                            ),
                            (route) => false);
                      }
                    },
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
      ),
    );
  }
}
