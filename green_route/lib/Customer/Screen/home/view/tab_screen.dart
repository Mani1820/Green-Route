import 'package:flutter/material.dart';
import 'package:green_route/Common/color_extension.dart';
import 'package:green_route/Customer/Screen/home/widgets/tab_button.dart';
import 'package:green_route/Customer/Screen/Help/Views/help_screen.dart';
import 'package:green_route/Customer/Screen/Menu/views/menu_screen.dart';
import 'package:green_route/Customer/Screen/My%20Cart/cart_list_scree.dart';
import 'package:green_route/Customer/Screen/Profile/views/profile_screen.dart';
import 'package:green_route/Customer/Screen/home/view/home_screen.dart';

class TabScreen extends StatefulWidget {
  const TabScreen({super.key});
  

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  final PageStorageBucket bucket = PageStorageBucket();
  Widget bucketChild = HomeScreen();

  int selectedIndex = 2;
  openSnackBar() {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Under Development',
          style: TextStyle(
              color: Colors.white,
              fontFamily: 'poppins',
              fontWeight: FontWeight.bold),
        ),
        elevation: 30,
        backgroundColor: ColorExtension.primaryColor,
        duration: const Duration(seconds: 2),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            40,
          ),
        ),
        showCloseIcon: true,
        closeIconColor: Colors.white,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 10,
        surfaceTintColor: const Color.fromARGB(255, 245, 239, 164),
        child: Container(
          decoration: BoxDecoration(),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TabScreenButton(
                title: 'Menu',
                icon: Icons.menu_rounded,
                selectedPage: selectedIndex == 0,
                onTap: () {
                  openSnackBar();
                  setState(() {
                    selectedIndex = 0;
                    bucketChild = MenuScreen();
                  });
                },
              ),
              TabScreenButton(
                title: 'My Cart',
                icon: Icons.shopping_cart_rounded,
                selectedPage: selectedIndex == 3,
                onTap: () {
                  setState(() {
                    selectedIndex = 3;
                    bucketChild = CartListScreen();
                  });
                },
              ),
              const SizedBox(
                width: 35,
              ),
              TabScreenButton(
                title: 'Profile',
                icon: Icons.person_rounded,
                selectedPage: selectedIndex == 1,
                onTap: () {
                  setState(() {
                    selectedIndex = 1;
                    bucketChild = ProfileScreen();
                  });
                },
              ),
              TabScreenButton(
                title: 'Help',
                icon: Icons.help_rounded,
                selectedPage: selectedIndex == 4,
                onTap: () {
                  setState(() {
                    selectedIndex = 4;
                    bucketChild = HelpScreen();
                  });
                },
              ),
            ],
          ),
        ),
      ),
      body: PageStorage(
        bucket: bucket,
        child: bucketChild,
      ),
      floatingActionButton: FloatingActionButton(
        materialTapTargetSize: MaterialTapTargetSize.padded,
        backgroundColor: selectedIndex == 2
            ? ColorExtension.primaryColor
            : const Color.fromARGB(255, 211, 211, 207),
        shape: const CircleBorder(),
        onPressed: () {
          setState(() {
            selectedIndex = 2;
            bucketChild = HomeScreen();
          });
        },
        child: Icon(
          size: 40,
          Icons.home_rounded,
          color: Colors.white,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
    );
  }
}
