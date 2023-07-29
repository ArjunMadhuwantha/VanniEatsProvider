// To parse this JSON data, do
//
//     final desertList = desertListFromJson(jsonString);

import 'dart:convert';

List<DesertList> desertListFromJson(String str) =>
    List<DesertList>.from(json.decode(str).map((x) => DesertList.fromJson(x)));

String desertListToJson(List<DesertList> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DesertList {
  DesertList({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
  });

  int id;
  String name;
  String description;
  double price;

  factory DesertList.fromJson(Map<String, dynamic> json) => DesertList(
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
