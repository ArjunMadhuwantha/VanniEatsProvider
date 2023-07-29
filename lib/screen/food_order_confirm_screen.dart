import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:servicehub_client/Colors.dart';
import 'package:servicehub_client/controller/apicontroller.dart';
import 'package:servicehub_client/widget/CircleLogo.dart';
import 'package:servicehub_client/widget/rounded_border_button.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';

class FoodOrderConfirm extends StatefulWidget {
  FoodOrderConfirm(
      {super.key,
      required this.count,
      required this.date,
      required this.foodname,
      required this.location,
      required this.price,
      required this.time,
      required this.foodtypeindex});
  String foodname, date, time, location, count, price;
  int foodtypeindex;

  @override
  State<FoodOrderConfirm> createState() => _FoodOrderConfirmState();
}

class _FoodOrderConfirmState extends State<FoodOrderConfirm> {
  String formattedDate = '';
  String userid = '';
  String foodtype = '';

  getuserdata() async {
    final details = await SharedPreferences.getInstance();
    userid = details.getString('userId').toString();
  }

  findfoodordertype() {
    setState(() {
      widget.foodtypeindex == 0
          ? foodtype = 'Breakfast'
          : widget.foodtypeindex == 1
              ? foodtype = 'Lunch'
              : widget.foodtypeindex == 2
                  ? foodtype = 'Dinner'
                  : widget.foodtypeindex == 3
                      ? foodtype = 'Desert'
                      : widget.foodtypeindex == 4
                          ? foodtype = 'Tea (Evening)'
                          : foodtype = 'Tea (Morning)';
    });
  }

  @override
  void initState() {
    super.initState();
    getuserdata();
  }

  Apicontroller controller = Apicontroller();
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
        body: Container(
      height: height,
      width: width,
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
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              UpperSection(),
              SizedBox(
                height: 60,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 90),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Text(
                              'Name',
                              style: labelText,
                            ),
                            SizedBox(
                              width: 60,
                            ),
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: [
                                  Text(
                                    widget.foodname,
                                    style: TextStyle(
                                        fontFamily: 'Segoe UI',
                                        fontSize: 20,
                                        color: lightText,
                                        fontWeight: FontWeight.w700),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Text(
                            'Date',
                            style: labelText,
                          ),
                          SizedBox(
                            width: 73,
                          ),
                          Text(
                            widget.date,
                            style: TextStyle(
                                fontFamily: 'Segoe UI',
                                fontSize: 20,
                                color: lightText,
                                fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Text(
                            'Time',
                            style: labelText,
                          ),
                          SizedBox(
                            width: 75,
                          ),
                          Text(
                            widget.time,
                            style: TextStyle(
                                fontFamily: 'Segoe UI',
                                fontSize: 20,
                                color: lightText,
                                fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Text(
                            'Location',
                            style: labelText,
                          ),
                          SizedBox(
                            width: 40,
                          ),
                          Text(
                            widget.location,
                            style: TextStyle(
                                fontFamily: 'Segoe UI',
                                fontSize: 20,
                                color: lightText,
                                fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Text(
                            'Count',
                            style: labelText,
                          ),
                          SizedBox(
                            width: 70,
                          ),
                          Text(
                            widget.count,
                            style: TextStyle(
                                fontFamily: 'Segoe UI',
                                fontSize: 20,
                                color: lightText,
                                fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Text(
                            'Price',
                            style: labelText,
                          ),
                          SizedBox(
                            width: 78,
                          ),
                          Text(
                            widget.price,
                            style: TextStyle(
                                fontFamily: 'Segoe UI',
                                fontSize: 20,
                                color: lightText,
                                fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 200, right: 40),
                child: RoundedBorderButton(
                    buttonText: "Confirm",
                    buttonBackground: KOrange,
                    textColor: white,
                    onPress: () async {
                      await findfoodordertype();
                      setState(() {
                        DateTime date = DateTime.parse(widget.date);
                        formattedDate = DateFormat('yyyy-MM-dd').format(date);
                      });
                      print(widget.date);
                      controller.AddOrder(
                          userid,
                          widget.location,
                          widget.date,
                          "pending",
                          widget.time,
                          widget.foodname,
                          widget.count,
                          widget.price,
                          foodtype,
                          context);
                    }),
              )
            ],
          ),
        ],
      ),
    ));
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
