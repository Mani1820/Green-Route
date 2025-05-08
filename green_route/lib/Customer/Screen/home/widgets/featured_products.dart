import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:green_route/Common/color_extension.dart';
import 'package:green_route/Models/product_model.dart';
import 'package:green_route/core/provider/products_provider.dart';

class FeaturedProducts extends ConsumerStatefulWidget {
   FeaturedProducts({super.key, required this.index});

  final int index;
 final List<Products> cartProducts = [];

  @override
  ConsumerState<FeaturedProducts> createState() => _FeaturedProductsState();
}

class _FeaturedProductsState extends ConsumerState<FeaturedProducts> {
  bool isFav = false;
  void onTapFav() {
    setState(() {
      isFav = !isFav;
      widget.cartProducts.add(ref.read(allProductProvider)[widget.index]);
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final productDetails = ref.watch(allProductProvider);
    return Stack(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              onPressed: onTapFav,
              icon: Icon(
                isFav ? Icons.favorite : Icons.favorite_border_outlined,
                color: isFav
                    ? ColorExtension.primaryColor
                    : ColorExtension.primarytextColor,
              ),
            ),
            SizedBox(
              width: size.width * 0.17,
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.more_vert_outlined,
                color: ColorExtension.primarytextColor,
              ),
            ),
          ],
        ),
        Center(
          child: Column(
            children: [
              SizedBox(
                height: size.height * 0.1,
                child: Image(
                  image:
                      AssetImage(productDetails.elementAt(widget.index).image),
                  fit: BoxFit.cover,
                ),
              ),
              Text(
                productDetails.elementAt(widget.index).name,
                style: TextStyle(
                  fontFamily: 'poppins',
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: ColorExtension.primarytextColor,
                ),
              ),
              Text(
                'Rs. ${productDetails.elementAt(widget.index).price.toString()} /kg',
                style: TextStyle(
                  fontFamily: 'poppins',
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  color: ColorExtension.secondaryColor,
                ),
              ),
              Text(
                  'Farmer: ${productDetails.elementAt(widget.index).farmerName.toString()}',
                  style: TextStyle(
                    fontFamily: 'poppins',
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: ColorExtension.secondarytextColor,
                  )),
            ],
          ),
        ),
      ],
    );
  }
}
