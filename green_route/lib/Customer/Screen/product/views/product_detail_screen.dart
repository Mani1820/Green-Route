import 'package:dismissible_page/dismissible_page.dart';
import 'package:flutter/material.dart';
import 'package:green_route/Common/color_extension.dart';
import 'package:green_route/Customer/Screen/Payments/payment_screen.dart';

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({
    super.key,
    required this.id,
    required this.name,
    required this.image,
    required this.description,
    required this.price,
    required this.category,
    required this.farmerName,
    required this.upi,
  });
  final String id;
  final String name;
  final String image;
  final String description;
  final double price;
  final String? category;
  final String farmerName;
  final String upi;

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  var value = 0;
  onTapAdd() {
    setState(() {
      value++;
    });
  }

  onTapSub() {
    if (value == 0) return;
    setState(() {
      value--;
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var productPrice = widget.price * value;
    return DismissiblePage(
      onDismissed: () => Navigator.of(context).pop(),
      backgroundColor: Color.fromARGB(255, 186, 247, 186),
      direction: DismissiblePageDismissDirection.multi,
      reverseDuration: Duration(milliseconds: 2000),
      child: Hero(
        transitionOnUserGestures: true,
        tag: widget.id,
        child: Scaffold(
          body: SingleChildScrollView(
            child: SafeArea(
              child: Stack(
                children: [
                  Image.asset(
                    widget.image,
                    height: size.height * 0.4,
                    width: size.width,
                  ),
                  Column(
                    children: [
                      SizedBox(height: size.height * 0.3),
                      Container(
                        height: size.height * 0.7,
                        width: size.width,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 241, 255, 239),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(40),
                            topRight: Radius.circular(40),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: size.height * 0.02,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 30,
                                right: 30,
                                bottom: 25,
                              ),
                              child: Text(
                                widget.name,
                                style: TextStyle(
                                    fontFamily: 'poppins',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25,
                                    color: ColorExtension.primarytextColor),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 30,
                              ),
                              child: Text(
                                'Description',
                                style: TextStyle(
                                    fontFamily: 'poppins',
                                    fontWeight: FontWeight.w500,
                                    fontSize: 20,
                                    color: ColorExtension.primarytextColor),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 30, right: 60, top: 9),
                              child: Text(
                                widget.description,
                                style: TextStyle(
                                    fontFamily: 'poppins',
                                    fontWeight: FontWeight.w500,
                                    fontSize: 13,
                                    color: ColorExtension.secondarytextColor),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(30),
                              child: Row(
                                children: [
                                  Text(
                                    'Number of kilos: ',
                                    style: TextStyle(
                                        fontFamily: 'poppins',
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16,
                                        color: ColorExtension.primarytextColor),
                                  ),
                                  Spacer(),
                                  Container(
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 10),
                                    decoration: BoxDecoration(
                                      color: ColorExtension.primaryColor,
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: IconButton(
                                      icon: Icon(
                                        Icons.add,
                                        color: Colors.white,
                                      ),
                                      onPressed: onTapAdd,
                                    ),
                                  ),
                                  Text(
                                    value.toString(),
                                    style: TextStyle(
                                        fontFamily: 'poppins',
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16,
                                        color: ColorExtension.primarytextColor),
                                  ),
                                  Container(
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 10),
                                    decoration: BoxDecoration(
                                      color: value == 0
                                          ? Colors.grey
                                          : ColorExtension.primaryColor,
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: IconButton(
                                      icon: Icon(
                                        Icons.remove,
                                        color: Colors.white,
                                      ),
                                      onPressed: onTapSub,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Center(
                              child: Container(
                                height: size.height * 0.18,
                                width: size.width * 0.7,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(30),
                                    bottomLeft: Radius.circular(30),
                                    topRight: Radius.circular(10),
                                    bottomRight: Radius.circular(10),
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: const Color.fromARGB(
                                          255, 192, 192, 192),
                                      blurRadius: 4,
                                      spreadRadius: 2,
                                      offset: Offset(4, 2),
                                    ),
                                  ],
                                ),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      'Total price',
                                      style: TextStyle(
                                        fontFamily: 'poppins',
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16,
                                        color: ColorExtension.primarytextColor,
                                      ),
                                    ),
                                    Text(
                                      'Rs. ${productPrice.toString()}',
                                      style: TextStyle(
                                        fontFamily: 'poppins',
                                        fontWeight: FontWeight.w700,
                                        fontSize: 20,
                                        color: ColorExtension.primaryColor,
                                      ),
                                    ),
                                    ElevatedButton(
                                      onPressed: value == 0
                                          ? null
                                          : () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      PaymentScreen(
                                                    name: widget.farmerName,
                                                    upi: widget.upi,
                                                    price:
                                                        productPrice.toString(),
                                                  ),
                                                ),
                                              );
                                            },
                                      style: ElevatedButton.styleFrom(
                                        elevation: 4,
                                        backgroundColor:
                                            ColorExtension.primaryColor,
                                        foregroundColor: Colors.white,
                                      ),
                                      child: Text(
                                        'Buy Now',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                          fontFamily: 'poppins',
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.arrow_back),
                    color: ColorExtension.primarytextColor,
                  ),
                  Positioned(
                    right: 10,
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.more_vert_outlined),
                      color: ColorExtension.primarytextColor,
                    ),
                  ),
                  Positioned(
                    right: 20,
                    top: size.height * 0.31,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.favorite_border_outlined),
                          color: ColorExtension.primarytextColor,
                          iconSize: 36,
                        ),
                        SizedBox(
                          height: size.height * 0.02,
                        ),
                        Text(
                          'Rs. ${widget.price.toString()}',
                          style: TextStyle(
                              fontFamily: 'poppins',
                              fontWeight: FontWeight.w700,
                              fontSize: 25,
                              color: ColorExtension.primaryColor),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
