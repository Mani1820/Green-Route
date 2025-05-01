import 'package:dismissible_page/dismissible_page.dart';
import 'package:flutter/material.dart';
import 'package:green_route/Common/color_extension.dart';

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({
    super.key,
    required this.id,
    required this.name,
  });
  final String id;
  final String name;
  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return DismissiblePage(
      onDismissed: () => Navigator.of(context).pop(),
      backgroundColor: Color.fromARGB(255, 186, 247, 186),
      direction: DismissiblePageDismissDirection.multi,
      reverseDuration: Duration(milliseconds: 2000),
      child: Hero(
        transitionOnUserGestures: true,
        tag: widget.id,
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              widget.name,
              style: TextStyle(
                  fontFamily: 'poppins',
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  color: ColorExtension.primarytextColor),
            ),
          ),
        ),
      ),
    );
  }
}
