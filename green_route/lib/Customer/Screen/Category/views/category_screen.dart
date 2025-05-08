import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:green_route/Common/color_extension.dart';
import 'package:green_route/Customer/Screen/product/views/product_detail_screen.dart';
import 'package:green_route/core/provider/products_provider.dart';

class CategoryScreen extends ConsumerStatefulWidget {
  const CategoryScreen({
    super.key,
    required this.title,
  });
  final String title;

  @override
  ConsumerState<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends ConsumerState<CategoryScreen> {
  void _onTapProduct(
    String id,
    String title,
    String image,
    String category,
    String description,
    double price,
    String farmerName,
    String upi,
  ) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => ProductDetailScreen(
        id: id,
        name: title,
        image: image,
        category: category,
        description: description,
        price: price,
        farmerName: farmerName,
        upi: upi,
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    final allProduct = ref.watch(allProductProvider);
    final List categories = ref
        .read(allProductProvider)
        .where((e) => e.category == widget.title)
        .toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          style: TextStyle(
              color: ColorExtension.primarytextColor,
              fontFamily: 'poppins',
              fontWeight: FontWeight.bold,
              fontSize: 25),
        ),
      ),
      body: categories.isEmpty
          ? const Center(
              child: Text(
                'No products found',
                style: TextStyle(
                    fontFamily: 'poppins',
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            )
          : ListView.builder(
              shrinkWrap: true,
              itemCount: categories.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    _onTapProduct(
                      allProduct[index].id,
                      allProduct[index].name,
                      allProduct[index].image,
                      allProduct[index].category.toString(),
                      allProduct[index].description,
                      allProduct[index].price,
                      allProduct[index].farmerName.toString(),
                      allProduct[index].upi.toString(),
                    );
                  },
                  child: Hero(
                    tag: allProduct[index].id,
                    child: Card(
                      margin: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 15),
                      color: Color.fromARGB(255, 255, 239, 214),
                      elevation: 3,
                      child: ListTile(
                        leading: SizedBox(
                          width: 50,
                          height: 50,
                          child: Image.asset(categories[index].image),
                        ),
                        title: Text(
                          categories[index].name,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            fontFamily: 'poppins',
                          ),
                        ),
                        subtitle: Text(
                          categories[index].description,
                          style: TextStyle(
                            fontFamily: 'poppins',
                            fontSize: 12,
                            height: 1.5,
                            fontWeight: FontWeight.w500,
                            color: ColorExtension.secondarytextColor,
                          ),
                        ),
                        trailing: Text(
                          '₹${categories[index].price.toString()}',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            fontFamily: 'poppins',
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
