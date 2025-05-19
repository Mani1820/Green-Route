import 'package:flutter/material.dart';
import 'package:green_route/Common/color_extension.dart';
import 'package:green_route/Customer/Screen/Auth/roll_check_screen.dart';
import 'package:green_route/Data/intro_screen_data.dart';
//import 'package:green_route/Customer/Screen/Onboarding/Login/login_screen.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  int _currentIndex = 0;
  final controller = PageController();

  @override
  void initState() {
    controller.addListener(() {
      setState(() {
        _currentIndex = controller.page?.floor() ?? 0;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          PageView.builder(
              controller: controller,
              itemCount: introScreenData.length,
              onPageChanged: (index) {},
              itemBuilder: (context, index) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: size.width * 1,
                      child: Image.asset(
                        introScreenData[index].imagePath,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Text(
                        introScreenData[index].title,
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w700,
                            color: ColorExtension.primarytextColor,
                            fontFamily: 'Poppins'),
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    Text(
                      introScreenData[index].description,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          color: ColorExtension.secondarytextColor,
                          fontFamily: 'Poppins'),
                    ),
                    SizedBox(
                      height: size.height * 0.05,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        introScreenData.length,
                        (index) => AnimatedContainer(
                          duration: Duration(milliseconds: 100),
                          margin: const EdgeInsets.only(right: 5),
                          width: _currentIndex == index ? 20 : 10,
                          height: 10,
                          decoration: BoxDecoration(
                            color: _currentIndex == index
                                ? ColorExtension.primaryColor
                                : Colors.grey,
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              }),
          Positioned(
            bottom: 15,
            right: 13,
            child: Row(
              children: [
                ElevatedButton(
                  onPressed: () {
                    _currentIndex < introScreenData.length - 1
                        ? controller.animateToPage(_currentIndex + 1,
                            duration: Duration(milliseconds: 500),
                            curve: Curves.easeInCirc)
                        : Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(
                                builder: (context) => RollCheckScreen()),
                            (route) => false);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ColorExtension.primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: Text(
                    _currentIndex < introScreenData.length - 1
                        ? 'Next'
                        : 'Login',
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
