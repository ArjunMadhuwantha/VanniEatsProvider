import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:servicehub_client/Colors.dart';
import 'package:servicehub_client/controller/apicontroller.dart';
import 'package:servicehub_client/screen/food_order_confirm_screen.dart';
import 'package:servicehub_client/widget/rounded_border_button.dart';
import 'dart:convert';
import '../widget/CircleLogo.dart';
import 'foods_show_screen.dart';
import 'package:intl/intl.dart';

class foodorderAPPLY extends StatefulWidget {
  foodorderAPPLY(
      {super.key,
      required this.count,
      required this.food_name,
      required this.price,
      required this.index});
  String food_name;
  String count;
  String price;
  int index;

  @override
  State<foodorderAPPLY> createState() => _foodorderAPPLYState();
}

class _foodorderAPPLYState extends State<foodorderAPPLY> {
  String? locationValue;
  List<String> locationList = [
    'Boys Hostel',
    'Grils Hotel',
    'Campus ',
  ];
  final dateControlleer = TextEditingController();
  final timeControlleer = TextEditingController();
  final locationControlleer = TextEditingController();
  final dateFocusNode = FocusNode();
  final timeFocusNode = FocusNode();
  final _timeformKey = GlobalKey<FormState>();
  final _dateformKey = GlobalKey<FormState>();
  final _locationformKey = GlobalKey<FormState>();
  AutovalidateMode switched = AutovalidateMode.disabled;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate:
          DateTime.now(), // set the first selectable date to the current date
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      String formattedDate = DateFormat('yyyy-MM-dd')
          .format(DateTime(picked.year, picked.month, picked.day));
      setState(() {
        dateControlleer.text = formattedDate;
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null) {
      String formattedTime = TimeOfDay(hour: picked.hour, minute: picked.minute)
          .format(context)
          .replaceAll(RegExp('[a-z]'), ''); // remove 'am' or 'pm'
      setState(() {
        timeControlleer.text = formattedTime;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        width: width,
        height: height,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/fonts/bgimage.png"),
                fit: BoxFit.cover,
                colorFilter: null)),
        child: Stack(
          children: [
            Positioned(
              top: 135,
              left: 10,
              child: CircleLogo(),
            ),
            SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  UpperSection(),
                  SizedBox(
                    height: 60,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Name Added',
                          style: labelText,
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Form(
                          key: _dateformKey,
                          autovalidateMode: switched,
                          child: TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Name is required';
                              }
                              return null;
                            },
                            keyboardType: TextInputType.text,
                            controller: dateControlleer,
                            decoration: InputDecoration(
                              hintText: "Enter Name",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(
                                    30.0), // set the border radius
                                borderSide: BorderSide.none,
                              ),
                              filled: true,
                              fillColor: Colors.white,
                            ),
                            style: const TextStyle(
                              fontFamily: 'Segoe UI',
                              fontSize: 15,
                              color: lightText,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        const Text(
                          'Description',
                          style: labelText,
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Form(
                          key: _timeformKey,
                          autovalidateMode: switched,
                          child: TextFormField(
                            maxLines: 4,
                            controller: timeControlleer,
                            decoration: InputDecoration(
                              hintText: "Enter Time",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(
                                    30.0), // set the border radius
                                borderSide: BorderSide.none,
                              ),
                              filled: true,
                              fillColor:
                                  Colors.white, // set the fill color to white
                            ),
                            style: const TextStyle(
                              fontFamily: 'Segoe UI',
                              fontSize: 15,
                              color: lightText,
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Description is required';
                              }

                              return null;
                            },
                          ),
                        ),
                        const Text(
                          'Enter Price',
                          style: labelText,
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Form(
                          key: _locationformKey,
                          autovalidateMode: switched,
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            controller: locationControlleer,
                            decoration: InputDecoration(
                              hintText: "Enter Price",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(
                                    30.0), // set the border radius
                                borderSide: BorderSide.none,
                              ),
                              filled: true,
                              fillColor:
                                  Colors.white, // set the fill color to white
                            ),
                            style: const TextStyle(
                              fontFamily: 'Segoe UI',
                              fontSize: 15,
                              color: lightText,
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Price is required';
                              }

                              return null;
                            },
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        RoundedBorderButton(
                            buttonText: "Continue",
                            buttonBackground: KOrange,
                            textColor: white,
                            onPress: () {
                              //     if (_usernameformKey.currentState!.validate() &&
                              //     _passwordformKey.currentState!.validate()) {
                              //   CircularProgressIndicator();
                              //   apicontroller.login(UsernameControlleer.text,
                              //       PasswordControlleer.text, context);
                              // }
                              setState(() {
                                switched = AutovalidateMode.always;
                              });

                              if (_dateformKey.currentState!.validate() &&
                                  _locationformKey.currentState!.validate() &&
                                  _timeformKey.currentState!.validate()) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => FoodOrderConfirm(
                                              foodtypeindex: widget.index,
                                              count: widget.count,
                                              date: dateControlleer.text,
                                              foodname: widget.food_name,
                                              location:
                                                  locationValue.toString(),
                                              price: widget.price,
                                              time: timeControlleer.text,
                                            )));
                              }
                            }),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
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

class UpperSection extends StatelessWidget {
  const UpperSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: const Color(0xff99000000),
          borderRadius: BorderRadius.circular(29)),
      height: 187,
      width: double.infinity,
      child: Column(
        children: [
          const SizedBox(
            height: 33,
          ),
          Row(
            children: const [
              SizedBox(
                width: 33,
              ),
              Text(
                'Vanni',
                style: TextStyle(
                  fontFamily: 'Segoe UI',
                  fontSize: 31.0,
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(
                width: 5,
              ),
              Text('Eats',
                  style: TextStyle(
                    fontFamily: 'Segoe UI',
                    fontSize: 31.0,
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ))
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              const SizedBox(
                width: 180,
              ),
              const Text('What do you want ',
                  style: TextStyle(
                    fontFamily: 'Segoe UI',
                    fontSize: 23.0,
                    color: Kyellow,
                    fontWeight: FontWeight.w900,
                  ))
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            children: [
              const SizedBox(
                width: 210,
              ),
              const Text('for ',
                  style: TextStyle(
                    fontFamily: 'Segoe UI',
                    fontSize: 23.0,
                    color: Kyellow,
                    fontWeight: FontWeight.w900,
                  )),
              const Text('Dinner  ',
                  style: TextStyle(
                    fontFamily: 'Segoe UI',
                    fontSize: 23.0,
                    color: Colors.white,
                    fontWeight: FontWeight.w900,
                  ))
            ],
          ),
        ],
      ),
    );
  }
}
