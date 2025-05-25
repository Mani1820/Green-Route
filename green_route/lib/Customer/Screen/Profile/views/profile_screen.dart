import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:green_route/Common/color_extension.dart';
import 'package:green_route/Customer/Screen/Profile/views/edit_profile_screen.dart';

import '../../Auth/roll_check_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  void logout() {
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => const RollCheckScreen()),
        (route) => false);
    FirebaseAuth.instance.signOut();
  }

  void showSnackbar() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('This feature is under development',
            style: TextStyle(fontFamily: 'poppins')),
        duration: Duration(seconds: 2),
        backgroundColor: ColorExtension.primaryColor,
        showCloseIcon: true,
        closeIconColor: ColorExtension.primarytextColor,
      ),
    );
  }

  void showAlertbox() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            'Logout',
            style: TextStyle(
              color: ColorExtension.primarytextColor,
              fontFamily: 'poppins',
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
          ),
          content: Text(
            'Are you sure you want to logout?',
            style: TextStyle(
              color: ColorExtension.secondarytextColor,
              fontFamily: 'poppins',
              fontWeight: FontWeight.w500,
              fontSize: 15,
            ),
          ),
          actions: [
            TextButton(
              child: Text(
                'Cancel',
                style: TextStyle(
                  color: ColorExtension.primarytextColor,
                  fontFamily: 'poppins',
                  fontWeight: FontWeight.w500,
                  fontSize: 15,
                ),
              ),
              onPressed: () => Navigator.of(context).pop(),
            ),
            TextButton(
              child: Text(
                'Logout',
                style: TextStyle(
                  color: ColorExtension.primaryColor,
                  fontFamily: 'poppins',
                  fontWeight: FontWeight.w500,
                  fontSize: 15,
                ),
              ),
              onPressed: () => logout(),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My Profile',
          style: TextStyle(
            color: ColorExtension.primarytextColor,
            fontFamily: 'poppins',
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Center(
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage('Assets/Images/profile.jpg'),
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  Text(
                    'User',
                    style: TextStyle(
                      color: ColorExtension.primarytextColor,
                      fontFamily: 'poppins',
                      fontWeight: FontWeight.w500,
                      fontSize: 22,
                    ),
                  ),
                  Text(
                    's9Kz6@example.com',
                    style: TextStyle(
                      color: ColorExtension.secondarytextColor,
                      fontFamily: 'poppins',
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.05,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
                    child: Container(
                      height: size.height * 0.07,
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 252, 254, 244)),
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const EditProfileScreen(),
                            ),
                          );
                        },
                        child: Row(
                          children: [
                            Icon(
                              Icons.person_rounded,
                              color: ColorExtension.primaryColor,
                              size: 35,
                            ),
                            SizedBox(
                              width: size.width * 0.15,
                            ),
                            Text(
                              'About Me',
                              style: TextStyle(
                                color: ColorExtension.primarytextColor,
                                fontFamily: 'poppins',
                                fontWeight: FontWeight.w500,
                                fontSize: 20,
                              ),
                            ),
                            Spacer(),
                            IconButton(
                              onPressed: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const EditProfileScreen(),
                                  ),
                                );
                              },
                              icon: Icon(
                                Icons.arrow_forward_ios,
                              ),
                              color: ColorExtension.primarytextColor,
                              iconSize: 20,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
                    child: Container(
                      height: size.height * 0.07,
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 252, 254, 244)),
                      child: InkWell(
                        onTap: showSnackbar,
                        child: Row(
                          children: [
                            Icon(
                              Icons.shopping_bag_rounded,
                              color: ColorExtension.primaryColor,
                              size: 35,
                            ),
                            SizedBox(
                              width: size.width * 0.15,
                            ),
                            Text(
                              'My Orders',
                              style: TextStyle(
                                color: ColorExtension.primarytextColor,
                                fontFamily: 'poppins',
                                fontWeight: FontWeight.w500,
                                fontSize: 20,
                              ),
                            ),
                            Spacer(),
                            IconButton(
                              onPressed: showSnackbar,
                              icon: Icon(
                                Icons.arrow_forward_ios,
                              ),
                              color: ColorExtension.primarytextColor,
                              iconSize: 20,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
                    child: Container(
                      height: size.height * 0.07,
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 252, 254, 244)),
                      child: InkWell(
                        onTap: showSnackbar,
                        child: Row(
                          children: [
                            Icon(
                              Icons.favorite_rounded,
                              color: ColorExtension.primaryColor,
                              size: 35,
                            ),
                            SizedBox(
                              width: size.width * 0.15,
                            ),
                            Text(
                              'My Wishlist',
                              style: TextStyle(
                                color: ColorExtension.primarytextColor,
                                fontFamily: 'poppins',
                                fontWeight: FontWeight.w500,
                                fontSize: 20,
                              ),
                            ),
                            Spacer(),
                            IconButton(
                              onPressed: showSnackbar,
                              icon: Icon(
                                Icons.arrow_forward_ios,
                              ),
                              color: ColorExtension.primarytextColor,
                              iconSize: 20,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
                    child: Container(
                      height: size.height * 0.07,
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 252, 254, 244)),
                      child: InkWell(
                        onTap: showSnackbar,
                        child: Row(
                          children: [
                            Icon(
                              Icons.location_on_rounded,
                              color: ColorExtension.primaryColor,
                              size: 35,
                            ),
                            SizedBox(
                              width: size.width * 0.15,
                            ),
                            Text(
                              'Change Address',
                              style: TextStyle(
                                color: ColorExtension.primarytextColor,
                                fontFamily: 'poppins',
                                fontWeight: FontWeight.w500,
                                fontSize: 20,
                              ),
                            ),
                            Spacer(),
                            IconButton(
                              onPressed: showSnackbar,
                              icon: Icon(
                                Icons.arrow_forward_ios,
                              ),
                              color: ColorExtension.primarytextColor,
                              iconSize: 20,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
                    child: Container(
                      height: size.height * 0.07,
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 252, 254, 244)),
                      child: Row(
                        children: [
                          Icon(
                            Icons.notifications_rounded,
                            color: ColorExtension.primaryColor,
                            size: 35,
                          ),
                          SizedBox(
                            width: size.width * 0.15,
                          ),
                          Text(
                            'Notification',
                            style: TextStyle(
                              color: ColorExtension.primarytextColor,
                              fontFamily: 'poppins',
                              fontWeight: FontWeight.w500,
                              fontSize: 20,
                            ),
                          ),
                          Spacer(),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.arrow_forward_ios,
                            ),
                            color: ColorExtension.primarytextColor,
                            iconSize: 20,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: Container(
                      height: size.height * 0.07,
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 252, 254, 244)),
                      child: InkWell(
                        onTap: showAlertbox,
                        child: Row(
                          children: [
                            Icon(
                              Icons.logout_rounded,
                              color: ColorExtension.primaryColor,
                              size: 35,
                            ),
                            SizedBox(
                              width: size.width * 0.15,
                            ),
                            Text(
                              'Sign Out',
                              style: TextStyle(
                                color: ColorExtension.primarytextColor,
                                fontFamily: 'poppins',
                                fontWeight: FontWeight.w500,
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Positioned(
              top: size.height * 0.07,
              left: size.width * 0.53,
              child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.camera_enhance_rounded,
                    size: 30,
                    color: ColorExtension.primaryColor,
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
