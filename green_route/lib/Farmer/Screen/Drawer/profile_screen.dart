import 'package:flutter/material.dart';
import 'package:green_route/Common/color_extension.dart';
import 'package:green_route/Farmer/Screen/Profile/change_password.dart';
import 'package:green_route/Farmer/Screen/Profile/edit_profile.dart';
import 'package:green_route/Farmer/Screen/Profile/my_earnings.dart';
import 'package:green_route/Farmer/Screen/Profile/my_orders_history.dart';

class FarmerProfileScreen extends StatefulWidget {
  const FarmerProfileScreen({super.key});

  @override
  State<FarmerProfileScreen> createState() => _FarmerProfileScreenState();
}

class _FarmerProfileScreenState extends State<FarmerProfileScreen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 4,
        surfaceTintColor: ColorExtension.primaryColor,
        title: Text(
          'Profile',
          style: TextStyle(
            fontFamily: 'poppins',
            fontSize: 25,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Container(
        width: size.width,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              'Assets/Images/background.png',
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 20,
                horizontal: 20,
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundColor: ColorExtension.primaryColor,
                    child: Icon(
                      Icons.person,
                      color: Colors.white,
                      size: 50,
                    ),
                  ),
                  SizedBox(
                    width: size.width * 0.05,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Farmer Name',
                        style: TextStyle(
                          fontFamily: 'poppins',
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        'Location',
                        style: TextStyle(
                          fontFamily: 'poppins',
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Divider(
              thickness: 0.5,
              color: Colors.black,
              indent: size.width * 0.07,
              endIndent: size.width * 0.07,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 10,
              ),
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => FarmerEditProfile(),
                    ),
                  );
                },
                child: Row(
                  children: [
                    Icon(
                      Icons.edit_document,
                      color: ColorExtension.secondaryColor,
                    ),
                    SizedBox(
                      width: size.width * 0.05,
                    ),
                    Text(
                      'Edit Profile',
                      style: TextStyle(
                        fontFamily: 'poppins',
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Divider(
              thickness: 0.5,
              color: Colors.black,
              indent: size.width * 0.07,
              endIndent: size.width * 0.07,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 10,
              ),
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => FarmerOrderHistory(),
                    ),
                  );
                },
                child: Row(
                  children: [
                    Icon(
                      Icons.history,
                      color: ColorExtension.secondaryColor,
                    ),
                    SizedBox(
                      width: size.width * 0.05,
                    ),
                    Text(
                      'My Orders history',
                      style: TextStyle(
                        fontFamily: 'poppins',
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Divider(
              thickness: 0.5,
              color: Colors.black,
              indent: size.width * 0.07,
              endIndent: size.width * 0.07,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 10,
              ),
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => FarmerMyEarnings(),
                    ),
                  );
                },
                child: Row(
                  children: [
                    Icon(
                      Icons.currency_rupee,
                      color: ColorExtension.secondaryColor,
                    ),
                    SizedBox(
                      width: size.width * 0.05,
                    ),
                    Text(
                      'My earnings',
                      style: TextStyle(
                        fontFamily: 'poppins',
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Divider(
              thickness: 0.5,
              color: Colors.black,
              indent: size.width * 0.07,
              endIndent: size.width * 0.07,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 10,
              ),
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => FarmerChangePassword(),
                    ),
                  );
                },
                child: Row(
                  children: [
                    Icon(
                      Icons.lock,
                      color: ColorExtension.secondaryColor,
                    ),
                    SizedBox(
                      width: size.width * 0.05,
                    ),
                    Text(
                      'Change Password',
                      style: TextStyle(
                        fontFamily: 'poppins',
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Divider(
              thickness: 0.5,
              color: Colors.black,
              indent: size.width * 0.07,
              endIndent: size.width * 0.07,
            ),
          ],
        ),
      ),
    );
  }
}
