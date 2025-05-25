import 'package:flutter/material.dart';
import 'package:green_route/Common/color_extension.dart';
import 'package:green_route/Farmer/Screen/Tab/widgets/drawer_widget.dart';

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
        elevation: 4,
        surfaceTintColor: ColorExtension.primaryColor,
        title: Text(
          'Welcome ',
          style: TextStyle(
            fontFamily: 'poppins',
            fontSize: 25,
            fontWeight: FontWeight.w600,
          ),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(size.height * 0.06),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 70,
                ),
                child: GestureDetector(
                  onTap: () {},
                  child: Row(
                    children: [
                      Text(
                        'location',
                        style: TextStyle(
                            fontFamily: 'poppins',
                            fontSize: 15,
                            fontWeight: FontWeight.w500),
                      ),
                      Icon(
                        Icons.arrow_drop_down,
                        color: ColorExtension.primaryColor,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.02,
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
          child: StatefulBuilder(
            builder: (context, setState) {
              return currentIndex == 0
                  ? pendingOrders.isEmpty
                      ? Center(child: Text('No Pending Orders'))
                      : Center(child: Text('Pending Orders1'))
                  : confirmedOrders.isEmpty
                      ? Center(child: Text('No Confirmed Orders'))
                      : Center(child: Text('Confirmed Orders1'));
            },
          ),
        ),
      ),
      drawer: DrawerWidget(
        farmeremail:
            'Mani', //-----------------should be changed dynamically------------------
        farmername: 'Mani',
      ),
    );
  }
}
