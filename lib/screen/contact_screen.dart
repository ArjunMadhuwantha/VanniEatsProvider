import 'package:flutter/material.dart';
import 'package:servicehub_client/Colors.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset('assets/images/map.png'),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 15),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'We\'ve here',
                              style: TextStyle(
                                fontFamily: 'Segoe UI',
                                fontSize: 25.0,
                                color: darkText,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Text(
                              'Lorem ipsum, or lipsum as it is sometimes known, is ',
                              style: TextStyle(
                                fontFamily: 'Segoe UI',
                                fontSize: 20.0,
                                color: darkText,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 7,
                      ),
                      Container(
                          decoration: BoxDecoration(
                              color: kPrimary,
                              borderRadius: BorderRadius.circular(50)),
                          child: const Padding(
                            padding: EdgeInsets.all(15.0),
                            child: Icon(
                              Icons.location_on_sharp,
                              color: white,
                            ),
                          ))
                    ],
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'Call us',
                              style: TextStyle(
                                fontFamily: 'Segoe UI',
                                fontSize: 25.0,
                                color: darkText,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Text(
                              'Lorem ipsum, or lipsum as',
                              style: TextStyle(
                                fontFamily: 'Segoe UI',
                                fontSize: 20.0,
                                color: darkText,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 7,
                      ),
                      Container(
                          decoration: BoxDecoration(
                              color: kPrimary,
                              borderRadius: BorderRadius.circular(50)),
                          child: const Padding(
                            padding: EdgeInsets.all(15.0),
                            child: Icon(
                              Icons.call,
                              color: white,
                            ),
                          ))
                    ],
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'Email us',
                              style: TextStyle(
                                fontFamily: 'Segoe UI',
                                fontSize: 25.0,
                                color: darkText,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Text(
                              'Lorem ipsum, or lipsum as',
                              style: TextStyle(
                                fontFamily: 'Segoe UI',
                                fontSize: 20.0,
                                color: darkText,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 7,
                      ),
                      Container(
                          decoration: BoxDecoration(
                              color: kPrimary,
                              borderRadius: BorderRadius.circular(50)),
                          child: const Padding(
                            padding: EdgeInsets.all(15.0),
                            child: Icon(
                              Icons.mail,
                              color: white,
                            ),
                          ))
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
