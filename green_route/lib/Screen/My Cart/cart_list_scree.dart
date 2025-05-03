import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:green_route/Common/color_extension.dart';
//import 'package:green_route/core/provider/cart_products.dart';
import 'package:green_route/core/provider/products_provider.dart';

class CartListScreen extends ConsumerStatefulWidget {
  const CartListScreen({super.key});

  @override
  ConsumerState<CartListScreen> createState() => _CartListScreenState();
}

class _CartListScreenState extends ConsumerState<CartListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My Cart',
          style: TextStyle(
            color: ColorExtension.primarytextColor,
            fontFamily: 'poppins',
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
      ),
      body: Center(
        child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            itemCount: products.length,
            itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  leading: Image.asset(
                    products[index].image,
                    height: 50,
                    width: 50,
                  ),
                  title: Text(
                    products[index].name,
                    style: TextStyle(
                      color: ColorExtension.primarytextColor,
                      fontFamily: 'poppins',
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  subtitle: Text(
                    products[index].price.toString(),
                    style: TextStyle(
                      color: ColorExtension.primarytextColor,
                      fontFamily: 'poppins',
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
