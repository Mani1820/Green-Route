//Email validation in login

import 'package:flutter/widgets.dart';

String? emailValidator(String? value) {
  var regex = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
  if (value == null || value.isEmpty || !regex.hasMatch(value)) {
    return 'Please enter your email';
  }
  return null;
}

//password validation in login

String? passwordValidator(String? value) {
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

//confirm password validation in signup
String? confirmPasswordValidator(
    String? value, TextEditingController passwordController) {
  if (value != passwordController.text) {
    return 'Passwords do not match';
  }
  return null;
}

//name validation in signup
String? nameValidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter your name';
  }
  return null;
}
