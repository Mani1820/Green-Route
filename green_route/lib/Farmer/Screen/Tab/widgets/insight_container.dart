import 'package:flutter/material.dart';
import 'package:green_route/Common/color_extension.dart';

class InsightContainer extends StatefulWidget {
  const InsightContainer({super.key, required this.title, required this.value});
  final String title;
  final int value;

  @override
  State<InsightContainer> createState() => _InsightContainerState();
}

class _InsightContainerState extends State<InsightContainer> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: size.width * 0.04),
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
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.title,
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'poppins',
                  color: ColorExtension.primaryColor),
            ),
            Text(
              widget.value.toString(),
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'poppins',
                  color: ColorExtension.secondaryColor),
            ),
          ],
        ),
      ),
    );
  }
}
