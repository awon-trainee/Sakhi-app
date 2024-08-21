// To parse this JSON data, do
//
//     final marketModel = marketModelFromJson(jsonString);

import 'dart:convert';

MarketModel marketModelFromJson(String str) => MarketModel.fromJson(json.decode(str));

String marketModelToJson(MarketModel data) => json.encode(data.toJson());

class MarketModel {
  dynamic message;
  bool error;
  List<Datum> data;

  MarketModel({
    this.message,
    required this.error,
    required this.data,
  });

  factory MarketModel.fromJson(Map<String, dynamic> json) => MarketModel(
    message: json["message"],
    error: json["error"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "error": error,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  int id;
  String name;
  String image;

  Datum({
    required this.id,
    required this.name,
    required this.image,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    name: json["name"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "image": image,
  };
}
