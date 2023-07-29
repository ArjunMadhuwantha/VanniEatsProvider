import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:servicehub_client/Colors.dart';
import 'package:servicehub_client/Utils/Navigation_Function.dart';
import 'package:servicehub_client/Utils/constant.dart';
import 'package:servicehub_client/model/Order_list.dart';
import 'package:servicehub_client/widget/appoinment_card.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AllOrderFoodScreen extends StatefulWidget {
  const AllOrderFoodScreen({super.key});

  @override
  State<AllOrderFoodScreen> createState() => _AllOrderFoodScreenState();
}

class _AllOrderFoodScreenState extends State<AllOrderFoodScreen> {
  String userid = '';
  int indexed = 0;
  void switched() {}
  getuserdata() async {
    final details = await SharedPreferences.getInstance();
    setState(() {
      userid = details.getString('userId').toString();
    });
    print("my user id " + userid.toString());
  }

  @override
  void initState() {
    super.initState();

    getuserdata();
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
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      UpperSection(),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 35, vertical: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  ' Appoinments',
                                  style: TextStyle(
                                    fontFamily: 'Segoe UI',
                                    fontSize: 20.0,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700,
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
                                        child:
                                            const CircularProgressIndicator());
                                  } else if (snapshot.hasData &&
                                      snapshot.data!.isNotEmpty) {
                                    return ListView.builder(
                                        itemCount: snapshot.data!.length,
                                        shrinkWrap: true,
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        itemBuilder: (context, index) {
                                          return AppoinmentCard(
                                            id: snapshot.data![index].id
                                                .toString(),
                                            phonenumber: '0773358545',
                                            count: snapshot.data![index].count,
                                            status:
                                                snapshot.data![index].status,
                                            foodtype:
                                                snapshot.data![index].foodType,
                                            date: snapshot.data![index].date
                                                .toString(),
                                            food_name: snapshot
                                                .data![index].foodname
                                                .toString(),
                                            location: snapshot
                                                .data![index].location
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
                ],
              ),
            ),
          ),
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
