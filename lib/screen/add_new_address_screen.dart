import 'package:flutter/material.dart';
import 'package:servicehub_client/Colors.dart';
import 'package:servicehub_client/widget/rounded_button.dart';

class AddNewAddress extends StatefulWidget {
  const AddNewAddress({super.key});

  @override
  State<AddNewAddress> createState() => _AddNewAddressState();
}

class _AddNewAddressState extends State<AddNewAddress> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        elevation: 0,
        //leadingWidth: 30,
        titleSpacing: 0,
        backgroundColor: white,
        foregroundColor: Colors.black,
        leading: Padding(
          padding: const EdgeInsets.only(left: 22),
          child: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
              size: 24,
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        title: const Text('Back'),
        actions: const [
          Padding(
            padding: EdgeInsets.only(top: 10, right: 25),
            child: Text(
              'Continue',
              style: TextStyle(
                fontFamily: 'Segoe UI',
                fontSize: 22.0,
                color: kPrimary,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: greyColor,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Icon(
                      Icons.search,
                      size: 24,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Icon(
                      Icons.gps_fixed,
                      size: 24,
                    ),
                  )
                ],
              ),
            ),
            Image.asset('assets/images/map.png'),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 15),
              child: Column(
                children: [
                  const Text(
                    'Select address type',
                    style: TextStyle(
                      fontFamily: 'Segoe UI',
                      fontSize: 25.0,
                      color: darkText,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedIndex = 0;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: selectedIndex == 0
                                  ? darkText
                                  : const Color(0xFFFDF8F8),
                              borderRadius: BorderRadius.circular(10)),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 9, horizontal: 19),
                            child: Text(
                              'Home',
                              style: TextStyle(
                                fontFamily: 'Segoe UI',
                                fontSize: 20.0,
                                color: selectedIndex == 0 ? white : darkText,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedIndex = 1;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: selectedIndex == 1
                                  ? darkText
                                  : const Color(0xFFFDF8F8),
                              borderRadius: BorderRadius.circular(10)),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 9, horizontal: 19),
                            child: Text(
                              'Office',
                              style: TextStyle(
                                fontFamily: 'Segoe UI',
                                fontSize: 20.0,
                                color: selectedIndex == 1 ? white : darkText,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedIndex = 2;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: selectedIndex == 2
                                  ? darkText
                                  : const Color(0xFFFDF8F8),
                              borderRadius: BorderRadius.circular(10)),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 9, horizontal: 19),
                            child: Text(
                              'Other',
                              style: TextStyle(
                                fontFamily: 'Segoe UI',
                                fontSize: 20.0,
                                color: selectedIndex == 2 ? white : darkText,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                      maxLength: 4,
                      keyboardType: TextInputType.text,
                      style: const TextStyle(
                          fontFamily: 'Segoe UI',
                          fontSize: 20,
                          color: lightText),
                      decoration: formInputStyle),
                  const SizedBox(
                    height: 15,
                  ),
                  RoundedButton(
                    bgcolor: white,
                    buttonText: 'Save Address',
                    onPress: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (BuildContext context) => AddNewAddress()));
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
