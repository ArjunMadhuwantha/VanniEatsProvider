// To parse this JSON data, do
//
//     final everningTea = everningTeaFromJson(jsonString);

import 'dart:convert';

List<EverningTea> everningTeaFromJson(String str) => List<EverningTea>.from(
    json.decode(str).map((x) => EverningTea.fromJson(x)));

String everningTeaToJson(List<EverningTea> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class EverningTea {
  EverningTea({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
  });

  int id;
  String name;
  String description;
  double price;

  factory EverningTea.fromJson(Map<String, dynamic> json) => EverningTea(
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
