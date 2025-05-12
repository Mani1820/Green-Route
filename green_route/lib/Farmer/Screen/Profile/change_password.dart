import 'package:flutter/material.dart';
import 'package:green_route/Common/color_extension.dart';
import 'package:green_route/Common_Widget/rounded_button.dart';
import 'package:green_route/Common_Widget/rounded_text_field.dart';
import 'package:green_route/Common_Widget/textlable.dart';
import 'package:green_route/core/utils/validations.dart';

class FarmerChangePassword extends StatefulWidget {
  const FarmerChangePassword({super.key});

  @override
  State<FarmerChangePassword> createState() => _FarmerChangePasswordState();
}

class _FarmerChangePasswordState extends State<FarmerChangePassword> {
  final _formKey = GlobalKey<FormState>();
  final oldPasswordController = TextEditingController();
  final newPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    oldPasswordController.dispose();
    newPasswordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  void onSave() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 5,
        surfaceTintColor: ColorExtension.primaryColor,
        title: Text(
          'Change Password',
          style: TextStyle(
            color: ColorExtension.primarytextColor,
            fontFamily: 'poppins',
            fontWeight: FontWeight.w600,
            fontSize: 25,
          ),
        ),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Textlable(text: 'Old Password'),
              RoundedTextField(
                hintText: 'Old Password',
                controller: oldPasswordController,
                obscureText: true,
                validator: passwordValidator,
              ),
              SizedBox(
                height: 20,
              ),
              Textlable(text: 'New Password'),
              RoundedTextField(
                hintText: 'New Password',
                controller: newPasswordController,
                obscureText: true,
                validator: passwordValidator,
              ),
              SizedBox(
                height: 20,
              ),
              Textlable(text: 'Confirm Password'),
              RoundedTextField(
                hintText: 'Confirm Password',
                controller: confirmPasswordController,
                obscureText: true,
                validator: passwordValidator,
              ),
              SizedBox(
                height: 20,
              ),
              RoundedButton(
                title: 'Save',
                onPressed: onSave,
                type: ButtonType.primary,
              ),
              Padding(
                padding: EdgeInsets.all(20),
                child: Text(
                  '*Password must be at least 8 characters\nwith at least one uppercase letter\nwith at least one number\nand one special character',
                  style: TextStyle(
                      color: ColorExtension.secondarytextColor,
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'poppins'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
