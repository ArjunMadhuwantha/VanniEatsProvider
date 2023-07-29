import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:servicehub_client/Colors.dart';

import 'package:servicehub_client/styles.dart';

class RequestListScreen extends StatefulWidget {
  const RequestListScreen({super.key});

  @override
  State<RequestListScreen> createState() => _RequestListScreenState();
}

class _RequestListScreenState extends State<RequestListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: Styles.appBar(context),
      body: SingleChildScrollView(
        padding: Styles.defaultPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Requestes',
              style: screenTitle,
            ),
            ListView.builder(
                itemCount: 5,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return requestCard();
                }),
          ],
        ),
      ),
    );
  }

  Widget requestCard() {
    return InkWell(
      onTap: () {
        // Navigator.of(context).push(MaterialPageRoute(
        //     builder: (BuildContext context) => const RequestDetailScreen()));
      },
      child: Container(
        height: 55,
        margin: const EdgeInsets.symmetric(vertical: 7),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(9)),
        child: Row(
          children: [
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                    color: kPrimary,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(8),
                        bottomLeft: Radius.circular(8))),
                child: Padding(
                  padding: const EdgeInsets.only(left: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Text(
                      //   '13 Ju',
                      //   style: TextStyle(
                      //       fontFamily: 'Segoe UI',
                      //       fontSize: 12.0,
                      //       color: white,
                      //       fontWeight: FontWeight.w700),
                      // ),
                      // Text(
                      //   '10.00 am',
                      //   style: TextStyle(
                      //     fontFamily: 'Segoe UI',
                      //     fontSize: 9.0,
                      //     color: white,
                      //   ),
                      // ),
                      // SizedBox(
                      //   height: 2,
                      // ),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.start,
                      //   children: [
                      //     Icon(
                      //       Icons.location_on_outlined,
                      //       size: 10,
                      //     ),
                      //     Text(
                      //       'Home',
                      //       style: TextStyle(
                      //         fontFamily: 'Segoe UI',
                      //         fontSize: 8.0,
                      //         color: white,
                      //       ),
                      //     ),
                      //   ],
                      // )
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Container(
                decoration: const BoxDecoration(
                    color: greyColor,
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
                            'Provider Name',
                            style: TextStyle(
                                fontFamily: 'Segoe UI',
                                fontSize: 16.0,
                                color: darkText,
                                fontWeight: FontWeight.w700),
                          ),
                          Text(
                            'Jun 9 2020 12:00 PM',
                            style: TextStyle(
                              fontFamily: 'Segoe UI',
                              fontSize: 10.0,
                              color: darkText,
                            ),
                          ),
                          Text(
                            'LKR 1500.00',
                            style: TextStyle(
                              fontFamily: 'Segoe UI',
                              fontSize: 10.0,
                              color: darkText,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      Positioned(
                          right: 8,
                          top: 20,
                          child: Container(
                              decoration: BoxDecoration(
                                  color: white,
                                  borderRadius: BorderRadius.circular(8)),
                              child: const Padding(
                                padding: EdgeInsets.only(
                                    left: 15, right: 15, top: 2, bottom: 2),
                                child: Text(
                                  "*****",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontFamily: 'Segoe UI',
                                      fontSize: 12.0,
                                      color: Colors.red,
                                      fontWeight: FontWeight.w600),
                                ),
                              )))
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
