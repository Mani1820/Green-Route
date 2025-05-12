import 'package:flutter/material.dart';
import 'package:green_route/Common/color_extension.dart';

class FarmerOrderHistory extends StatefulWidget {
  const FarmerOrderHistory({super.key});

  @override
  State<FarmerOrderHistory> createState() => _FarmerOrderHistoryState();
}

class _FarmerOrderHistoryState extends State<FarmerOrderHistory> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final List orderHistory = [];
    return Scaffold(
      appBar: AppBar(
        elevation: 5,
        surfaceTintColor: ColorExtension.primaryColor,
        title: Text(
          'Order History',
          style: TextStyle(
            color: ColorExtension.primarytextColor,
            fontFamily: 'poppins',
            fontWeight: FontWeight.w600,
            fontSize: 25,
          ),
        ),
      ),
      body: LayoutBuilder(builder: (context, constraints) {
        return orderHistory.isEmpty
            ? Center(
                child: Text(
                  'No Order History!',
                  style: TextStyle(
                    fontFamily: 'poppins',
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: ColorExtension.secondarytextColor,
                  ),
                ),
              )
            : Column(
                children: [
                  ListView.builder(
                    itemCount: orderHistory.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Container(
                        height: size.height * 0.2,
                        width: size.width,
                        margin: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 255, 255, 255),
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: const Color.fromARGB(212, 184, 184, 184),
                              spreadRadius: 3,
                              blurRadius: 7,
                              offset:
                                  Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                      );
                    },
                  )
                ],
              );
      }),
    );
  }
}
