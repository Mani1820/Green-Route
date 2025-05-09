import 'package:flutter/material.dart';
import 'package:green_route/Common/color_extension.dart';
import 'package:green_route/Common_Widget/rounded_button.dart';
import 'package:green_route/Common_Widget/rounded_text_field.dart';
import 'package:green_route/Farmer/Screen/Tab/tab_screen.dart';

class FarmerEditInfo extends StatefulWidget {
  const FarmerEditInfo({super.key});

  @override
  State<FarmerEditInfo> createState() => _FarmerEditInfoState();
}

class _FarmerEditInfoState extends State<FarmerEditInfo> {
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final addressController = TextEditingController();
  final phoneController = TextEditingController();
  final upiIdController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    addressController.dispose();
    phoneController.dispose();
    upiIdController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Edit Info',
          style: TextStyle(
            color: ColorExtension.primarytextColor,
            fontFamily: 'poppins',
            fontWeight: FontWeight.w600,
            fontSize: 25,
          ),
        ),
        forceMaterialTransparency: true,
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            height: size.height * 1,
            width: size.width,
            decoration: BoxDecoration(
                image: DecorationImage(
              image: AssetImage(
                'Assets/Images/background.png',
              ),
              fit: BoxFit.cover,
            )),
            margin: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      RoundedTextField(
                        hintText: 'Name',
                        controller: nameController,
                        prefixIcon: Icon(
                          Icons.person,
                          color: ColorExtension.primarytextColor,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      RoundedTextField(
                        hintText: 'Address',
                        controller: addressController,
                        prefixIcon: Icon(
                          Icons.location_on,
                          color: ColorExtension.primarytextColor,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      RoundedTextField(
                        hintText: 'Phone',
                        controller: phoneController,
                        prefixIcon: Icon(
                          Icons.phone,
                          color: ColorExtension.primarytextColor,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      RoundedTextField(
                        hintText: 'Upi id',
                        controller: upiIdController,
                        prefixIcon: Icon(
                          Icons.account_balance_wallet_outlined,
                          color: ColorExtension.primarytextColor,
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.05,
                      ),
                      RoundedButton(
                        title: 'Save',
                        type: ButtonType.primary,
                        onPressed: () {
                          Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(
                                builder: (ctx) => const FarmerTabScreen(),
                              ),
                              (route) => false);
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
