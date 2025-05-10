import 'package:flutter/material.dart';
import 'package:green_route/Common/color_extension.dart';

class FarmerProductScreen extends StatefulWidget {
  const FarmerProductScreen({super.key});

  @override
  State<FarmerProductScreen> createState() => _FarmerProductScreenState();
}

class _FarmerProductScreenState extends State<FarmerProductScreen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButton: Container(
        height: size.height * 0.06,
        width: size.width * 0.14,
        decoration: BoxDecoration(
          color: ColorExtension.primaryColor,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),
            topRight: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
        ),
        child: IconButton(
          onPressed: () {},
          icon: Icon(Icons.add, color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          Row(
            children: [
              Text(
                'Products',
                style: TextStyle(
                  fontFamily: 'poppins',
                  fontSize: 25,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
