import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:servicehub_client/Colors.dart';
import 'package:servicehub_client/Utils/Navigation_Function.dart';
import 'package:servicehub_client/model/Order_list.dart';
import 'package:http/http.dart' as http;
import 'package:servicehub_client/screen/all_orders_show_screen.dart';
import 'package:servicehub_client/screen/foods_show_screen.dart';
import 'package:servicehub_client/Utils/constant.dart';
import 'package:servicehub_client/widget/appoinment_card.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String userid = '';
  int indexed = 0;

  getuserdata() async {
    final details = await SharedPreferences.getInstance();
    setState(() {
      userid = details.getString('userId').toString();
    });
    print("my user id is : " + userid.toString());
  }

  @override
  void initState() {
    getuserdata();
    super.initState();
  }

  List<OrderList> orderlist = [];
  Future<List<OrderList>> getorderlists() async {
    orderlist.clear();
    // ignore: prefer_interpolation_to_compose_strings
    var url = Uri.parse(
        // ignore: prefer_interpolation_to_compose_strings
        "http://" + constant.BASE_URL.trim() + "/api/order");
    final response = await http.get(url);
    print(response.body);
    var data = json.decode(response.body);
    if (response.statusCode == 200) {
      orderlist.clear();
      // If the server returns a 200 OK response, parse the JSON
      print('load sucess');

      final appontment = orderListFromJson(response.body);

      orderlist.addAll(appontment);
      print(response.body);

      return orderlist;
    } else {
      return orderlist;

      throw Exception('Failed to load data');
    }
  }

  List<String> featureServiceList = [
    "BreakFast",
    "Lunch",
    "Dinner",
    "Desert",
    "Tea Time\n (Evening)",
    "Tea Time\n (Morning)",
  ];

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            width: width,
            height: height,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/fonts/bgimage.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: SingleChildScrollView(
              child: Stack(
                children: [
                  Positioned(
                      left: 20,
                      child: Container(
                        width: 60,
                        height: 60,
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
                      )),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 35, vertical: 65),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  childAspectRatio: 8.0 / 5.0,
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 12,
                                  mainAxisSpacing: 12),
                          itemBuilder: (_, index) => InkWell(
                            onTap: () {
                              setState(() {
                                indexed = index;
                              });

                              print("category index" + index.toString());
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      FoodShowScreen(index: index)));
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  color: KOrange,
                                  borderRadius: BorderRadius.circular(20)),
                              child: Center(
                                child: Text(
                                  featureServiceList[index],
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    color: Color(0xFF4E4848),
                                    fontFamily: 'Segoe UI',
                                    fontSize: 15,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          itemCount: featureServiceList.length,
                        ),
                        const SizedBox(
                          height: 22,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              ' Orders',
                              style: TextStyle(
                                fontFamily: 'Segoe UI',
                                fontSize: 20.0,
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            InkWell(
                              onTap: () => NavigationUtillfunction.navigateTo(
                                  context, AllOrderFoodScreen()),
                              child: Text(
                                'View All',
                                style: TextStyle(
                                  fontFamily: 'Segoe UI',
                                  fontSize: 10.0,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        FutureBuilder(
                            future: getorderlists(),
                            builder: (context,
                                AsyncSnapshot<List<OrderList>> snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return Center(
                                    child: const CircularProgressIndicator());
                              } else if (snapshot.hasData &&
                                  snapshot.data!.isNotEmpty) {
                                return ListView.builder(
                                    itemCount: snapshot.data!.length,
                                    shrinkWrap: true,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    itemBuilder: (context, index) {
                                      return AppoinmentCard(
                                        id: snapshot.data![index].id.toString(),
                                        phonenumber: '0773358545',
                                        count: snapshot.data![index].count,
                                        status: snapshot.data![index].status,
                                        foodtype:
                                            snapshot.data![index].foodType,
                                        date: snapshot.data![index].date
                                            .toString(),
                                        food_name: snapshot
                                            .data![index].foodname
                                            .toString(),
                                        location: snapshot.data![index].location
                                            .toString(),
                                        price: snapshot.data![index].price
                                            .toString(),
                                        time: snapshot.data![index].time
                                            .toString(),
                                        isPending: true,
                                      );
                                    });
                              } else if (snapshot.hasError) {
                                return Text("${snapshot.error}");
                              } else {
                                return Center(
                                  child: const Text(
                                    "No available data",
                                    style: TextStyle(
                                      fontFamily: 'Segoe UI',
                                      fontSize: 15.0,
                                      color: darkText,
                                    ),
                                  ),
                                );
                              }
                            }),
                        SizedBox(
                          height: 30,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
