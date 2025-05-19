import 'package:flutter/material.dart';
import 'package:green_route/Common/color_extension.dart';
import 'package:green_route/Common_Widget/rounded_button.dart';
import 'package:green_route/Customer/Screen/Auth/Login/login_screen.dart';
import 'package:green_route/Farmer/Screen/Auth/login_screen.dart';

class RollCheckScreen extends StatefulWidget {
  const RollCheckScreen({super.key});

  @override
  State<RollCheckScreen> createState() => _RollCheckScreenState();
}

class _RollCheckScreenState extends State<RollCheckScreen> {
  int? currentIndex;
  void showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: TextStyle(
            fontFamily: 'poppins',
            fontSize: 15,
            fontWeight: FontWeight.w500,
          ),
        ),
        duration: Duration(seconds: 2),
        backgroundColor: ColorExtension.primaryColor,
        closeIconColor: ColorExtension.primarytextColor,
        elevation: 10,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                'Assets/Images/background.png',
              ),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Are You a? ',
                style: TextStyle(
                    fontFamily: 'poppins',
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: size.height * 0.05,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        currentIndex = 0;
                      });
                    },
                    child: AnimatedContainer(
                      alignment: Alignment.center,
                      duration: Duration(milliseconds: 500),
                      height: size.height * 0.15,
                      width: size.width * 0.3,
                      decoration: BoxDecoration(
                        color: currentIndex == 0
                            ? ColorExtension.primaryColor
                            : Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            blurRadius: 5,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Text('Farmer',
                          style: TextStyle(
                            fontFamily: 'poppins',
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: currentIndex == 0
                                ? Colors.white
                                : ColorExtension.primaryColor,
                          )),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        currentIndex = 1;
                      });
                    },
                    child: AnimatedContainer(
                      alignment: Alignment.center,
                      duration: Duration(milliseconds: 500),
                      height: size.height * 0.15,
                      width: size.width * 0.3,
                      decoration: BoxDecoration(
                        color: currentIndex == 1
                            ? ColorExtension.primaryColor
                            : Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            blurRadius: 5,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Text(
                        'Customer',
                        style: TextStyle(
                          fontFamily: 'poppins',
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: currentIndex == 1
                              ? Colors.white
                              : ColorExtension.primaryColor,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: size.height * 0.1,
              ),
              RoundedButton(
                title: 'Next',
                onPressed: () {
                  if (currentIndex == 0) {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (context) => FarmerLoginScreen()),
                        (_) => false);
                  } else if (currentIndex == 1) {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => LoginScreen()),
                        (_) => false);
                  } else {
                    showSnackBar('Please select an option');
                  }
                },
                type: ButtonType.secondary,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
