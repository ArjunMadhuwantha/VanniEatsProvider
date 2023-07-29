import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:servicehub_client/Colors.dart';
import 'package:servicehub_client/Utils/constant.dart';
import 'package:servicehub_client/controller/apicontroller.dart';
import 'package:servicehub_client/model/Breakfast_model.dart';
import 'package:servicehub_client/model/DesertList.dart';
import 'package:servicehub_client/model/Dinner_model.dart';
import 'package:servicehub_client/model/Everning_Tea.dart';
import 'package:servicehub_client/model/Luch_model.dart';
import 'package:servicehub_client/screen/CreateOrder.dart';
import 'package:servicehub_client/screen/Food_info_Screen.dart';
import 'package:servicehub_client/widget/CircleLogo.dart';
import 'package:http/http.dart' as http;
import 'package:servicehub_client/widget/rounded_button.dart';

import '../model/Morning_Tea.dart';

class FoodShowScreen extends StatefulWidget {
  const FoodShowScreen({required this.index}) : super();
  final int index;

  @override
  State<FoodShowScreen> createState() => _FoodShowScreenState();
}

class _FoodShowScreenState extends State<FoodShowScreen> {
  String aditional_information = "", foodname = "";
  double foodprice = 0;

  //List<LunchList> lunchlist = [];

  List<LunchList> lunchlist = [];

//GetList of Service  Categories(main page load)

  Future<List<LunchList>> getluchlist() async {
    lunchlist.clear();
    // ignore: prefer_interpolation_to_compose_strings
    var url = Uri.parse(
        // ignore: prefer_interpolation_to_compose_strings
        "http://" + constant.BASE_URL.trim() + "/lunch/list");
    final response = await http.get(url);
    print(response.body);
    var data = json.decode(response.body);
    if (response.statusCode == 200) {
      // If the server returns a 200 OK response, parse the JSON
      print('load sucess');

      final appontment = lunchListFromJson(response.body);

      print("appointment " + appontment.length.toString());

      lunchlist.addAll(appontment);
      print(response.body);

      return lunchlist;
    } else {
      return lunchlist;

      throw Exception('Failed to load data');
    }
    lunchlist.clear();
  }

  List<DinnerList> dinnerlist = [];

  Future<List<DinnerList>> getDinnerlist() async {
    dinnerlist.clear();
    // ignore: prefer_interpolation_to_compose_strings
    var url = Uri.parse(
        // ignore: prefer_interpolation_to_compose_strings
        "http://" + constant.BASE_URL.trim() + "/api/dinner-list");
    final response = await http.get(url);
    print(response.body);
    var data = json.decode(response.body);
    if (response.statusCode == 200) {
      // If the server returns a 200 OK response, parse the JSON
      print('load sucess');

      final appontment = dinnerListFromJson(response.body);

      print("appointment " + appontment.length.toString());

      dinnerlist.addAll(appontment);
      print(response.body);

      return dinnerlist;
    } else {
      return dinnerlist;

      throw Exception('Failed to load data');
    }
  }

  List<BreakfastList> breakfastlist = [];
//GetList of Service  Categories(main page load)

  Future<List<BreakfastList>> getBreakfastlist() async {
    breakfastlist.clear();
    // ignore: prefer_interpolation_to_compose_strings
    var url = Uri.parse(
        // ignore: prefer_interpolation_to_compose_strings
        "http://" + constant.BASE_URL.trim() + "/api/breakfasts");
    final response = await http.get(url);
    print(response.body);
    var data = json.decode(response.body);
    if (response.statusCode == 200) {
      // If the server returns a 200 OK response, parse the JSON
      print('load sucess');

      final appontment = breakfastListFromJson(response.body);

      print("appointment " + appontment.length.toString());

      breakfastlist.addAll(appontment);
      print(response.body);

      return breakfastlist;
    } else {
      return breakfastlist;

      throw Exception('Failed to load data');
    }
  }

  List<DesertList> desertlist = [];

  Future<List<DesertList>> getDesertlist() async {
    desertlist.clear();
    // ignore: prefer_interpolation_to_compose_strings
    var url = Uri.parse(
        // ignore: prefer_interpolation_to_compose_strings
        "http://" + constant.BASE_URL.trim() + "/api/desert");
    final response = await http.get(url);
    print(response.body);
    var data = json.decode(response.body);
    if (response.statusCode == 200) {
      // If the server returns a 200 OK response, parse the JSON
      print('load sucess');

      final appontment = desertListFromJson(response.body);

      print("appointment " + appontment.length.toString());

      desertlist.addAll(appontment);
      print(response.body);

      return desertlist;
    } else {
      return desertlist;

      throw Exception('Failed to load data');
    }
  }

  List<MorningTea> morninglist = [];
  Apicontroller apicontroller = Apicontroller();
  Future<List<MorningTea>> getMorninglist() async {
    morninglist.clear();
    // ignore: prefer_interpolation_to_compose_strings
    var url = Uri.parse(
        // ignore: prefer_interpolation_to_compose_strings
        "http://" + constant.BASE_URL.trim() + "/api/morning");
    final response = await http.get(url);
    print(response.body);
    var data = json.decode(response.body);
    if (response.statusCode == 200) {
      // If the server returns a 200 OK response, parse the JSON
      print('load sucess');

      final appontment = morningTeaFromJson(response.body);

      print("appointment " + appontment.length.toString());

      morninglist.addAll(appontment);
      print(response.body);

      return morninglist;
    } else {
      return morninglist;

      throw Exception('Failed to load data');
    }
  }

  List<EverningTea> Eveninglist = [];

  Future<List<EverningTea>> geteveninglist() async {
    Eveninglist.clear();
    // ignore: prefer_interpolation_to_compose_strings
    var url = Uri.parse(
        // ignore: prefer_interpolation_to_compose_strings
        "http://" + constant.BASE_URL.trim() + "/api/evening");
    final response = await http.get(url);
    print(response.body);
    var data = json.decode(response.body);
    if (response.statusCode == 200) {
      // If the server returns a 200 OK response, parse the JSON
      print('load sucess');

      final appontment = everningTeaFromJson(response.body);

      print("appointment " + appontment.length.toString());

      Eveninglist.addAll(appontment);
      print(response.body);

      return Eveninglist;
    } else {
      return Eveninglist;

      throw Exception('Failed to load data');
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    print("index is:" + widget.index.toString());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/fonts/bgimage.png"),
                fit: BoxFit.cover,
                colorFilter: null),
          ),
          height: height,
          width: width,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const UpperSection(),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 20),
                ),
                widget.index == 1
                    ? Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: RoundedButton(
                                buttonText: "Add Item  + ",
                                onPress: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => AddedItem(
                                          index: 1,
                                        ),
                                      ));
                                },
                                bgcolor: KOrange),
                          ),
                          FutureBuilder(
                            future: getluchlist(),
                            builder: (context,
                                AsyncSnapshot<List<LunchList>> snapshot) {
                              if (!snapshot.hasData) {
                                // Show a loading spinner or placeholder widget
                                return Center(
                                    child: const CircularProgressIndicator());
                              } else {
                                if (snapshot.data!.isEmpty) {
                                  // Show a message indicating that there is no data available
                                  return const Center(
                                    child: Text('No Data Available.'),
                                  );
                                } else {
                                  // Show the data in a GridView
                                  return GridView.builder(
                                    shrinkWrap: true,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    gridDelegate:
                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                      childAspectRatio: 4.0 / 5.0,
                                      crossAxisCount: 2,
                                      crossAxisSpacing: 0,
                                      mainAxisSpacing: 12,
                                    ),
                                    itemBuilder:
                                        (BuildContext context, index) =>
                                            InkWell(
                                      onTap: () {
                                        Navigator.of(context).push(
                                          MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                                FoodInfoScreen(
                                              AdditionalInformation: snapshot
                                                  .data![index].description,
                                              FoodName:
                                                  snapshot.data![index].name,
                                              FoodPrice:
                                                  snapshot.data![index].price,
                                              index: widget.index,
                                            ),
                                          ),
                                        );
                                      },
                                      child: FoodCard(
                                        foodname: snapshot.data![index].name,
                                        price: snapshot.data![index].price
                                            .toString(),
                                      ),
                                    ),
                                    itemCount: snapshot.data!.length,
                                  );
                                }
                              }
                            },
                          ),
                        ],
                      )
                    : widget.index == 2
                        ? Column(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: RoundedButton(
                                    buttonText: "Add Item  + ",
                                    onPress: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => AddedItem(
                                              index: 2,
                                            ),
                                          ));
                                    },
                                    bgcolor: KOrange),
                              ),
                              FutureBuilder(
                                future: getDinnerlist(),
                                builder: (context,
                                    AsyncSnapshot<List<DinnerList>> snapshot) {
                                  if (snapshot.hasData) {
                                    if (snapshot.data!.isEmpty) {
                                      return const Center(
                                        child: Text('No Data Available.'),
                                      );
                                    }
                                    return GridView.builder(
                                      shrinkWrap: true,
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      gridDelegate:
                                          const SliverGridDelegateWithFixedCrossAxisCount(
                                              childAspectRatio: 4.0 / 5.0,
                                              crossAxisCount: 2,
                                              crossAxisSpacing: 0,
                                              mainAxisSpacing: 12),
                                      itemBuilder: (BuildContext context,
                                              index) =>
                                          InkWell(
                                              onTap: () {
                                                Navigator.of(context).push(
                                                    MaterialPageRoute(
                                                        builder: (BuildContext
                                                                context) =>
                                                            FoodInfoScreen(
                                                              AdditionalInformation:
                                                                  snapshot
                                                                      .data![
                                                                          index]
                                                                      .description,
                                                              FoodName: snapshot
                                                                  .data![index]
                                                                  .name,
                                                              FoodPrice:
                                                                  snapshot
                                                                      .data![
                                                                          index]
                                                                      .price,
                                                              index:
                                                                  widget.index,
                                                            )));
                                              },
                                              child: FoodCard(
                                                foodname: snapshot
                                                    .data![index].name
                                                    .toString(),
                                                price: snapshot
                                                    .data![index].price
                                                    .toString(),
                                              )),
                                      itemCount: snapshot.data!.length,
                                    );
                                  } else if (snapshot.hasError) {
                                    return const Center(
                                      child: Text('Error fetching data.'),
                                    );
                                  } else {
                                    return const Center(
                                      child: CircularProgressIndicator(),
                                    );
                                  }
                                },
                              ),
                            ],
                          )
                        : widget.index == 0
                            ? Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20),
                                    child: RoundedButton(
                                        buttonText: "Add Item  + ",
                                        onPress: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) => AddedItem(
                                                  index: 0,
                                                ),
                                              ));
                                        },
                                        bgcolor: KOrange),
                                  ),
                                  FutureBuilder(
                                    future: getBreakfastlist(),
                                    builder: (context,
                                        AsyncSnapshot<List<BreakfastList>>
                                            snapshot) {
                                      if (snapshot.hasData) {
                                        if (snapshot.data!.isEmpty) {
                                          return const Center(
                                            child: Text('No data available.'),
                                          );
                                        }
                                        return GridView.builder(
                                          shrinkWrap: true,
                                          physics:
                                              const NeverScrollableScrollPhysics(),
                                          gridDelegate:
                                              const SliverGridDelegateWithFixedCrossAxisCount(
                                                  childAspectRatio: 4.0 / 5.0,
                                                  crossAxisCount: 2,
                                                  crossAxisSpacing: 0,
                                                  mainAxisSpacing: 12),
                                          itemBuilder:
                                              (BuildContext context, index) =>
                                                  InkWell(
                                                      onTap: () {
                                                        Navigator.of(context).push(
                                                            MaterialPageRoute(
                                                                builder: (BuildContext
                                                                        context) =>
                                                                    FoodInfoScreen(
                                                                      index: widget
                                                                          .index,
                                                                      AdditionalInformation: snapshot
                                                                          .data![
                                                                              index]
                                                                          .description,
                                                                      FoodName: snapshot
                                                                          .data![
                                                                              index]
                                                                          .name,
                                                                      FoodPrice: snapshot
                                                                          .data![
                                                                              index]
                                                                          .price,
                                                                    )));
                                                      },
                                                      child: FoodCard(
                                                        foodname: snapshot
                                                            .data![index].name,
                                                        price: snapshot
                                                            .data![index].price
                                                            .toString(),
                                                      )),
                                          itemCount: snapshot.data!.length,
                                        );
                                      } else if (snapshot.hasError) {
                                        return const Center(
                                          child: Text('Error fetching data.'),
                                        );
                                      } else {
                                        return const Center(
                                          child: CircularProgressIndicator(),
                                        );
                                      }
                                    },
                                  ),
                                ],
                              )
                            : widget.index == 4
                                ? Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20),
                                        child: RoundedButton(
                                            buttonText: "Add Item  + ",
                                            onPress: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        AddedItem(
                                                      index: 4,
                                                    ),
                                                  ));
                                            },
                                            bgcolor: KOrange),
                                      ),
                                      FutureBuilder(
                                        future: geteveninglist(),
                                        builder: (context,
                                            AsyncSnapshot<List<EverningTea>>
                                                snapshot) {
                                          if (snapshot.hasData) {
                                            if (snapshot.data!.isEmpty) {
                                              return const Center(
                                                child:
                                                    Text('No Data Available.'),
                                              );
                                            }
                                            return GridView.builder(
                                              shrinkWrap: true,
                                              physics:
                                                  const NeverScrollableScrollPhysics(),
                                              gridDelegate:
                                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                                      childAspectRatio:
                                                          4.0 / 5.0,
                                                      crossAxisCount: 2,
                                                      crossAxisSpacing: 0,
                                                      mainAxisSpacing: 12),
                                              itemBuilder:
                                                  (BuildContext context,
                                                          index) =>
                                                      InkWell(
                                                          onTap: () {
                                                            Navigator.of(context).push(
                                                                MaterialPageRoute(
                                                                    builder: (BuildContext
                                                                            context) =>
                                                                        FoodInfoScreen(
                                                                          index:
                                                                              widget.index,
                                                                          AdditionalInformation: snapshot
                                                                              .data![index]
                                                                              .description,
                                                                          FoodName: snapshot
                                                                              .data![index]
                                                                              .name,
                                                                          FoodPrice: snapshot
                                                                              .data![index]
                                                                              .price,
                                                                        )));
                                                          },
                                                          child: FoodCard(
                                                            foodname: snapshot
                                                                .data![index]
                                                                .name,
                                                            price: snapshot
                                                                .data![index]
                                                                .price
                                                                .toString(),
                                                          )),
                                              itemCount: snapshot.data!.length,
                                            );
                                          } else if (snapshot.hasError) {
                                            return const Center(
                                              child:
                                                  Text('Error fetching data.'),
                                            );
                                          } else {
                                            return const Center(
                                              child:
                                                  CircularProgressIndicator(),
                                            );
                                          }
                                        },
                                      ),
                                    ],
                                  )
                                : widget.index == 5
                                    ? Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 20),
                                            child: RoundedButton(
                                                buttonText: "Add Item  + ",
                                                onPress: () {
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                        builder: (context) =>
                                                            AddedItem(
                                                          index: 5,
                                                        ),
                                                      ));
                                                },
                                                bgcolor: KOrange),
                                          ),
                                          FutureBuilder<List<MorningTea>>(
                                            future: getMorninglist(),
                                            builder: (context, snapshot) {
                                              if (!snapshot.hasData) {
                                                // Handle loading state
                                                return Center(
                                                    child:
                                                        const CircularProgressIndicator());
                                              } else if (snapshot.hasError) {
                                                // Handle error state
                                                return Text(
                                                    'Error: ${snapshot.error}');
                                              } else if (snapshot.data ==
                                                      null ||
                                                  snapshot.data!.isEmpty) {
                                                // Handle no data available state
                                                return const Center(
                                                    child: Center(
                                                        child: Text(
                                                            'No Data Available')));
                                              } else {
                                                return GridView.builder(
                                                  shrinkWrap: true,
                                                  physics:
                                                      const NeverScrollableScrollPhysics(),
                                                  gridDelegate:
                                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                                          childAspectRatio:
                                                              4.0 / 5.0,
                                                          crossAxisCount: 2,
                                                          crossAxisSpacing: 0,
                                                          mainAxisSpacing: 12),
                                                  itemBuilder:
                                                      (BuildContext context,
                                                              index) =>
                                                          InkWell(
                                                              onTap: () {
                                                                Navigator.of(context).push(
                                                                    MaterialPageRoute(
                                                                        builder: (BuildContext
                                                                                context) =>
                                                                            FoodInfoScreen(
                                                                              index: widget.index,
                                                                              AdditionalInformation: snapshot.data![index].description,
                                                                              FoodName: snapshot.data![index].name,
                                                                              FoodPrice: snapshot.data![index].price,
                                                                            )));
                                                              },
                                                              child: FoodCard(
                                                                foodname: snapshot
                                                                    .data![
                                                                        index]
                                                                    .name,
                                                                price: snapshot
                                                                    .data![
                                                                        index]
                                                                    .price
                                                                    .toString(),
                                                              )),
                                                  itemCount:
                                                      snapshot.data!.length,
                                                );
                                              }
                                            },
                                          ),
                                        ],
                                      )
                                    : widget.index == 3
                                        ? Column(
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 20),
                                                child: RoundedButton(
                                                    buttonText: "Add Item  + ",
                                                    onPress: () {
                                                      Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                            builder:
                                                                (context) =>
                                                                    AddedItem(
                                                              index: 3,
                                                            ),
                                                          ));
                                                    },
                                                    bgcolor: KOrange),
                                              ),
                                              FutureBuilder<List<DesertList>>(
                                                future: getDesertlist(),
                                                builder: (context, snapshot) {
                                                  if (!snapshot.hasData) {
                                                    // Handle loading state
                                                    return Center(
                                                        child:
                                                            const CircularProgressIndicator());
                                                  } else if (snapshot
                                                      .hasError) {
                                                    // Handle error state
                                                    return Text(
                                                        'Error: ${snapshot.error}');
                                                  } else if (snapshot.data ==
                                                          null ||
                                                      snapshot.data!.isEmpty) {
                                                    // Handle no data available state
                                                    return const Center(
                                                        child: Center(
                                                            child: Text(
                                                                'No Data Available')));
                                                  } else {
                                                    return GridView.builder(
                                                      shrinkWrap: true,
                                                      physics:
                                                          const NeverScrollableScrollPhysics(),
                                                      gridDelegate:
                                                          const SliverGridDelegateWithFixedCrossAxisCount(
                                                              childAspectRatio:
                                                                  4.0 / 5.0,
                                                              crossAxisCount: 2,
                                                              crossAxisSpacing:
                                                                  0,
                                                              mainAxisSpacing:
                                                                  12),
                                                      itemBuilder:
                                                          (BuildContext context,
                                                                  index) =>
                                                              InkWell(
                                                                  onTap: () {
                                                                    Navigator.of(
                                                                            context)
                                                                        .push(MaterialPageRoute(
                                                                            builder: (BuildContext context) => FoodInfoScreen(
                                                                                  index: widget.index,
                                                                                  AdditionalInformation: snapshot.data![index].description,
                                                                                  FoodName: snapshot.data![index].name,
                                                                                  FoodPrice: snapshot.data![index].price,
                                                                                )));
                                                                  },
                                                                  child:
                                                                      FoodCard(
                                                                    foodname: snapshot
                                                                        .data![
                                                                            index]
                                                                        .name,
                                                                    price: snapshot
                                                                        .data![
                                                                            index]
                                                                        .price
                                                                        .toString(),
                                                                  )),
                                                      itemCount:
                                                          snapshot.data!.length,
                                                    );
                                                  }
                                                },
                                              ),
                                            ],
                                          )
                                        : Container()
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class FoodCard extends StatelessWidget {
  FoodCard({super.key, required this.foodname, required this.price});
  String foodname;
  String price;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
                border: Border.all(color: Colors.white),
                color: Kblack,
                borderRadius: BorderRadius.circular(29)),
            height: 240,
            width: 167,
            child: Column(
              children: [
                const SizedBox(
                  height: 30,
                ),
                Container(
                    width: 163,
                    height: 100,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/images/egg.png"),
                        fit: BoxFit.fill,
                      ),
                    )),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  foodname,
                  style: const TextStyle(
                    fontFamily: 'Segoe UI',
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(29)),
                  // ignore: sort_child_properties_last
                  child: Center(
                    child: Text('Rs' + price,
                        style: const TextStyle(
                          fontFamily: 'Segoe UI',
                          fontSize: 18,
                          color: Kblack,
                          fontWeight: FontWeight.w700,
                        )),
                  ),
                  width: 141,
                  height: 43,
                )
              ],
            ),
          )
        ],
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
      width: double.infinity,
      height: 217,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/foodupperbanner.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              width: 354,
              height: 144,
              decoration: BoxDecoration(
                  color: KlightGreen, borderRadius: BorderRadius.circular(29)),
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [
                      SizedBox(
                        width: 10,
                      ),
                      CircleLogo(),
                      SizedBox(
                        width: 20,
                      ),
                      Center(
                        child: Text(
                          'Vanni',
                          style: TextStyle(
                            fontFamily: 'Segoe UI',
                            fontSize: 31.0,
                            color: Colors.black,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Center(
                        child: Text('Eats',
                            style: TextStyle(
                              fontFamily: 'Segoe UI',
                              fontSize: 31.0,
                              color: Colors.black,
                              fontWeight: FontWeight.w800,
                            )),
                      )
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
