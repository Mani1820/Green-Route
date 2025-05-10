import 'package:flutter/material.dart';

class FarmerInsightsScreen extends StatefulWidget {
  const FarmerInsightsScreen({super.key});

  @override
  State<FarmerInsightsScreen> createState() => _FarmerInsightsScreenState();
}

class _FarmerInsightsScreenState extends State<FarmerInsightsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
            children: [
              Text(
                'Insights',
                style: TextStyle(
                    fontFamily: 'poppins',
                    fontSize: 25,
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
