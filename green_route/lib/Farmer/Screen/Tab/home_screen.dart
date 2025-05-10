import 'package:flutter/material.dart';
import 'package:green_route/Common/color_extension.dart';

class FarmerHomeScreen extends StatefulWidget {
  const FarmerHomeScreen({super.key});

  @override
  State<FarmerHomeScreen> createState() => _FarmerHomeScreenState();
}

class _FarmerHomeScreenState extends State<FarmerHomeScreen>
    with TickerProviderStateMixin {
  late TabController tabController;

  int? currentIndex = 0;

  final List<Widget> tabs = [
    const Text(
      'Pending Orders',
      style: TextStyle(
        fontFamily: 'poppins',
        fontSize: 15,
        fontWeight: FontWeight.w500,
      ),
    ),
    const Text('Confirmed Orders',
        style: TextStyle(
          fontFamily: 'poppins',
          fontSize: 15,
          fontWeight: FontWeight.w500,
        )),
  ];

  final List pendingOrders = [];
  final List confirmedOrders = [];
  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(size.height * 0.1),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: Text(
                  'Welcome ',
                  style: TextStyle(
                      fontFamily: 'poppins',
                      fontSize: 25,
                      fontWeight: FontWeight.w600),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: Text(
                  'location',
                  style: TextStyle(
                      fontFamily: 'poppins',
                      fontSize: 15,
                      fontWeight: FontWeight.w500),
                ),
              ),
              SizedBox(
                height: size.height * 0.05,
              ),
              TabBar(
                tabs: tabs,
                controller: tabController,
                unselectedLabelColor: Colors.black,
                indicatorColor: ColorExtension.primaryColor,
                labelColor: Colors.black,
                indicatorWeight: 5,
                onTap: (value) {
                  setState(() {
                    currentIndex = value;
                  });
                },
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: size.height,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                'Assets/Images/background.png',
              ),
              fit: BoxFit.cover,
            ),
          ),
          child: currentIndex == 0
              ? Center(child: Text('Pending Orders'))
              : Center(child: Text('Confirmed Orders')),
        ),
      ),
    );
  }
}
