import 'dart:convert';

List<MorningTea> morningTeaFromJson(String str) =>
    List<MorningTea>.from(json.decode(str).map((x) => MorningTea.fromJson(x)));

String morningTeaToJson(List<MorningTea> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MorningTea {
  MorningTea({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
  });

  int id;
  String name;
  String description;
  double price;

  factory MorningTea.fromJson(Map<String, dynamic> json) => MorningTea(
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
