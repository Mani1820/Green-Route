import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:green_route/Common/color_extension.dart';
import 'package:green_route/Common_Widget/rounded_button.dart';
import 'package:green_route/Common_Widget/rounded_text_field.dart';
import 'package:green_route/Farmer/Screen/Auth/login_screen.dart';
import 'package:green_route/Farmer/Screen/Edit%20info/edit_info.dart';
import 'package:green_route/core/utils/validations.dart';

class FarmerSignUpScreen extends StatefulWidget {
  const FarmerSignUpScreen({super.key});

  @override
  State<FarmerSignUpScreen> createState() => _FarmerSignUpScreenState();
}

class _FarmerSignUpScreenState extends State<FarmerSignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();

  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  String? _confirmPasswordValidator(String? value) {
    if (value != passwordController.text) {
      return 'Passwords do not match';
    }
    return null;
  }

  Future<void> _signupWithEmailAndPassword() async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
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
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            alignment: Alignment.center,
            width: size.width,
            height: size.height * 1,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  'Assets/Images/page_view_3.png',
                ),
                fit: BoxFit.cover,
              ),
            ),
            child: SingleChildScrollView(
              child: Container(
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(horizontal: size.width * 0.07),
                height: size.height * 0.78,
                decoration: BoxDecoration(
                  color: Colors.white.withAlpha(120),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: size.height * 0.03,
                    ),
                    Text(
                      'Register',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'poppins',
                        color: ColorExtension.primarytextColor,
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          RoundedTextField(
                            hintText: 'Name',
                            controller: nameController,
                            prefixIcon: Icon(Icons.person),
                            validator: nameValidator,
                          ),
                          SizedBox(
                            height: size.height * 0.02,
                          ),
                          RoundedTextField(
                            hintText: 'Email',
                            controller: emailController,
                            prefixIcon: Icon(Icons.email),
                            validator: emailValidator,
                          ),
                          SizedBox(
                            height: size.height * 0.02,
                          ),
                          RoundedTextField(
                            hintText: 'Password',
                            controller: passwordController,
                            prefixIcon: Icon(Icons.lock),
                            validator: passwordValidator,
                          ),
                          SizedBox(
                            height: size.height * 0.02,
                          ),
                          RoundedTextField(
                            hintText: 'Confirm Password',
                            controller: confirmPasswordController,
                            prefixIcon: Icon(Icons.lock),
                            validator: _confirmPasswordValidator,
                          ),
                          SizedBox(
                            height: size.height * 0.02,
                          ),
                          RoundedButton(
                            title: 'Signup',
                            onPressed: () {
                              if (!_formKey.currentState!.validate()) {
                                //_signupWithEmailAndPassword();
                                Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => FarmerEditInfo(),
                                  ),
                                  (route) => false,
                                );
                              }
                            },
                            type: ButtonType.primary,
                          ),
                          SizedBox(
                            height: size.height * 0.02,
                          ),
                          Text(
                            'or Register with',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Poppins',
                              color: ColorExtension.primarytextColor,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 20,
                            ),
                            child: InkWell(
                              onTap: () {},
                              child: Container(
                                width: size.width * 1,
                                height: size.height * 0.055,
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
                                        builder: (context) =>
                                            FarmerLoginScreen(),
                                      ),
                                      (_) => false);
                                },
                                child: Text(
                                  'Login',
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
        ],
      ),
    );
  }
}
