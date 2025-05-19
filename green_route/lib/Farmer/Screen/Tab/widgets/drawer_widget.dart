import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:green_route/Common/color_extension.dart';
import 'package:green_route/Customer/Screen/Auth/roll_check_screen.dart';
import 'package:green_route/Farmer/Screen/Drawer/profile_screen.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget(
      {super.key, required this.farmername, required this.farmeremail});

  final String farmername;
  final String farmeremail;

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  Future<void> onTapLogout() async {
    await FirebaseAuth.instance.signOut();
    if (mounted) {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => RollCheckScreen()),
          (_) => false);
    }
  }

  void onTapProfile() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => FarmerProfileScreen()));
  }

  void showSnackBar(String message) {
    final snackBar = SnackBar(
      content: Text(
        message,
        style: TextStyle(
          fontFamily: 'poppins',
        ),
      ),
      behavior: SnackBarBehavior.floating,
      duration: Duration(seconds: 2),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Drawer(
        elevation: 10,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(30),
            bottomRight: Radius.circular(30),
          ),
        ),
        child: Column(
          children: [
            Container(
              height: size.height * 0.17,
              width: size.width,
              color: ColorExtension.secondaryColor,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: onTapProfile,
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 10,
                          ),
                          child: CircleAvatar(
                            radius: 50,
                            backgroundColor: ColorExtension.primaryColor,
                            child: Icon(
                              Icons.person,
                              size: 50,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Column(
                          children: [
                            Text(
                              widget.farmername,
                              style: TextStyle(
                                fontFamily: 'poppins',
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              widget.farmeremail,
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontFamily: 'poppins',
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.notifications,
                color: ColorExtension.primaryColor,
              ),
              title: Text(
                'Notifications',
                style: TextStyle(
                  fontFamily: 'poppins',
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              ),
              onTap: () => showSnackBar('This feature is coming soon'),
            ),
            Divider(
              thickness: 1,
              color: const Color.fromARGB(255, 148, 148, 148),
            ),
            ListTile(
              leading: Icon(
                Icons.settings,
                color: ColorExtension.primaryColor,
              ),
              title: Text(
                'Settings',
                style: TextStyle(
                  fontFamily: 'poppins',
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              ),
              onTap: () => showSnackBar('This feature is coming soon'),
            ),
            Divider(
              thickness: 1,
              color: const Color.fromARGB(255, 148, 148, 148),
            ),
            ListTile(
              leading: Icon(
                Icons.feedback,
                color: ColorExtension.primaryColor,
              ),
              title: Text(
                'Feedback',
                style: TextStyle(
                  fontFamily: 'poppins',
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              ),
              onTap: () => showSnackBar('This feature is coming soon'),
            ),
            Divider(
              thickness: 1,
              color: const Color.fromARGB(255, 148, 148, 148),
            ),
            ListTile(
              leading: Icon(
                Icons.help,
                color: ColorExtension.primaryColor,
              ),
              title: Text(
                'Help',
                style: TextStyle(
                  fontFamily: 'poppins',
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              ),
              onTap: () => showSnackBar('This feature is coming soon'),
            ),
            Divider(
              thickness: 1,
              color: const Color.fromARGB(255, 148, 148, 148),
            ),
            ListTile(
              leading: Icon(
                Icons.logout,
                color: ColorExtension.primaryColor,
              ),
              title: Text(
                'Logout',
                style: TextStyle(
                  fontFamily: 'poppins',
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              ),
              onTap: onTapLogout,
            ),
          ],
        ),
      ),
    );
  }
}
