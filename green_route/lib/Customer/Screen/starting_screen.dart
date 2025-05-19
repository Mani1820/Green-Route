import 'package:flutter/material.dart';
import 'package:green_route/Common/color_extension.dart';
import 'package:green_route/Common_Widget/rounded_button.dart';
import 'package:green_route/Customer/Screen/Auth/intro_screen.dart';

class StartingScreen extends StatefulWidget {
  const StartingScreen({super.key});

  @override
  State<StartingScreen> createState() => _StartingScreenState();
}

class _StartingScreenState extends State<StartingScreen> {
  double _opacity = 0.0;

  @override
  void initState() {
    super.initState();
    _fadeIn();
  }

  void _fadeIn() {
    Future.delayed(Duration.zero, () {
      setState(() {
        _opacity = 1.0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: SafeArea(
          child: AnimatedOpacity(
            opacity: _opacity,
            duration: Duration(seconds: 2),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  'Welcome to ',
                  style: TextStyle(
                    fontSize: 30,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.bold,
                    color: ColorExtension.primarytextColor,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Green',
                      style: TextStyle(
                        fontSize: 30,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.bold,
                        color: ColorExtension.primaryColor,
                      ),
                    ),
                    Text(
                      ' Route',
                      style: TextStyle(
                        fontSize: 30,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.bold,
                        color: ColorExtension.secondaryColor,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 25,
                  ),
                  child: Text(
                      'Navigate smarter with Green Route your eco-friendly companion for efficient sustainable journeys!',
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: 'Poppins',
                        color: ColorExtension.secondarytextColor,
                      ),
                      textAlign: TextAlign.center),
                ),
                SizedBox(
                  height: 20,
                ),
                Image.asset(
                  'Assets/Images/starting_screen_img.png',
                  width: size.width * 0.8,
                ),
                SizedBox(
                  height: size.height * 0.05,
                ),
                RoundedButton(
                  title: 'Get started',
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const IntroScreen()),
                      (route) => false,
                    );
                  },
                  type: ButtonType.primary,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
