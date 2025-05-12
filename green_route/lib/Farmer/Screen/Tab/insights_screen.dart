import 'package:flutter/material.dart';
import 'package:green_route/Common/color_extension.dart';
import 'package:green_route/Farmer/Screen/Tab/widgets/drawer_widget.dart';
import 'package:green_route/Farmer/Screen/Tab/widgets/insight_container.dart';
import 'package:green_route/Models/saleschart.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:intl/intl.dart';

class FarmerInsightsScreen extends StatefulWidget {
  const FarmerInsightsScreen({super.key});

  @override
  State<FarmerInsightsScreen> createState() => _FarmerInsightsScreenState();
}

class _FarmerInsightsScreenState extends State<FarmerInsightsScreen> {
  TooltipBehavior? _tooltipBehavior;

  final List<Saleschart> chartData = [
    Saleschart(day: '1', sales: 30),
    Saleschart(day: '2', sales: 20),
    Saleschart(day: '3', sales: 50),
    Saleschart(day: '4', sales: 10),
    Saleschart(day: '5', sales: 70),
    Saleschart(day: '6', sales: 30),
    Saleschart(day: '7', sales: 40),
  ];

  @override
  void initState() {
    _tooltipBehavior = TooltipBehavior(enable: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 4,
        surfaceTintColor: ColorExtension.primaryColor,
        title: Text(
          'Insights',
          style: TextStyle(
            fontFamily: 'poppins',
            fontSize: 25,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: size.height * 0.3,
              width: size.width,
              child: StatefulBuilder(builder: (context, setState) {
                return Column(
                  children: [
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    Row(
                      children: [
                        InsightContainer(
                          title: 'Total sales',
                          value: 1000,
                        ),
                        InsightContainer(
                          title: 'Total revenue',
                          value: 1000,
                        ),
                        InsightContainer(
                          title: 'Today revenue',
                          value: 1000,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    Row(
                      children: [
                        InsightContainer(
                          title: 'Today orders',
                          value: 1000,
                        ),
                        InsightContainer(
                          title: 'Total orders',
                          value: 1000,
                        ),
                        InsightContainer(
                          title: 'Total customers',
                          value: 1000,
                        ),
                      ],
                    ),
                  ],
                );
              }),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            SizedBox(
              height: size.height * 0.6,
              child: SfCartesianChart(
                tooltipBehavior: _tooltipBehavior,
                primaryXAxis: const CategoryAxis(
                  interval: 2,
                  majorGridLines: MajorGridLines(width: 0),
                  majorTickLines: MajorTickLines(width: 0),
                  labelStyle: TextStyle(fontWeight: FontWeight.bold),
                ),
                primaryYAxis: NumericAxis(
                  labelFormat: '{value}',
                  numberFormat: NumberFormat.compact(),
                  labelStyle: const TextStyle(fontWeight: FontWeight.bold),
                ),
                title: ChartTitle(
                  text: 'Sales',
                  textStyle: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'poppins',
                  ),
                ),
                legend: Legend(
                  isVisible: true,
                  position: LegendPosition.bottom,
                ),
                series: [
                  LineSeries<Saleschart, String>(
                    dataSource: chartData,
                    xValueMapper: (Saleschart sales, _) => sales.day,
                    yValueMapper: (Saleschart sales, _) => sales.sales,
                    name: 'Sales',
                  ),
                ],
              ),
            )
          ],
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
