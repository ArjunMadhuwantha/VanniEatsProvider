// To parse this JSON data, do
//
//     final dinnerList = dinnerListFromJson(jsonString);

import 'dart:convert';

List<DinnerList> dinnerListFromJson(String str) =>
    List<DinnerList>.from(json.decode(str).map((x) => DinnerList.fromJson(x)));

String dinnerListToJson(List<DinnerList> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DinnerList {
  DinnerList({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
  });

  int id;
  String name;
  String description;
  double price;

  factory DinnerList.fromJson(Map<String, dynamic> json) => DinnerList(
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
