// To parse this JSON data, do
//
//     final lunchList = lunchListFromJson(jsonString);

import 'dart:convert';

List<LunchList> lunchListFromJson(String str) =>
    List<LunchList>.from(json.decode(str).map((x) => LunchList.fromJson(x)));

String lunchListToJson(List<LunchList> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class LunchList {
  LunchList({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
  });

  int id;
  String name;
  String description;
  double price;

  factory LunchList.fromJson(Map<String, dynamic> json) => LunchList(
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
