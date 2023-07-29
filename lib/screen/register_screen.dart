import 'package:flutter/material.dart';
import 'package:servicehub_client/Colors.dart';
import 'package:servicehub_client/controller/apicontroller.dart';
import 'package:servicehub_client/screen/login_screen.dart';
import 'package:servicehub_client/screen/verification_screen.dart';
import 'package:servicehub_client/styles.dart';
import 'package:servicehub_client/widget/CircleLogo.dart';
import 'package:servicehub_client/widget/UpperSection.dart';
import 'package:servicehub_client/widget/rounded_button.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  Apicontroller apicontroller = Apicontroller();
  final fullNameControlleer = TextEditingController();
  final phoneNumberControlleer = TextEditingController();
  final psasswordControlleer = TextEditingController();
  final RepsasswordControlleer = TextEditingController();

  final fullNameFocusNode = FocusNode();
  final phoneNumberFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();
  final RepasswordFocusNode = FocusNode();

  AutovalidateMode switched = AutovalidateMode.disabled;

  final _passwordformKey = GlobalKey<FormState>();
  final _RepasswordformKey = GlobalKey<FormState>();
  final _fullnameformKey = GlobalKey<FormState>();
  final _phonenoformKey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
    fullNameFocusNode.dispose();
    phoneNumberFocusNode.dispose();
    passwordFocusNode.dispose();
    RepasswordFocusNode.dispose();
    fullNameControlleer.dispose();
    phoneNumberControlleer.dispose();
    psasswordControlleer.dispose();
    RepsasswordControlleer.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        // appBar: Styles.appBar(context),

        body: Container(
          height: height,
          width: width,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/fonts/bgimage.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Stack(
            children: [
              const Positioned(
                top: 135,
                left: 21,
                child: CircleLogo(),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      const UpperSection(),
                      const SizedBox(
                        height: 30,
                      ),
                      const Center(
                        child: Text('Welcome',
                            style: TextStyle(
                              fontFamily: 'Segoe UI',
                              fontSize: 40.0,
                              color: KOrange,
                              fontWeight: FontWeight.w900,
                            )),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Form(
                        key: _fullnameformKey,
                        autovalidateMode: switched,
                        child: TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Name is required';
                            }
                            if (!RegExp(r'^[a-zA-Z ]+$').hasMatch(value)) {
                              return 'Full name can only contain letters and spaces';
                            }
                            return null;
                          },
                          controller: fullNameControlleer,
                          focusNode: fullNameFocusNode,
                          style: const TextStyle(
                            fontFamily: 'Segoe UI',
                            fontSize: 20,
                            color: lightText,
                          ),
                          decoration: InputDecoration(
                            filled: true,
                            hintText: '                           Full name',
                            hintStyle: const TextStyle(
                              fontFamily: 'Segoe UI',
                              fontSize: 15,
                              color: Colors.grey,
                              height: 1,
                              fontWeight: FontWeight.w400,
                              letterSpacing: 1,
                            ),
                            fillColor: inputFieldBackgroundColor,
                            contentPadding: const EdgeInsets.all(4.0),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),
                              borderSide: const BorderSide(
                                width: 0,
                                style: BorderStyle.none,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Form(
                        key: _phonenoformKey,
                        autovalidateMode: switched,
                        child: TextFormField(
                          maxLength: 10,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Phone number is required';
                            }
                            if (value.length != 10) {
                              return 'Phone number must have 10 digits';
                            }
                            if (!RegExp(r'^\d{10}$').hasMatch(value)) {
                              return 'Invalid phone number';
                            }
                            return null;
                          },
                          controller: phoneNumberControlleer,
                          focusNode: phoneNumberFocusNode,
                          style: const TextStyle(
                            fontFamily: 'Segoe UI',
                            fontSize: 20,
                            color: lightText,
                          ),
                          decoration: InputDecoration(
                            filled: true,
                            hintText: '                        Phone Number',
                            hintStyle: const TextStyle(
                              fontFamily: 'Segoe UI',
                              fontSize: 15,
                              color: Colors.grey,
                              height: 1,
                              fontWeight: FontWeight.w400,
                              letterSpacing: 1,
                            ),
                            fillColor: inputFieldBackgroundColor,
                            contentPadding: const EdgeInsets.all(4.0),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),
                              borderSide: const BorderSide(
                                width: 0,
                                style: BorderStyle.none,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 1,
                      ),
                      Form(
                        key: _passwordformKey,
                        autovalidateMode: switched,
                        child: TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a password';
                            } else if (value.length < 6) {
                              return 'Password must be at least 6 characters long';
                            }
                            return null;
                          },
                          controller: psasswordControlleer,
                          focusNode: passwordFocusNode,
                          style: const TextStyle(
                            fontFamily: 'Segoe UI',
                            fontSize: 20,
                            color: lightText,
                          ),
                          decoration: InputDecoration(
                            filled: true,
                            hintText: '                            Password',
                            hintStyle: const TextStyle(
                              fontFamily: 'Segoe UI',
                              fontSize: 15,
                              color: Colors.grey,
                              height: 1,
                              fontWeight: FontWeight.w400,
                              letterSpacing: 1,
                            ),
                            fillColor: inputFieldBackgroundColor,
                            contentPadding: const EdgeInsets.all(4.0),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),
                              borderSide: const BorderSide(
                                width: 0,
                                style: BorderStyle.none,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Form(
                        key: _RepasswordformKey,
                        autovalidateMode: switched,
                        child: TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a password';
                            } else if (value.length < 6) {
                              return 'Password must be at least 6 characters long';
                            }
                            return null;
                          },
                          controller: RepsasswordControlleer,
                          focusNode: RepasswordFocusNode,
                          style: const TextStyle(
                            fontFamily: 'Segoe UI',
                            fontSize: 20,
                            color: lightText,
                          ),
                          decoration: InputDecoration(
                            filled: true,
                            hintText:
                                '                       Re Enter password',
                            hintStyle: const TextStyle(
                              fontFamily: 'Segoe UI',
                              fontSize: 15,
                              color: Colors.grey,
                              height: 1,
                              fontWeight: FontWeight.w400,
                              letterSpacing: 1,
                            ),
                            fillColor: inputFieldBackgroundColor,
                            contentPadding: const EdgeInsets.all(4.0),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),
                              borderSide: const BorderSide(
                                width: 0,
                                style: BorderStyle.none,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      RoundedButton(
                        bgcolor: KPink,
                        buttonText: 'Sign up',
                        onPress: () {
                          setState(() {
                            switched = AutovalidateMode.always;
                          });
                          if (_phonenoformKey.currentState!.validate() &&
                              _fullnameformKey.currentState!.validate() &&
                              _passwordformKey.currentState!.validate() &&
                              _RepasswordformKey.currentState!.validate()) {
                            if (psasswordControlleer.text ==
                                RepsasswordControlleer.text) {
                              apicontroller.register(
                                  fullNameControlleer.text,
                                  phoneNumberControlleer.text,
                                  psasswordControlleer.text,
                                  context);
                            } else {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Center(
                                        child: Text("Password Does Not Match")),
                                    actions: <Widget>[
                                      Center(
                                        child: ElevatedButton(
                                          child: const Text('OK'),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              );
                            }
                          }
                        },
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            const SizedBox(
                              width: 200,
                            ),
                            const Text('Have an account ?',
                                style: TextStyle(
                                  fontFamily: 'Segoe UI',
                                  fontSize: 14.0,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                )),
                            InkWell(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        const LoginScreen()));
                              },
                              child: const Text('  Sign in',
                                  style: TextStyle(
                                    fontFamily: 'Segoe UI',
                                    fontSize: 14.0,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                  )),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      )
                    ],
                  ),
                ),
              ),
            ],
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
