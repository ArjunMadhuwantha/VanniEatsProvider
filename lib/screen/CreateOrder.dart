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

// ignore: camel_case_types
class AddedItem extends StatefulWidget {
  AddedItem({super.key, required this.index});
  int index;

  @override
  State<AddedItem> createState() => _AddedItemState();
}

class _AddedItemState extends State<AddedItem> {
  Apicontroller apicontroller = Apicontroller();
  String? locationValue;

  final dateControlleer = TextEditingController();
  final timeControlleer = TextEditingController();
  final locationControlleer = TextEditingController();
  final dateFocusNode = FocusNode();
  final timeFocusNode = FocusNode();
  final _timeformKey = GlobalKey<FormState>();
  final _dateformKey = GlobalKey<FormState>();
  final _locationformKey = GlobalKey<FormState>();
  AutovalidateMode switched = AutovalidateMode.disabled;

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
                              hintText: "Enter Description",
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
                                widget.index == 1
                                    ? apicontroller.CreateLunchtOrder(
                                        dateControlleer.text,
                                        timeControlleer.text,
                                        locationControlleer.text,
                                        widget.index,
                                        context)
                                    : widget.index == 2
                                        ? apicontroller.CreateDinertOrder(
                                            dateControlleer.text,
                                            timeControlleer.text,
                                            locationControlleer.text,
                                            widget.index,
                                            context)
                                        : widget.index == 3
                                            ? apicontroller.CreateDesertOrder(
                                                dateControlleer.text,
                                                timeControlleer.text,
                                                locationControlleer.text,
                                                widget.index,
                                                context)
                                            : widget.index == 5
                                                ? apicontroller
                                                    .CreateMorningtOrder(
                                                        dateControlleer.text,
                                                        timeControlleer.text,
                                                        locationControlleer
                                                            .text,
                                                        widget.index,
                                                        context)
                                                : widget.index == 0
                                                    ? apicontroller
                                                        .CreateBreakfasttOrder(
                                                            dateControlleer
                                                                .text,
                                                            timeControlleer
                                                                .text,
                                                            locationControlleer
                                                                .text,
                                                            widget.index,
                                                            context)
                                                    : widget.index == 4
                                                        ? apicontroller
                                                            .CreateEveningOrder(
                                                                dateControlleer
                                                                    .text,
                                                                timeControlleer
                                                                    .text,
                                                                locationControlleer
                                                                    .text,
                                                                widget.index,
                                                                context)
                                                        : null;
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
