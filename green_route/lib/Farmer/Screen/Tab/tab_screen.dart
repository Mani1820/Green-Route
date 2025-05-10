import 'package:flutter/material.dart';
import 'package:green_route/Common/color_extension.dart';
import 'package:green_route/Farmer/Screen/Tab/home_screen.dart';
import 'package:green_route/Farmer/Screen/Tab/insights_screen.dart';
import 'package:green_route/Farmer/Screen/Tab/products_screen.dart';

class FarmerTabScreen extends StatefulWidget {
  const FarmerTabScreen({super.key, this.index});

  final int? index;

  @override
  State<FarmerTabScreen> createState() => _FarmerTabScreenState();
}

class _FarmerTabScreenState extends State<FarmerTabScreen> {
  final List<Widget> screens = const [
    FarmerHomeScreen(),
    FarmerInsightsScreen(),
    FarmerProductScreen()
  ];
  int? currentIndex;

  @override
  void initState() {
    currentIndex = widget.index ?? 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex!],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
            activeIcon: Icon(
              Icons.home,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.insights_outlined),
            label: 'Insights',
            activeIcon: Icon(
              Icons.insights,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag_outlined),
            label: 'Products',
            activeIcon: Icon(Icons.shopping_bag),
          ),
        ],
        selectedItemColor: const Color.fromARGB(255, 0, 0, 0),
        unselectedItemColor: const Color.fromARGB(255, 255, 255, 255),
        backgroundColor: ColorExtension.primaryColor,
        currentIndex: currentIndex!,
        iconSize: 30,
        onTap: (value) {
          setState(() {
            currentIndex = value;
          });
        },
      ),
    );
  }
}
