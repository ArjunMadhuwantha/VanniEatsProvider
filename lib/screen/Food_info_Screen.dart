import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'package:servicehub_client/Colors.dart';
import 'package:servicehub_client/Utils/Navigation_Function.dart';
import 'package:servicehub_client/screen/Food_order_apply.dart';
import 'package:servicehub_client/widget/CircleLogo.dart';
import 'package:servicehub_client/widget/rounded_border_button.dart';
import 'package:servicehub_client/widget/rounded_button.dart';

class FoodInfoScreen extends StatefulWidget {
  FoodInfoScreen(
      {super.key,
      required this.FoodName,
      required this.AdditionalInformation,
      required this.FoodPrice,
      required this.index});
  String FoodName, AdditionalInformation;
  double FoodPrice;
  int index;

  @override
  State<FoodInfoScreen> createState() => _FoodInfoScreenState();
}

class _FoodInfoScreenState extends State<FoodInfoScreen> {
  int quentity = 1;

  double finalprice = 0;

  void calulate() {
    setState(() {
      finalprice = widget.FoodPrice * quentity;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    calulate();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey,
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              UpperFoodInfoCard(),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.FoodName,
                      style: TextStyle(
                        fontFamily: 'Segoe UI',
                        fontSize: 30,
                        color: Kblack,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "Rs. ",
                          style: TextStyle(
                            fontFamily: 'Segoe UI',
                            fontSize: 18,
                            color: KOrange,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text(
                          finalprice.toString(),
                          style: TextStyle(
                            fontFamily: 'Segoe UI',
                            fontSize: 30,
                            color: Kblack,
                            fontWeight: FontWeight.w700,
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "quantity :",
                          style: TextStyle(
                            fontFamily: 'Segoe UI',
                            fontSize: 18,
                            color: Kblack,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(
                          width: 50,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            InkWell(
                              onTap: () {
                                setState(() {
                                  quentity++;
                                  calulate();
                                });
                              },
                              child: Container(
                                width: 35,
                                height: 35,
                                decoration: BoxDecoration(
                                  color: Kblack,
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(20),
                                    topLeft: Radius.circular(20),
                                  ),
                                ),
                                child: Icon(
                                  Icons.add,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            Container(
                              width: 35,
                              height: 35,
                              decoration: BoxDecoration(
                                color: kgraycolor,
                                borderRadius: BorderRadius.only(),
                              ),
                              child: Center(
                                child: Text(
                                  quentity.toString(),
                                  style: TextStyle(color: Kblack),
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  quentity > 2 ? quentity-- : quentity = 1;
                                  calulate();
                                });
                              },
                              child: Container(
                                width: 35,
                                height: 35,
                                decoration: BoxDecoration(
                                  color: KOrange,
                                  borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(20),
                                    topRight: Radius.circular(20),
                                  ),
                                ),
                                child: Icon(
                                  Icons.remove,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Information :",
                      style: TextStyle(
                        fontFamily: 'Segoe UI',
                        fontSize: 18,
                        color: Kblack,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(
                      height: 0,
                    ),
                    Text(
                        "                       " +
                            widget.AdditionalInformation,
                        style: TextStyle(
                          fontFamily: 'Segoe UI',
                          fontSize: 25,
                          color: KbUTTONTEXT,
                          fontWeight: FontWeight.w700,
                        )),
                    SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class UpperFoodInfoCard extends StatelessWidget {
  const UpperFoodInfoCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Container(
      decoration: BoxDecoration(
        color: Kblack,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
      width: double.infinity,
      height: height / 2,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back),
                  color: Colors.white,
                  iconSize: 30,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Container(
                    width: 70,
                    height: 70,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: KOrange,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.white.withOpacity(0.4),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Image.asset("assets/images/logo.png"),
                  ),
                )
              ],
            ),
            Center(
              child: BounceInDown(
                child: Container(
                    width: 250,
                    height: 200,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/images/kottu.png"),
                        fit: BoxFit.fill,
                      ),
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
