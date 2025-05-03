import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:green_route/Common/color_extension.dart';
import 'package:green_route/Common_Widget/rounded_text_field.dart';
import 'package:green_route/Data/banner_data.dart';
import 'package:green_route/Screen/Category/views/category_screen.dart';
import 'package:green_route/Screen/home/widgets/featured_products.dart';
import 'package:green_route/Screen/product/views/product_detail_screen.dart';
import 'package:green_route/core/provider/products_provider.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  void _onTapCatagory(String category) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => CategoryScreen(
        title: category,
      ),
    ));
  }

  void _onTapProduct(String id, String title, String image, String category, String description, double price, String farmerName,) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => ProductDetailScreen(
        id: id,
        name: title,
        image: image,
        category: category,
        description: description,
        price: price,
        farmerName: farmerName,
      ),
    ));
  }

  final controller = PageController(viewportFraction: 0.9);
  var currentBanner = 0;
  @override
  void initState() {
    controller.addListener(() {
      setState(() {
        currentBanner = controller.page?.floor() ?? 1;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final productDetails = ref.read(allProductProvider);
    final categoryDetails = ref.read(categoryProvider);
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: Text(
                  'Welcome User!',
                  style: TextStyle(
                    fontSize: 27,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'poppins',
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              RoundedTextField(
                hintText: 'Search',
                controller: TextEditingController(),
                prefixIcon: const Icon(
                  Icons.search_rounded,
                  color: Color.fromARGB(255, 55, 54, 54),
                ),
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              Center(
                  child: SizedBox(
                height: size.height * 0.3,
                child: PageView.builder(
                    scrollDirection: Axis.horizontal,
                    controller: controller,
                    itemCount: bannerData.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: const EdgeInsets.all(10),
                        width: size.width * 0.9,
                        height: size.height * 0.3,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                              bannerData.elementAt(index)['image'],
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    }),
              )),
              SizedBox(
                height: size.height * 0.02,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'Catagory',
                  style: TextStyle(
                    fontSize: 22,
                    color: ColorExtension.primarytextColor,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'poppins',
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.2,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  itemCount: categoryDetails.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        InkWell(
                          splashColor: Colors.transparent,
                          onTap: () {
                            _onTapCatagory(
                                categoryDetails.elementAt(index).name);
                          },
                          child: Container(
                            height: size.height * 0.15,
                            width: size.width * 0.25,
                            margin: const EdgeInsets.symmetric(horizontal: 10),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: AssetImage(
                                  categoryDetails.elementAt(index).imageUrl,
                                ),
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            _onTapCatagory(
                                categoryDetails.elementAt(index).name);
                          },
                          child: Text(
                            categoryDetails.elementAt(index).name,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'poppins',
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'Featured Products',
                  style: TextStyle(
                    fontSize: 22,
                    color: ColorExtension.primarytextColor,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'poppins',
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              GridView.builder(
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  itemCount: productDetails.length,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        _onTapProduct(productDetails.elementAt(index).id,
                            productDetails.elementAt(index).name,
                            productDetails.elementAt(index).image,
                            productDetails.elementAt(index).category.toString(),
                            productDetails.elementAt(index).description,
                            productDetails.elementAt(index).price,
                            productDetails.elementAt(index).farmerName.toString());
                      },
                      child: Hero(
                        tag: productDetails.elementAt(index).id,
                        child: Container(
                            height: size.height * 0.25,
                            width: size.width * 0.45,
                            margin: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey.shade300,
                                      blurRadius: 5,
                                      spreadRadius: 2,
                                      offset: Offset(3, 2))
                                ]),
                            child: FeaturedProducts(index: index)),
                      ),
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }
}
