import 'package:flutter/material.dart';
import 'package:green_route/Common/color_extension.dart';
import 'package:green_route/Common_Widget/rounded_text_field.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final oldPasswordController = TextEditingController();
  final newPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    oldPasswordController.dispose();
    newPasswordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Edit Profile',
          style: TextStyle(
              color: ColorExtension.primarytextColor,
              fontFamily: 'poppins',
              fontWeight: FontWeight.bold,
              fontSize: 25),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
            child: Text(
              'personal info',
              style: TextStyle(
                color: ColorExtension.primarytextColor,
                fontFamily: 'poppins',
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
          RoundedTextField(
            hintText: 'Name',
            controller: nameController,
            prefixIcon: Icon(Icons.person, color: ColorExtension.primaryColor),
          ),
          SizedBox(
            height: 20,
          ),
          RoundedTextField(
            hintText: 'Email',
            controller: emailController,
            prefixIcon: Icon(Icons.email, color: ColorExtension.primaryColor),
          ),
          SizedBox(
            height: 20,
          ),
          RoundedTextField(
            hintText: 'Phone',
            controller: phoneController,
            prefixIcon: Icon(Icons.phone, color: ColorExtension.primaryColor),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
            child: Text(
              'password',
              style: TextStyle(
                color: ColorExtension.primarytextColor,
                fontFamily: 'poppins',
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
          RoundedTextField(
            hintText: 'Old Password',
            controller: oldPasswordController,
            obscureText: true,
            prefixIcon: Icon(Icons.lock, color: ColorExtension.primaryColor),
          ),
          SizedBox(
            height: 20,
          ),
          RoundedTextField(
            hintText: 'New Password',
            controller: newPasswordController,
            obscureText: true,
            prefixIcon: Icon(Icons.lock, color: ColorExtension.primaryColor),
          ),
          SizedBox(
            height: 20,
          ),
          RoundedTextField(
            hintText: 'Confirm Password',
            controller: confirmPasswordController,
            obscureText: true,
            prefixIcon: Icon(Icons.lock, color: ColorExtension.primaryColor),
          ),
        ],
      ),
      bottomNavigationBar: Container(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
          child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(
                  ColorExtension.primaryColor,
                ),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                'Save Changes',
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'poppins',
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                ),
              ))),
    );
  }
}
