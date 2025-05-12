import 'package:flutter/material.dart';
import 'package:green_route/Common/color_extension.dart';

class FarmerMyEarnings extends StatefulWidget {
  const FarmerMyEarnings({super.key});

  @override
  State<FarmerMyEarnings> createState() => _FarmerMyEarningsState();
}

class _FarmerMyEarningsState extends State<FarmerMyEarnings> {
  final List myEarnings = [];

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 5,
        surfaceTintColor: ColorExtension.primaryColor,
        title: Text(
          'My Earnings',
          style: TextStyle(
            color: ColorExtension.primarytextColor,
            fontFamily: 'poppins',
            fontWeight: FontWeight.w600,
            fontSize: 25,
          ),
        ),
      ),
      body: LayoutBuilder(builder: (context, constraints) {
        return myEarnings.isEmpty
            ? Center(
                child: Text('No Earnings for now',
                    style: TextStyle(
                      fontFamily: 'poppins',
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: ColorExtension.secondarytextColor,
                    )),
              )
            : SingleChildScrollView(
                child: SafeArea(
                  child: ListView.builder(
                    itemCount: myEarnings.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: size.width * 0.04),
                        height: size.height * 0.13,
                        width: size.width * 0.25,
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
                  ),
                ),
              );
      }),
    );
  }
}
