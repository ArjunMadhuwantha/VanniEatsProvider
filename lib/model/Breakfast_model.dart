// To parse this JSON data, do
//
//     final breakfastList = breakfastListFromJson(jsonString);

import 'dart:convert';

List<BreakfastList> breakfastListFromJson(String str) =>
    List<BreakfastList>.from(
        json.decode(str).map((x) => BreakfastList.fromJson(x)));

String breakfastListToJson(List<BreakfastList> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class BreakfastList {
  BreakfastList({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
  });

  int id;
  String name;
  String description;
  double price;

  factory BreakfastList.fromJson(Map<String, dynamic> json) => BreakfastList(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        price: json["price"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "price": price,
      };
}
