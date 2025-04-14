import 'package:flutter/material.dart';
import 'package:green_route/Common/color_extension.dart';
import 'package:green_route/Common_Widget/tab_button.dart';
import 'package:green_route/Screen/home/home_screen.dart';

class TabScreen extends StatefulWidget {
  const TabScreen({super.key});

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  final PageStorageBucket bucket = PageStorageBucket();
  Widget bucketChild = HomeScreen();

  late Widget bottomRow;
  int _selectedIndex = 2;

  @override
  void initState() {
    super.initState();

    bottomRow = Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        TabScreenButton(
          title: 'Menu',
          icon: Icons.home_rounded,
          selectedPage: _selectedIndex == 0,
          onTap: () {
            setState(() {
              _selectedIndex = 0;
              bucketChild = HomeScreen();
            });
          },
        ),
        TabScreenButton(
          title: 'Profile',
          icon: Icons.person_rounded,
          selectedPage: _selectedIndex == 1,
          onTap: () {
            setState(() {
              _selectedIndex = 1;
              bucketChild = HomeScreen();
            });
          },
        ),
        const SizedBox(
          width: 35,
        ),
        TabScreenButton(
          title: 'Settings',
          icon: Icons.settings_rounded,
          selectedPage: _selectedIndex == 3,
          onTap: () {
            setState(() {
              _selectedIndex = 3;
              bucketChild = HomeScreen();
            });
          },
        ),
        TabScreenButton(
          title: 'Help',
          icon: Icons.help_rounded,
          selectedPage: _selectedIndex == 4,
          onTap: () {
            setState(() {
              _selectedIndex = 4;
              bucketChild = HomeScreen();
            });
          },
        ),
      ],
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
          child: bottomRow,
        ),
      ),
      body: PageStorage(
        bucket: bucket,
        child: bucketChild,
      ),
      floatingActionButton: FloatingActionButton(
        materialTapTargetSize: MaterialTapTargetSize.padded,
        backgroundColor: _selectedIndex == 2
            ? ColorExtension.primaryColor
            : const Color.fromARGB(255, 211, 211, 207),
        shape: const CircleBorder(),
        onPressed: () {
          setState(() {
            _selectedIndex = 2;
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
