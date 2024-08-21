// To parse this JSON data, do
//
//     final marketDetailsModel = marketDetailsModelFromJson(jsonString);

import 'dart:convert';

MarketDetailsModel marketDetailsModelFromJson(String str) => MarketDetailsModel.fromJson(json.decode(str));

String marketDetailsModelToJson(MarketDetailsModel data) => json.encode(data.toJson());

class MarketDetailsModel {
  dynamic message;
  bool error;
  List<Datum> data;

  MarketDetailsModel({
    this.message,
    required this.error,
    required this.data,
  });

  factory MarketDetailsModel.fromJson(Map<String, dynamic> json) => MarketDetailsModel(
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
  int itemId;
  String name;
  String description;
  String amount;
  int price;

  Datum({
    required this.itemId,
    required this.name,
    required this.description,
    required this.amount,
    required this.price,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    itemId: json["item_id"],
    name: json["name"],
    description: json["description"],
    amount: json["amount"],
    price: json["price"],
  );

  Map<String, dynamic> toJson() => {
    "item_id": itemId,
    "name": name,
    "description": description,
    "amount": amount,
    "price": price,
  };
}
