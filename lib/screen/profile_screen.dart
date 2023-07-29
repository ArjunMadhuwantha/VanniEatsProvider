import 'package:flutter/material.dart';
import 'package:servicehub_client/Colors.dart';
import 'package:servicehub_client/screen/add_new_address_screen.dart';
import 'package:servicehub_client/widget/CircleLogo.dart';
import 'package:servicehub_client/widget/rounded_button.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../widget/UpperSection.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool _isButtonOn = true;
  bool _readonly = true;
  final _fullnameformKey = GlobalKey<FormState>();
  final _emailformKey = GlobalKey<FormState>();
  final _phnnumberformkey = GlobalKey<FormState>();
  void _toggleButton() {
    setState(() {
      _isButtonOn = !_isButtonOn;
    });
  }

  void readonly() {
    setState(() {
      _readonly = !_readonly;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _toggleButton();
    readonly();
    getcustomerdata();
  }

  getcustomerdata() async {
    final details = await SharedPreferences.getInstance();
    setState(() {
      fullNameControlleer.text = "Admin";

      // emailControlleer.text = customerdetails.getString('email').toString();
      phoneNumberControlleer.text = "Password";
    });
  }

  final fullNameControlleer = TextEditingController();
  final phoneNumberControlleer = TextEditingController();
  final emailControlleer = TextEditingController();
  final addressControlleer = TextEditingController();

  final fullNameFocusNode = FocusNode();
  final phoneNumberFocusNode = FocusNode();
  final emailFocusNode = FocusNode();
  final addressFocusNode = FocusNode();

  @override
  void dispose() {
    super.dispose();
    fullNameFocusNode.dispose();
    phoneNumberFocusNode.dispose();
    emailFocusNode.dispose();
    fullNameControlleer.dispose();
    phoneNumberControlleer.dispose();
    emailControlleer.dispose();
    addressControlleer.dispose();
    addressFocusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: white,
      body: SingleChildScrollView(
        //   padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 10),
        child: Center(
          child: Container(
            height: height,
            width: width,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/fonts/bgimage.png"),
                    fit: BoxFit.cover,
                    colorFilter: null)),
            child: Stack(
              children: [
                Positioned(
                  top: 135,
                  left: 21,
                  child: CircleLogo(),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const UpperSection(),
                    SizedBox(
                      height: 80,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 35, vertical: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'My Profile',
                            style: screenTitle,
                          ),
                          const SizedBox(
                            height: 22,
                          ),
                          Text(
                            'Full Name',
                            style: labelText,
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Form(
                            key: _fullnameformKey,
                            autovalidateMode: AutovalidateMode.always,
                            child: TextFormField(
                              readOnly: true,
                              controller: fullNameControlleer,
                              keyboardType: TextInputType.text,
                              focusNode: fullNameFocusNode,
                              style: const TextStyle(
                                fontFamily: 'Segoe UI',
                                fontSize: 20,
                                color: lightText,
                              ),
                              decoration: formInputStyle,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Full name is required';
                                }
                                if (!RegExp(r'^[a-zA-Z ]+$').hasMatch(value)) {
                                  return 'Full name can only contain letters and spaces';
                                }
                                return null;
                              },
                            ),
                          ),
                          Text(
                            'Password',
                            style: labelText,
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Form(
                            key: _phnnumberformkey,
                            autovalidateMode: AutovalidateMode.always,
                            child: TextFormField(
                              maxLength: 10,
                              readOnly: true,
                              controller: phoneNumberControlleer,
                              keyboardType: TextInputType.phone,
                              focusNode: phoneNumberFocusNode,
                              style: const TextStyle(
                                fontFamily: 'Segoe UI',
                                fontSize: 20,
                                color: lightText,
                              ),
                              decoration: formInputStyle,
                              validator: (value) {},
                            ),
                          ),
                          const SizedBox(
                            height: 17,
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          _isButtonOn
                              ? RoundedButton(
                                  buttonText: "Edit Profile",
                                  onPress: () {
                                    readonly();
                                    _toggleButton();
                                  },
                                  bgcolor: KOrange)
                              : RoundedButton(
                                  buttonText: "Save Profile",
                                  onPress: () {
                                    readonly();
                                    _toggleButton();
                                  },
                                  bgcolor: KOrange)
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
    );
  }

  Widget inputField(String labelName, TextEditingController controller,
      TextInputType inputType, FocusNode focusNode) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelName,
          style: labelText,
        ),
        const SizedBox(
          height: 8,
        ),
        TextFormField(
            controller: controller,
            keyboardType: inputType,
            focusNode: focusNode,
            style: const TextStyle(
                fontFamily: 'Segoe UI', fontSize: 20, color: lightText),
            decoration: formInputStyle),
      ],
    );
  }
}
