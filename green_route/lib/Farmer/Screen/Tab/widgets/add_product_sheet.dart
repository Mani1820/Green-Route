import 'package:flutter/material.dart';
import 'package:green_route/Common/color_extension.dart';
import 'package:green_route/Common_Widget/rounded_button.dart';
import 'package:green_route/Common_Widget/rounded_text_field.dart';
import 'package:green_route/Common_Widget/textlable.dart';
import 'package:green_route/Models/farmer_product_model.dart';
import 'package:uuid/uuid.dart';

class AddProductSheet extends StatefulWidget {
  const AddProductSheet({super.key, required this.onTapAddProduct});

  final void Function(FarmerProductModel product) onTapAddProduct;

  @override
  State<AddProductSheet> createState() => _AddProductSheetState();
}

class _AddProductSheetState extends State<AddProductSheet> {
  final _formKey = GlobalKey<FormState>();
  final productNameController = TextEditingController();
  final productPriceController = TextEditingController();
  final productDescriptionController = TextEditingController();
  final qantityController = TextEditingController();
  final locationController = TextEditingController();

  String? selectedValue;

  var uid = Uuid().v4();

  void onTapRadioButton(value) {
    setState(() {
      selectedValue = value;
    });
  }

  String? productNameValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter product name';
    }
    return null;
  }

  String? productPriceValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter product amount';
    }
    return null;
  }

  String? productQuantityValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter how much kilos you have';
    }
    return null;
  }

  String? productDescriptionValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter product description';
    }
    return null;
  }

  String? productLocationValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter product location';
    }
    return null;
  }

  void onSave() {
    if (_formKey.currentState!.validate()) {
      if (selectedValue != null) {
        Navigator.pop(context);
        widget.onTapAddProduct(FarmerProductModel(
          id: uid,
          name: productNameController.text,
          price: double.parse(productPriceController.text),
          description: productDescriptionController.text,
          farmerLocation: locationController.text,
          category: selectedValue.toString(),
        ));
      } else {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Error'),
            content: const Text('Please select a category'),
            actions: [
              TextButton(
                child: const Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      }
    }
  }

  @override
  void dispose() {
    productNameController.dispose();
    productPriceController.dispose();
    productDescriptionController.dispose();
    qantityController.dispose();
    locationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: SizedBox(
        width: size.width,
        child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'Add Product',
                  style: TextStyle(
                    fontFamily: 'poppins',
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const Spacer(),
              SizedBox(
                height: size.height * 0.06,
                width: size.width * 0.14,
                child: IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: Icon(Icons.close,
                      color: const Color.fromARGB(255, 0, 0, 0)),
                ),
              ),
            ],
          ),
          SizedBox(height: size.height * 0.02),
          Row(children: [
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: size.width * 0.05,
              ),
              height: size.height * 0.09,
              width: size.width * 0.2,
              decoration: BoxDecoration(
                color: Colors.grey,
              ),
              child: Icon(
                Icons.camera_alt,
                color: Colors.white,
              ),
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                'Upload Image',
                style: TextStyle(
                  color: ColorExtension.primaryColor,
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'poppins',
                ),
              ),
            ),
          ]),
          SizedBox(height: size.height * 0.02),
          Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Textlable(text: 'Product Name'),
                RoundedTextField(
                  hintText: 'Product Name',
                  controller: productNameController,
                  keyboardType: TextInputType.name,
                  validator: productNameValidator,
                ),
                Textlable(text: 'Product Price'),
                RoundedTextField(
                  hintText: 'Price/kg',
                  controller: productPriceController,
                  keyboardType: TextInputType.number,
                  validator: productPriceValidator,
                ),
                Textlable(text: 'Available Quantity'),
                RoundedTextField(
                  hintText: 'eg. 10kg',
                  controller: qantityController,
                  keyboardType: TextInputType.number,
                  validator: productQuantityValidator,
                ),
                Textlable(text: 'Description'),
                RoundedTextField(
                  hintText: 'Description',
                  controller: productDescriptionController,
                  validator: productDescriptionValidator,
                ),
                Textlable(text: 'Address'),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.location_on_outlined,
                          color: ColorExtension.primaryColor,
                        ),
                      ),
                      Text(
                        'Choose Location',
                        style: TextStyle(
                          fontFamily: 'poppins',
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: ColorExtension.primarytextColor,
                        ),
                      ),
                    ],
                  ),
                ),
                // RoundedTextField(
                //   hintText: 'Address',
                //   controller: locationController,
                //   validator: productLocationValidator,
                // ),
                Textlable(text: 'Catagory'),
                SizedBox(
                  height: size.height * 0.02,
                ),
                RadioListTile.adaptive(
                  value: 'Vegetable',
                  groupValue: selectedValue,
                  onChanged: (value) {
                    onTapRadioButton(value);
                  },
                  title: Text(
                    'Vegetable',
                    style: TextStyle(fontFamily: 'poppins'),
                  ),
                ),
                RadioListTile.adaptive(
                  value: 'Fruits',
                  groupValue: selectedValue,
                  onChanged: (value) {
                    onTapRadioButton(value);
                  },
                  title: Text(
                    'Fruits',
                    style: TextStyle(fontFamily: 'poppins'),
                  ),
                ),
                RadioListTile.adaptive(
                  value: 'Dairy',
                  groupValue: selectedValue,
                  onChanged: (value) {
                    onTapRadioButton(value);
                  },
                  title: Text(
                    'Dairy',
                    style: TextStyle(fontFamily: 'poppins'),
                  ),
                ),
                RadioListTile.adaptive(
                  value: 'Other',
                  groupValue: selectedValue,
                  onChanged: (value) {
                    onTapRadioButton(value);
                  },
                  title: Text(
                    'Other',
                    style: TextStyle(fontFamily: 'poppins'),
                  ),
                ),
                RoundedButton(
                  type: ButtonType.primary,
                  title: 'Add Product',
                  onPressed: onSave,
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
