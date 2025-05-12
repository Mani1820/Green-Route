import 'package:flutter/material.dart';
import 'package:green_route/Common/color_extension.dart';
import 'package:green_route/Common_Widget/rounded_text_field.dart';
import 'package:green_route/Common_Widget/textlable.dart';

class FarmerEditProfile extends StatefulWidget {
  const FarmerEditProfile({super.key});

  @override
  State<FarmerEditProfile> createState() => _FarmerEditProfileState();
}

class _FarmerEditProfileState extends State<FarmerEditProfile> {
  final formkey = GlobalKey<FormState>();
  final namecontroller = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final addressController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 5,
        surfaceTintColor: ColorExtension.primaryColor,
        title: Text(
          'Edit Profile',
          style: TextStyle(
            color: ColorExtension.primarytextColor,
            fontFamily: 'poppins',
            fontWeight: FontWeight.w600,
            fontSize: 25,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 40,
          ),
          Textlable(text: 'Farmer Name'),
          RoundedTextField(
            hintText: 'Eg. Kumar',
            controller: namecontroller,
          ),
          Textlable(text: 'Email'),
          RoundedTextField(
            hintText: 'Eg. kumar@gmail.com',
            controller: emailController,
          ),
          Textlable(text: 'Phone Number'),
          RoundedTextField(
            hintText: 'Eg. 1234567890',
            controller: phoneController,
          ),
          Textlable(text: 'Address'),
          RoundedTextField(
            hintText: 'Address',
            controller: addressController,
          ),
        ],
      ),
      bottomNavigationBar: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Container(
          height: size.height * 0.07,
          width: size.width,
          decoration: BoxDecoration(
            color: ColorExtension.primaryColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: Center(
            child: Text(
              'Save',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
