import 'package:flutter/material.dart';
import 'package:servicehub_client/Colors.dart';
import 'package:servicehub_client/screen/task_complete_screen.dart';
import 'package:servicehub_client/styles.dart';
import 'package:servicehub_client/widget/rounded_button.dart';

class TaskConfirmationScreen extends StatelessWidget {
  const TaskConfirmationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: Styles.appBar(context),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Text(
            'Confirm Info',
            style: screenTitle,
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            'Your Appointment for',
            style: TextStyle(
              fontFamily: 'Segoe UI',
              fontSize: 12.0,
              color: lightGrey,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(
            height: 7,
          ),
          Text(
            'Plumbing works',
            style: TextStyle(
              fontFamily: 'Segoe UI',
              fontSize: 20.0,
              color: darkText,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(
            height: 4,
          ),
          Text(
            'Water tap fix',
            style: TextStyle(
              fontFamily: 'Segoe UI',
              fontSize: 12.0,
              color: lightGrey,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            'Confirmed for',
            style: TextStyle(
              fontFamily: 'Segoe UI',
              fontSize: 12.0,
              color: lightGrey,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(
            height: 2,
          ),
          Text(
            'June 12 2020 10:00 am',
            style: TextStyle(
              fontFamily: 'Segoe UI',
              fontSize: 20.0,
              color: darkText,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(
            height: 2,
          ),
          Text(
            '10:00 AM',
            style: TextStyle(
              fontFamily: 'Segoe UI',
              fontSize: 12.0,
              color: lightGrey,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          locationSection(),
          const SizedBox(
            height: 20,
          ),
          additionalInfo(),
          const SizedBox(
            height: 43,
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) =>
                        const TaskCompleteScreen()));
              },
              // ignore: sort_child_properties_last
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 8),
                child: Text(
                  'Confirm',
                  style: TextStyle(
                      fontFamily: 'Segoe UI',
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: white),
                ),
              ),
              style: ElevatedButton.styleFrom(
                elevation: 0,
                backgroundColor: kPrimary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(7), // <-- Radius
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
        ]),
      ),
    );
  }

  Widget locationSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          'Locaion',
          style: TextStyle(
            fontFamily: 'Segoe UI',
            fontSize: 12.0,
            color: lightGrey,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          'Home',
          style: TextStyle(
            fontFamily: 'Segoe UI',
            fontSize: 15.0,
            color: darkText,
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(
          height: 2,
        ),
        Text(
          '21, Passara Road\nHindagoda\nBadulla',
          style: TextStyle(
            fontFamily: 'Segoe UI',
            fontSize: 12.0,
            color: lightGrey,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }

  Widget additionalInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          'Additional Information',
          style: TextStyle(
            fontFamily: 'Segoe UI',
            fontSize: 12.0,
            color: lightGrey,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(
          height: 7,
        ),
        Text(
          'Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs. The passage is attributed to an unknown typesetter in the 15th century who is thought to have scrambled parts of Cicero\'s De Finibus Bonorum et Malorum for use in a type specimen book.',
          style: TextStyle(
            fontFamily: 'Segoe UI',
            fontSize: 12.0,
            color: Color(0xFF828282),
          ),
        ),
      ],
    );
  }
}
