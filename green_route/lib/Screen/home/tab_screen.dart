import 'package:flutter/material.dart';
import 'package:green_route/Common/color_extension.dart';
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
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    bottomRow = Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () {
              setState(() {
                _selectedIndex = 0;
                bucketChild = HomeScreen();
              });
            },
            child: Column(
              children: [
                Icon(
                  Icons.menu,
                ),
                Text('Menu'),
              ],
            ),
          ),
        ),
        Expanded(
          child: GestureDetector(
            onTap: () {
              setState(() {
                _selectedIndex = 1;
                bucketChild = HomeScreen();
              });
            },
            child: Column(
              children: [
                Icon(
                  Icons.menu,
                ),
                Text('Menu'),
              ],
            ),
          ),
        ),
        Expanded(
          child: GestureDetector(
            onTap: () {
              setState(() {
                _selectedIndex = 3;
                bucketChild = HomeScreen();
              });
            },
            child: Column(
              children: [
                Icon(
                  Icons.menu,
                ),
                Text('Menu'),
              ],
            ),
          ),
        ),
        Expanded(
          child: GestureDetector(
            onTap: () {
              setState(() {
                _selectedIndex = 4;
                bucketChild = HomeScreen();
              });
            },
            child: Column(
              children: [
                Icon(
                  Icons.menu,
                ),
                Text('Menu'),
              ],
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
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
      floatingActionButton: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: _selectedIndex == 2
              ? Colors.white
              : const Color.fromARGB(246, 137, 137, 137),
        ),
        child: IconButton(
          icon: Icon(
            Icons.home_rounded,
            color: _selectedIndex == 2
                ? ColorExtension.primaryColor
                : const Color.fromARGB(246, 205, 205, 205),
          ),
          onPressed: () {
            setState(() {
              _selectedIndex = 2;
              bucketChild = HomeScreen();
            });
          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
    );
  }
}
