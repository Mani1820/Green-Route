import 'package:flutter/material.dart';
import 'package:green_route/Common/color_extension.dart';
import 'package:green_route/Farmer/Screen/Tab/widgets/add_product_sheet.dart';
import 'package:green_route/Farmer/Screen/Tab/widgets/drawer_widget.dart';
import 'package:green_route/Models/farmer_product_model.dart';
import 'package:green_route/core/utils/custom_theme.dart';

class FarmerProductScreen extends StatefulWidget {
  const FarmerProductScreen({super.key});

  @override
  State<FarmerProductScreen> createState() => _FarmerProductScreenState();
}

class _FarmerProductScreenState extends State<FarmerProductScreen> {
  List farmerproducts = [
    FarmerProductModel(
        id: '1',
        name: 'banana',
        price: 1.0,
        description: 'banana',
        farmerLocation: 'Kovilpalayam',
        category: 'Fruits'),
  ];
  AnimationStyle? animationStyle;
  @override
  void initState() {
    farmerproducts = [];
    super.initState();
  }

  // void onTapAddProduct() {
  //   showModalBottomSheet(
  //     isScrollControlled: true,
  //     useSafeArea: true,
  //     isDismissible: true,
  //     context: context,
  //     builder: (context) => AddProductSheet(
  //       onTapAddProduct: (FarmerProductModel product) {
  //         products.add(product);
  //       },
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 4,
        surfaceTintColor: ColorExtension.primaryColor,
        title: Text(
          'Products',
          style: TextStyle(
            fontFamily: 'poppins',
            fontSize: 25,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
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
          onPressed: () => showModalBottomSheet(
            isScrollControlled: true,
            useSafeArea: true,
            isDismissible: true,
            context: context,
            builder: (context) => AddProductSheet(
              onTapAddProduct: (FarmerProductModel farmerproduct) {
                setState(() {
                  farmerproducts.add(farmerproduct);
                });
              },
            ),
          ),
          icon: Icon(Icons.add, color: Colors.white),
        ),
      ),
      body: StatefulBuilder(
        builder: (context, setState) => SafeArea(
          child: ListView.builder(
            itemCount: farmerproducts.length,
            itemBuilder: (context, index) {
              return Card(
                //color: const Color.fromARGB(255, 255, 250, 238),
                elevation: 4,
                surfaceTintColor: ColorExtension.secondaryColor,
                child: ListTile(
                  titleAlignment: ListTileTitleAlignment.center,
                  isThreeLine: true,
                  leading: Container(
                    height: size.height * 0.1,
                    width: size.width * 0.15,
                    decoration: BoxDecoration(
                      color: ColorExtension.primaryColor,
                    ),
                    child: Icon(
                      Icons.account_box,
                      color: Colors.white,
                    ),
                  ),
                  title: Text(
                    farmerproducts[index].name,
                    style: CustomTheme.cardTextTheme,
                  ),
                  subtitle: Text(farmerproducts[index].description),
                  trailing: Column(
                    children: [
                      Text(farmerproducts[index].price.toString()),
                      Text(farmerproducts[index].category),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
      drawer: DrawerWidget(
        farmeremail:
            'Mani', //-----------------should be changed dynamically------------------\\
        farmername: 'Mani',
      ),
    );
  }
}
