import 'package:flutter/material.dart';
import 'package:servicehub_client/Colors.dart';

class PastAppoinmentInfoScreen extends StatelessWidget {
  const PastAppoinmentInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        elevation: 0,
        //leadingWidth: 30,
        titleSpacing: 0,
        backgroundColor: white,
        foregroundColor: Colors.black,
        leading: Padding(
          padding: const EdgeInsets.only(left: 22),
          child: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
              size: 24,
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        title: const Text('Back'),
        actions: const [
          Padding(
            padding: EdgeInsets.only(top: 10, right: 25),
            child: Text(
              'Rate Experince',
              style: TextStyle(
                fontFamily: 'Segoe UI',
                fontSize: 22.0,
                color: kPrimary,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Text(
            'Appointment Info',
            style: screenTitle,
          ),
          const SizedBox(
            height: 7,
          ),
          Text(
            'Confirmed on 9 June 2020 11:40 am',
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
            'Date time',
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
            height: 20,
          ),
          locationSection(),
          const SizedBox(
            height: 20,
          ),
          additionalInfo(),
          const SizedBox(
            height: 20,
          ),
          provider(),
          const SizedBox(
            height: 20,
          ),
          paymentInformation(),
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
          height: 5,
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

  Widget provider() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          'Provider',
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
          'Sam Smith',
          style: TextStyle(
            fontFamily: 'Segoe UI',
            fontSize: 15.0,
            color: Color(0xFF828282),
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          '0777 123 4557',
          style: TextStyle(
            fontFamily: 'Segoe UI',
            fontSize: 12.0,
            color: Color(0xFF828282),
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(
          height: 1,
        ),
        Text(
          'sam@gmail.com',
          style: TextStyle(
            fontFamily: 'Segoe UI',
            fontSize: 12.0,
            color: Color(0xFF828282),
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }

  Widget paymentInformation() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Payment Information',
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
          'Paid',
          style: TextStyle(
            fontFamily: 'Segoe UI',
            fontSize: 15.0,
            color: Color(0xFF828282),
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          'CARD PAYMENT (VISA 8045)',
          style: TextStyle(
            fontFamily: 'Segoe UI',
            fontSize: 12.0,
            color: Color(0xFF828282),
            fontWeight: FontWeight.w600,
          ),
        ),
        Text(
          '2020-10-16',
          style: TextStyle(
            fontFamily: 'Segoe UI',
            fontSize: 12.0,
            color: Color(0xFF828282),
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
