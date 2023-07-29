// To parse this JSON data, do
//
//     final orderList = orderListFromJson(jsonString);

import 'dart:convert';

List<OrderList> orderListFromJson(String str) =>
    List<OrderList>.from(json.decode(str).map((x) => OrderList.fromJson(x)));

String orderListToJson(List<OrderList> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class OrderList {
  OrderList({
    required this.id,
    required this.userid,
    required this.foodname,
    required this.date,
    required this.time,
    required this.location,
    required this.count,
    required this.price,
    required this.foodType,
    required this.status,
  });

  int id;
  int userid;
  String foodname;
  DateTime date;
  String time;
  String location;
  String count;
  double price;
  String foodType;
  String status;

  factory OrderList.fromJson(Map<String, dynamic> json) => OrderList(
        id: json["id"],
        userid: json["userid"],
        foodname: json["foodname"] ?? "",
        date: DateTime.parse(json["date"] ?? ""),
        time: json["time"],
        location: json["location"],
        count: json["count"],
        price: json["price"],
        foodType: json["foodType"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "userid": userid,
        "foodname": foodname,
        "date":
            "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
        "time": time,
        "location": location,
        "count": count,
        "price": price,
        "foodType": foodType,
        "status": status,
      };
}
