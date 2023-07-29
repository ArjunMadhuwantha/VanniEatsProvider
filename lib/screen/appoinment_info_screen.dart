import 'package:flutter/material.dart';
import 'package:servicehub_client/Colors.dart';
import 'package:servicehub_client/controller/apicontroller.dart';
import 'package:servicehub_client/screen/request_list_screen.dart';
import 'package:servicehub_client/widget/rounded_button.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:intl/intl.dart';

class AppoinmentInfoScreen extends StatefulWidget {
  AppoinmentInfoScreen({
    super.key,
    required this.date,
    required this.foodType,
    required this.location,
    required this.price,
    required this.quantity,
    required this.time,
    required this.status,
    required this.phonenumber,
    required this.id,
    required this.foodname,
    required this.count,
  });
  String foodType,
      date,
      time,
      quantity,
      price,
      location,
      status,
      phonenumber,
      id,
      foodname,
      count;

  @override
  State<AppoinmentInfoScreen> createState() => _AppoinmentInfoScreenState();
}

class _AppoinmentInfoScreenState extends State<AppoinmentInfoScreen> {
  Apicontroller apicontroller = Apicontroller();
  Future<void> _makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }

  String userid = "", username = "";

  getuserdata() async {
    final details = await SharedPreferences.getInstance();
    setState(() {
      userid = details.getString('userId').toString();
      username = details.getString('userName').toString();
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getuserdata();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: white,
      body: SingleChildScrollView(
        child: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/fonts/bgimage.png"),
                  fit: BoxFit.cover,
                  colorFilter: null)),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 35, vertical: 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 40,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(29)),
                  child: Padding(
                    padding: EdgeInsets.all(30),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Order Info',
                            style: screenTitle,
                          ),
                          const SizedBox(
                            height: 2,
                          ),
                          Text(
                            'Ordered By ' + username,
                            style: TextStyle(
                              fontFamily: 'Segoe UI',
                              fontSize: 20.0,
                              color: darkText,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(
                            height: 7,
                          ),
                          const Text(
                            'Your Order for',
                            style: TextStyle(
                              fontFamily: 'Segoe UI',
                              fontSize: 15.0,
                              color: darkText,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          const SizedBox(
                            height: 3,
                          ),
                          Text(
                            widget.foodType,
                            style: TextStyle(
                              fontFamily: 'Segoe UI',
                              fontSize: 20.0,
                              color: lightText,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const SizedBox(
                            height: 7,
                          ),
                          const Text(
                            'Date time',
                            style: TextStyle(
                              fontFamily: 'Segoe UI',
                              fontSize: 15.0,
                              color: darkText,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          const SizedBox(
                            height: 2,
                          ),
                          Text(
                            DateFormat('yyyy-MM-dd')
                                    .format(DateTime.parse(widget.date)) +
                                " " +
                                widget.time,
                            style: TextStyle(
                              fontFamily: 'Segoe UI',
                              fontSize: 20.0,
                              color: lightText,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const SizedBox(
                            height: 2,
                          ),
                          const Text(
                            'Quantity ',
                            style: TextStyle(
                              fontFamily: 'Segoe UI',
                              fontSize: 15.0,
                              color: darkText,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          Text(
                            widget.quantity + " Pisces ",
                            style: TextStyle(
                              fontFamily: 'Segoe UI',
                              fontSize: 20.0,
                              color: lightText,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const Text(
                            'Price ',
                            style: TextStyle(
                              fontFamily: 'Segoe UI',
                              fontSize: 15.0,
                              color: darkText,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          Text(
                            'Rs' + widget.price + ".00",
                            style: TextStyle(
                              fontFamily: 'Segoe UI',
                              fontSize: 20.0,
                              color: lightText,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const Text(
                            'Location ',
                            style: TextStyle(
                              fontFamily: 'Segoe UI',
                              fontSize: 15.0,
                              color: darkText,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          Text(
                            widget.location,
                            style: TextStyle(
                              fontFamily: 'Segoe UI',
                              fontSize: 20.0,
                              color: lightText,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Row(
                            children: [
                              const Text(
                                'Contact Number ',
                                style: TextStyle(
                                  fontFamily: 'Segoe UI',
                                  fontSize: 13.0,
                                  color: darkText,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                widget.phonenumber.toString(),
                                style: TextStyle(
                                  fontFamily: 'Segoe UI',
                                  fontSize: 17.0,
                                  color: lightText,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    _makePhoneCall(
                                        widget.phonenumber.toString());
                                  });
                                },
                                child: Container(
                                  height: 30,
                                  width: 30,
                                  decoration: BoxDecoration(
                                      color: Colors.green,
                                      borderRadius: BorderRadius.circular(29)),
                                  child: Icon(
                                    Icons.call,
                                    color: Kyellow,
                                  ),
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          RoundedButton(
                            bgcolor: KOrange,
                            buttonText: 'Cancle',
                            onPress: () {
                              apicontroller.UpdateOrder(
                                  widget.id,
                                  widget.foodname,
                                  "Cancle",
                                  widget.date,
                                  widget.time,
                                  widget.location,
                                  widget.location,
                                  widget.price,
                                  widget.count,
                                  context);
                            },
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          RoundedButton(
                            bgcolor: KOrange,
                            buttonText: 'Accept',
                            onPress: () {
                              apicontroller.UpdateOrder(
                                  widget.id,
                                  widget.foodname,
                                  "approved",
                                  widget.date,
                                  widget.time,
                                  widget.location,
                                  widget.location,
                                  widget.price,
                                  widget.count,
                                  context);
                            },
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          RoundedButton(
                            bgcolor: KOrange,
                            buttonText: 'Collected',
                            onPress: () {
                              apicontroller.UpdateOrder(
                                  widget.id,
                                  widget.foodname,
                                  "collected",
                                  widget.date,
                                  widget.time,
                                  widget.location,
                                  widget.location,
                                  widget.price,
                                  widget.count,
                                  context);
                            },
                          )
                        ]),
                  ),
                )
              ],
            ),
          ),
        ),
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

  Widget budget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          'Budget',
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
          'LKR 1500',
          style: TextStyle(
            fontFamily: 'Segoe UI',
            fontSize: 20.0,
            color: Color(0xFF828282),
            fontWeight: FontWeight.w700,
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
