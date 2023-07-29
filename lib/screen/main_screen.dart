import 'package:flutter/material.dart';
import 'package:servicehub_client/Colors.dart';

import 'package:servicehub_client/screen/contact_screen.dart';

import 'package:servicehub_client/screen/home_screen.dart';
import 'package:servicehub_client/screen/login_screen.dart';
import 'package:servicehub_client/screen/profile_screen.dart';

import 'package:servicehub_client/widget/app_name_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'all_orders_show_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int index = 0;
  List<Widget> list = [
    const HomeScreen(),
    const AllOrderFoodScreen(),
    const ProfileScreen(),
    const LoginScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        centerTitle: true,
        title: index == 0
            ? const Text('Vanni Eats',
                style: TextStyle(
                  fontFamily: 'Segoe UI',
                  fontSize: 25.0,
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ))
            : const Text(""),
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: darkText,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/fonts/bgimage.png"),
              fit: BoxFit.fill,
            ),
          ),
        ),
      ),
      body: list[index],
      drawer: MyDrawer(onTap: (lol, i) {}),
    );
  }
}

class MyDrawer extends StatefulWidget {
  final Function onTap;

  const MyDrawer({super.key, required this.onTap});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  String name = "";

  getcustomerdata() async {
    final details = await SharedPreferences.getInstance();

    setState(() {
      name = details.getString('userName').toString();
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getcustomerdata();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(30),
                topRight: Radius.circular(30))),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(20),
                bottomRight: Radius.circular(20)),
            color: Colors.white,
          ),
          margin: const EdgeInsets.only(left: 35, top: 20),
          child: ListView(
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const AppNameWidget(),
                  const SizedBox(
                    height: 18,
                  ),
                  const Text(
                    "Hey",
                    style: TextStyle(
                      fontFamily: 'Segoe UI',
                      fontSize: 20,
                      color: darkText,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Admin",
                    style: const TextStyle(
                        fontFamily: 'Segoe UI',
                        fontSize: 25,
                        color: darkText,
                        fontWeight: FontWeight.w700),
                  ),
                ],
              ),
              const SizedBox(
                height: 45,
              ),
              ListTile(
                leading: const Icon(Icons.home, color: KOrange),
                contentPadding: EdgeInsets.zero,
                minLeadingWidth: 5,
                title: const Text(
                  "Home",
                  style: TextStyle(
                      fontFamily: 'Segoe UI',
                      fontSize: 22,
                      color: darkText,
                      fontWeight: FontWeight.w600),
                ),
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const MainScreen(),
                    )),
              ),
              ListTile(
                leading: const Icon(Icons.list, color: KOrange),
                contentPadding: EdgeInsets.zero,
                minLeadingWidth: 5,
                title: const Text(
                  "My Orders",
                  style: TextStyle(
                      fontFamily: 'Segoe UI',
                      fontSize: 22,
                      color: darkText,
                      fontWeight: FontWeight.w600),
                ),
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AllOrderFoodScreen(),
                    )),
              ),
              ListTile(
                leading: const Icon(Icons.person, color: KOrange),
                contentPadding: EdgeInsets.zero,
                minLeadingWidth: 5,
                title: const Text(
                  "My Profile",
                  style: TextStyle(
                      fontFamily: 'Segoe UI',
                      fontSize: 22,
                      color: darkText,
                      fontWeight: FontWeight.w600),
                ),
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ProfileScreen(),
                    )),
              ),
              ListTile(
                  leading: const Icon(Icons.logout, color: KOrange),
                  contentPadding: EdgeInsets.zero,
                  minLeadingWidth: 5,
                  title: const Text(
                    "Logout",
                    style: TextStyle(
                        fontFamily: 'Segoe UI',
                        fontSize: 22,
                        color: darkText,
                        fontWeight: FontWeight.w600),
                  ),
                  onTap: () async {
                    final details = await SharedPreferences.getInstance();
                    details.clear();
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                            builder: (context) => const LoginScreen()),
                        (route) => false);
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
