import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen(
      {super.key, required this.name, required this.upi, required this.price});
  final String name;
  final String upi;
  final String price;
  
  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen>
    with TickerProviderStateMixin {
  bool isTap = false; //State variable to check if the button is tapped
  
  late String data;
  @override
  void initState() {
    super.initState();
    data = 'upi://pay?pa=${widget.upi}&pn=${widget.name}&am=${widget.price}&cu=INR';
  }

  final ButtonStyle styledEButton = //Button style handled
      ElevatedButton.styleFrom(
    elevation: 2,
    backgroundColor: Colors.green,
    foregroundColor: Colors.white,
    fixedSize: Size(
      220,
      50,
    ),
  );

  double opacityValue = 0;

  int? _selectedValue;

  Color _buttonColor = Colors.green;

  void onTapCash(value) {
    setState(() {
      _selectedValue = value;
      _buttonColor = Colors.blue; // Change to desired color
      if (_selectedValue == 1) {
        opacityValue = 1;
      } else {
        opacityValue = 0;
      }
      isTap = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Select Payment Method',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 15,
            ),
            child: Container(
              height: size.height * 0.06,
              margin: const EdgeInsets.only(
                top: 20,
                left: 20,
                right: 20,
              ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color.fromARGB(255, 244, 244, 244),
                  boxShadow: [
                    BoxShadow(
                      color: const Color.fromARGB(255, 104, 104, 104)
                          .withAlpha(50),
                      spreadRadius: 1,
                      blurRadius: 7,
                      offset: const Offset(0, 3),
                    ),
                  ]),
              child: RadioListTile(
                activeColor: Colors.blue,
                value: 0,
                groupValue: _selectedValue,
                onChanged: (value) => onTapCash(value!),
                title: Text(
                  'Cash on delivery',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 10,
            ),
            child: Container(
              height: size.height * 0.06,
              margin: const EdgeInsets.only(
                top: 20,
                left: 20,
                right: 20,
              ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color.fromARGB(255, 244, 244, 244),
                  boxShadow: [
                    BoxShadow(
                      color: const Color.fromARGB(255, 104, 104, 104)
                          .withAlpha(50),
                      spreadRadius: 1,
                      blurRadius: 7,
                      offset: const Offset(0, 3),
                    ),
                  ]),
              child: RadioListTile(
                activeColor: _buttonColor,
                value: 1,
                groupValue: _selectedValue,
                onChanged: (value) => onTapCash(value!),
                title: Text(
                  'Online payment',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            height: size.height * 0.46,
            margin: EdgeInsets.only(
              top: 20,
              left: 20,
              right: 20,
            ),
            child: AnimatedOpacity(
              opacity: opacityValue,
              duration: Duration.zero,
              child: Column(
                children: [
                  QrImageView(
                    data: data,
                    size: 200,
                  ),
                  Text(
                    widget.name,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  Text(
                    'UIP ID: ${widget.upi}',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ),
          ElevatedButton(
            onPressed: !isTap ? null : () {},
            style: styledEButton,
            child: Text(
              'continue',
            ),
          ),
        ],
      ),
    );
  }
}
