import 'package:flutter/material.dart';
import 'package:servicehub_client/Colors.dart';
import 'package:servicehub_client/screen/appoinment_info_screen.dart';
import 'package:servicehub_client/screen/past_appoinment_info_screen.dart';
import 'package:intl/intl.dart';

class AppoinmentCard extends StatelessWidget {
  const AppoinmentCard(
      {super.key,
      required this.isPending,
      this.isPast = false,
      required this.date,
      required this.time,
      required this.food_name,
      required this.location,
      required this.price,
      required this.foodtype,
      required this.status,
      required this.count,
      required this.phonenumber,
      required this.id});

  final bool isPending;
  final bool isPast;
  final String date;
  final String time;
  final String location;
  final String price;
  final String food_name;
  final String foodtype;
  final String status;
  final String count;
  final String phonenumber;
  final String id;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (isPast) {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (BuildContext context) =>
                  const PastAppoinmentInfoScreen()));
        } else {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (BuildContext context) => AppoinmentInfoScreen(
                    count: count,
                    foodname: food_name,
                    phonenumber: phonenumber,
                    date: date,
                    foodType: foodtype,
                    location: location,
                    price: price,
                    quantity: count.toString(),
                    time: time,
                    status: status,
                    id: id,
                  )));
        }
      },
      child: Container(
        height: 60,
        margin: const EdgeInsets.symmetric(vertical: 7),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(9)),
        child: Row(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color: status == 'pending'
                        ? KOrange
                        : status == "approved"
                            ? KGreen
                            : status == "collected"
                                ? Kyellow
                                : Colors.red,
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(8),
                        bottomLeft: Radius.circular(8))),
                child: Padding(
                  padding: const EdgeInsets.only(left: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        DateFormat('yyyy-MM-dd').format(DateTime.parse(date)),
                        style: const TextStyle(
                          fontFamily: 'Segoe UI',
                          fontSize: 12.0,
                          color: Kdarkblue,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        time,
                        style: const TextStyle(
                          fontFamily: 'Segoe UI',
                          fontSize: 9.0,
                          color: Kdarkblue,
                        ),
                      ),
                      const SizedBox(
                        height: 2,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Icon(
                            Icons.location_on_outlined,
                            size: 10,
                            color: Colors.black,
                          ),
                          Text(
                            location,
                            style: const TextStyle(
                              fontFamily: 'Segoe UI',
                              fontSize: 8.0,
                              color: Kdarkblue,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Container(
                decoration: const BoxDecoration(
                    color: Kappoimentbg,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(8),
                        bottomRight: Radius.circular(8))),
                child: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Stack(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            foodtype,
                            style: const TextStyle(
                                fontStyle: FontStyle.normal,
                                fontFamily: 'Segoe UI',
                                fontSize: 16.0,
                                color: Kdarkblue,
                                fontWeight: FontWeight.w700),
                          ),
                          Text(
                            food_name,
                            style: const TextStyle(
                              fontFamily: 'Segoe UI',
                              fontSize: 10.0,
                              fontWeight: FontWeight.w800,
                              color: Kdarkblue,
                            ),
                          ),
                          Text(
                            price + " Rs ",
                            style: const TextStyle(
                              fontFamily: 'Segoe UI',
                              fontSize: 10.0,
                              color: Kdarkblue,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      isPending
                          ? Positioned(
                              right: 8,
                              top: 10,
                              child: Container(
                                  height: 25,
                                  width: 90,
                                  decoration: BoxDecoration(
                                      color: status == 'pending'
                                          ? KOrange
                                          : status == "approved"
                                              ? KGreen
                                              : status == "collected"
                                                  ? Kyellow
                                                  : Colors.red,
                                      borderRadius: BorderRadius.circular(8)),
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        left: 15, right: 15, top: 2, bottom: 2),
                                    child: Center(
                                      child: Text(
                                        status,
                                        style: TextStyle(
                                          fontFamily: 'Segoe UI',
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600,
                                          color: Kblack,
                                        ),
                                      ),
                                    ),
                                  )))
                          : const SizedBox()
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
