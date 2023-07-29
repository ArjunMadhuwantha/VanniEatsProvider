import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

import 'package:servicehub_client/Utils/constant.dart';
import 'package:servicehub_client/screen/appoinment_complete_screen.dart';
import 'package:servicehub_client/screen/foods_show_screen.dart';
import 'package:servicehub_client/screen/main_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Utils/Navigation_Function.dart';
import '../screen/login_screen.dart';

class Apicontroller {
  //user registration api
  register(
      full_name, phone_number, String password, BuildContext context) async {
    Map data = {
      'username': full_name,
      'name': phone_number,
      'email': password,
    };

    // ignore: avoid_print
    print("post data $data");

    String body = json.encode(data);
    // ignore: prefer_interpolation_to_compose_strings
    var url = Uri.parse("http://" + constant.BASE_URL.trim() + "/user");
    var response = await http.post(
      url,
      body: body,
      headers: {
        "Content-Type": "application/json",
        "accept": "application/json",
      },
    );
    // ignore: avoid_print
    print(response.body);
    print(response.statusCode);
    var jsonData = jsonDecode(response.body);

    if (response.statusCode == 200) {
      Logger().i('success custom login');

      NavigationUtillfunction.navigateTo(context, const LoginScreen());
    } else {
      Logger().e('error');

      // ignore: use_build_context_synchronously
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Center(child: Text(response.body.toString().trimLeft())),
            actions: <Widget>[
              ElevatedButton(
                child: const Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }

//user Login Api

  login(fullName, password, BuildContext context) async {
    try {
      final details = await SharedPreferences.getInstance();
      Map data = {
        'username': fullName,
        'email': password,
      };

      // ignore: avoid_print
      print("post data $data");

      String body = json.encode(data);

      var url = Uri.parse("http://" + constant.BASE_URL.trim() + "/login");
      var response = await http.post(
        url,
        body: body,
        headers: {
          "Content-Type": "application/json",
          "accept": "application/json",
        },
      );
      // ignore: avoid_print
      print(response.body);
      print(response.statusCode);

      var responseData = json.decode(response.body);
      String id, name, phonenumber;

      if (response.statusCode == 200) {
        id = responseData['id'].toString();
        name = responseData['username'].toString();
        phonenumber = responseData['name'].toString();

        //Or put here your next screen using Navigator.push() method
        // Obtain shared preferences.
        print(id + " " + name + " " + phonenumber);
        await details.setString('userId', id);
        await details.setString('userName', name);
        await details.setString('UserPhonenumber', phonenumber);
        // ignore: use_build_context_synchronously
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => const MainScreen()),
            (route) => false);

        Logger().i('success custom login');
      } else {
        Logger().e('error');
        // ignore: use_build_context_synchronously
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Center(child: Text(response.body.toString().trimLeft())),
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
    } catch (e) {
      // Handle the exception here
      Logger().e('Exception: $e');
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Center(child: const Text('Password Wrong!')),
            content: Text('                     Try Again'),
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

//order Adding
  AddOrder(userid, location, date, status, time, foodname, count, price,
      foodType, BuildContext context) async {
    try {
      Map data = {
        'userid': userid,
        'location': location,
        'date': date,
        'status': status,
        'time': time,
        'foodname': foodname,
        'count': count,
        'price': price,
        'foodType': foodType
      };

      // ignore: avoid_print
      print("post data $data");

      String body = json.encode(data);

      var url = Uri.parse("http://" + constant.BASE_URL.trim() + "/api/order");
      var response = await http.post(
        url,
        body: body,
        headers: {
          "Content-Type": "application/json",
          "accept": "application/json",
        },
      );
      // ignore: avoid_print
      print(response.body);
      print(response.statusCode);

      var responseData = json.decode(response.body);
      String id, name, phonenumber;

      if (response.statusCode == 200) {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AppoinmentCompleteScreen(),
            ));
        Logger().i('order Sucessfull Adding');
      } else {
        Logger().e('error');
        // ignore: use_build_context_synchronously
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Center(child: Text(response.body.toString().trimLeft())),
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
    } catch (e) {
      // Handle the exception here
      Logger().e('Exception: $e');
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Center(child: const Text('Order Adding Error')),
            content: Text('                     Try Again'),
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

  //create desert order
  CreateDesertOrder(
      String names, description, price, int index, BuildContext context) async {
    try {
      Map data = {
        'description': description,
        'price': price,
        'name': names,
      };

      // ignore: avoid_print
      print("post data $data");

      String body = json.encode(data);

      var url = Uri.parse("http://" + constant.BASE_URL.trim() + "/api/desert");
      var response = await http.post(
        url,
        body: body,
        headers: {
          "Content-Type": "application/json",
          "accept": "application/json",
        },
      );
      // ignore: avoid_print
      print(response.body);
      print(response.statusCode);

      var responseData = json.decode(response.body);
      String id, name, phonenumber;

      if (response.statusCode == 200) {
        Logger().i("sucess create");
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Center(child: Text("Added Sucessfully")),
              actions: <Widget>[
                ElevatedButton(
                  child: const Text('OK'),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MainScreen(),
                        ));
                  },
                ),
              ],
            );
          },
        );
      } else {
        Logger().e('error');
        // ignore: use_build_context_synchronously
      }
    } catch (e) {
      // Handle the exception here
      Logger().e('Exception: $e');
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Center(child: const Text('Item Create Failed')),
            content: Text('                     Try Again'),
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

  CreateDinertOrder(
      String names, description, price, int index, BuildContext context) async {
    try {
      Map data = {'description': description, 'price': price, 'name': names};

      // ignore: avoid_print
      print("post data $data");

      String body = json.encode(data);

      var url =
          Uri.parse("http://" + constant.BASE_URL.trim() + "/api/dinner-list");
      var response = await http.post(
        url,
        body: body,
        headers: {
          "Content-Type": "application/json",
          "accept": "application/json",
        },
      );
      // ignore: avoid_print
      print(response.body);
      print(response.statusCode);

      var responseData = json.decode(response.body);
      String id, name, phonenumber;

      if (response.statusCode == 200) {
        Logger().i("sucess create");
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Center(child: Text("Added Sucessfully")),
              actions: <Widget>[
                ElevatedButton(
                  child: const Text('OK'),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MainScreen(),
                        ));
                  },
                ),
              ],
            );
          },
        );
      } else {
        Logger().e('error');
        // ignore: use_build_context_synchronously
      }
    } catch (e) {
      // Handle the exception here
      Logger().e('Exception: $e');
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Center(child: const Text('Item Create Failed')),
            content: Text('                     Try Again'),
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

  CreateEveningOrder(
      String names, description, price, int index, BuildContext context) async {
    try {
      Map data = {'description': description, 'price': price, 'name': names};

      // ignore: avoid_print
      print("post data $data");

      String body = json.encode(data);

      var url =
          Uri.parse("http://" + constant.BASE_URL.trim() + "/api/evening");
      var response = await http.post(
        url,
        body: body,
        headers: {
          "Content-Type": "application/json",
          "accept": "application/json",
        },
      );
      // ignore: avoid_print
      print(response.body);
      print(response.statusCode);

      var responseData = json.decode(response.body);
      String id, name, phonenumber;

      if (response.statusCode == 200) {
        Logger().i("sucess create");

        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Center(child: Text("Added Sucessfully")),
              actions: <Widget>[
                ElevatedButton(
                  child: const Text('OK'),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MainScreen(),
                        ));
                  },
                ),
              ],
            );
          },
        );
      } else {
        Logger().e('error');
        // ignore: use_build_context_synchronously
      }
    } catch (e) {
      // Handle the exception here
      Logger().e('Exception: $e');
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Center(child: const Text('Item Create Failed')),
            content: Text('                     Try Again'),
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

  CreateMorningtOrder(
      String names, description, price, int index, BuildContext context) async {
    try {
      Map data = {
        'description': description,
        'price': price,
        'name': names,
      };

      // ignore: avoid_print
      print("post data $data");

      String body = json.encode(data);

      var url =
          Uri.parse("http://" + constant.BASE_URL.trim() + "/api/morning");
      var response = await http.post(
        url,
        body: body,
        headers: {
          "Content-Type": "application/json",
          "accept": "application/json",
        },
      );
      // ignore: avoid_print
      print(response.body);
      print(response.statusCode);

      var responseData = json.decode(response.body);
      String id, name, phonenumber;

      if (response.statusCode == 200) {
        Logger().i("sucess create");
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Center(child: Text("Added Sucessfully")),
              actions: <Widget>[
                ElevatedButton(
                  child: const Text('OK'),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MainScreen(),
                        ));
                  },
                ),
              ],
            );
          },
        );
      } else {
        Logger().e('error');
        // ignore: use_build_context_synchronously
      }
    } catch (e) {
      // Handle the exception here
      Logger().e('Exception: $e');
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Center(child: const Text('Item Create Failed')),
            content: Text('                     Try Again'),
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

  CreateDinnertOrder(
      String names, description, price, int index, BuildContext context) async {
    try {
      Map data = {
        'description': description,
        'price': price,
        'name': names,
      };

      // ignore: avoid_print
      print("post data $data");

      String body = json.encode(data);

      var url =
          Uri.parse("http://" + constant.BASE_URL.trim() + "/api/morning");
      var response = await http.post(
        url,
        body: body,
        headers: {
          "Content-Type": "application/json",
          "accept": "application/json",
        },
      );
      // ignore: avoid_print
      print(response.body);
      print(response.statusCode);

      var responseData = json.decode(response.body);
      String id, name, phonenumber;

      if (response.statusCode == 200) {
        Logger().i("sucess create");
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Center(child: Text("Added Sucessfully")),
              actions: <Widget>[
                ElevatedButton(
                  child: const Text('OK'),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MainScreen(),
                        ));
                  },
                ),
              ],
            );
          },
        );
      } else {
        Logger().e('error');
        // ignore: use_build_context_synchronously
      }
    } catch (e) {
      // Handle the exception here
      Logger().e('Exception: $e');
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Center(child: const Text('Item Create Failed')),
            content: Text('                     Try Again'),
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

  CreateLunchtOrder(
      String names, description, price, int index, BuildContext context) async {
    try {
      Map data = {
        'description': description,
        'price': price,
        'name': names,
      };

      // ignore: avoid_print
      print("post data $data");

      String body = json.encode(data);

      var url =
          Uri.parse("http://" + constant.BASE_URL.trim() + "/lunch/create");
      var response = await http.post(
        url,
        body: body,
        headers: {
          "Content-Type": "application/json",
          "accept": "application/json",
        },
      );
      // ignore: avoid_print
      print(response.body);
      print(response.statusCode);

      var responseData = json.decode(response.body);
      String id, name, phonenumber;

      if (response.statusCode == 200) {
        Logger().i("sucess create");

        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Center(child: Text("Added Sucessfully")),
              actions: <Widget>[
                ElevatedButton(
                  child: const Text('OK'),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MainScreen(),
                        ));
                  },
                ),
              ],
            );
          },
        );
      } else {
        Logger().e('error');
        // ignore: use_build_context_synchronously
      }
    } catch (e) {
      // Handle the exception here
      Logger().e('Exception: $e');
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Center(child: const Text('Item Create Failed')),
            content: Text('                     Try Again'),
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

  CreateBreakfasttOrder(
      String names, description, price, int index, BuildContext context) async {
    try {
      Map data = {
        'description': description,
        'price': price,
        'name': names,
      };

      // ignore: avoid_print
      print("post data $data");

      String body = json.encode(data);

      var url =
          Uri.parse("http://" + constant.BASE_URL.trim() + "/api/breakfasts");
      var response = await http.post(
        url,
        body: body,
        headers: {
          "Content-Type": "application/json",
          "accept": "application/json",
        },
      );
      // ignore: avoid_print
      print(response.body);
      print(response.statusCode);

      var responseData = json.decode(response.body);
      String id, name, phonenumber;

      if (response.statusCode == 200) {
        Logger().i("sucess create");
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Center(child: Text("Added Sucessfully")),
              actions: <Widget>[
                ElevatedButton(
                  child: const Text('OK'),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MainScreen(),
                        ));
                  },
                ),
              ],
            );
          },
        );
      } else {
        Logger().e('error');
        // ignore: use_build_context_synchronously
      }
    } catch (e) {
      // Handle the exception here
      Logger().e('Exception: $e');
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Center(child: const Text('Item Create Failed')),
            content: Text('                     Try Again'),
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

  UpdateOrder(String myid, foodname, status, date, time, location, foodType,
      price, count, BuildContext context) async {
    try {
      Map data = {
        "foodname": foodname,
        "status": status,
        "date": date,
        "time": time,
        "location": location,
        "count": count,
        "foodType": foodType,
        "price": price
      };

      // ignore: avoid_print
      print("post data $data");

      String body = json.encode(data);

      var url = Uri.parse("http://" +
          constant.BASE_URL.trim() +
          "/api/order/" +
          myid.toString());
      var response = await http.put(
        url,
        body: body,
        headers: {
          "Content-Type": "application/json",
          "accept": "application/json",
        },
      );
      // ignore: avoid_print
      print(response.body);
      print(response.statusCode);

      var responseData = json.decode(response.body);
      String id, name, phonenumber;

      if (response.statusCode == 200) {
        Logger().i("sucess update");
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => MainScreen()));
      } else {
        Logger().e('error');
        // ignore: use_build_context_synchronously
      }
    } catch (e) {
      // Handle the exception here
      Logger().e('Exception: $e');
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Center(child: const Text('Upadte Failed')),
            content: Text('                     Try Again'),
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
}
