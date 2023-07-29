import 'package:flutter/material.dart';
import 'package:servicehub_client/Colors.dart';
import 'package:servicehub_client/widget/appoinment_card.dart';

class AppointmentScreen extends StatefulWidget {
  const AppointmentScreen({super.key});

  @override
  State<AppointmentScreen> createState() => _AppointmentScreenState();
}

class _AppointmentScreenState extends State<AppointmentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'My Appoinments',
              style: screenTitle,
            ),
            const SizedBox(
              height: 13,
            ),
            ListView.builder(
                itemCount: 5,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Container();
                }),
            const SizedBox(
              height: 27,
            ),
            const Text(
              'Past Appointments',
              style: TextStyle(
                fontFamily: 'Segoe UI',
                fontSize: 20.0,
                color: darkText,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(
              height: 13,
            ),
            ListView.builder(
                itemCount: 5,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Container();
                }),
          ],
        ),
      ),
    );
  }
}
