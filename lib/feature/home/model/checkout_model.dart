// To parse this JSON data, do
//
//     final checkoutModel = checkoutModelFromJson(jsonString);

import 'dart:convert';

CheckoutModel checkoutModelFromJson(String str) => CheckoutModel.fromJson(json.decode(str));

String checkoutModelToJson(CheckoutModel data) => json.encode(data.toJson());

class CheckoutModel {
  String message;
  bool error;
  Data data;

  CheckoutModel({
    required this.message,
    required this.error,
    required this.data,
  });

  factory CheckoutModel.fromJson(Map<String, dynamic> json) => CheckoutModel(
    message: json["message"],
    error: json["error"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "error": error,
    "data": data.toJson(),
  };
}

class Data {
  int id;
  String code;
  String image;
  String status;
  int amount;
  String marketName;
  DateTime createdAt;

  Data({
    required this.id,
    required this.code,
    required this.image,
    required this.status,
    required this.amount,
    required this.marketName,
    required this.createdAt,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    code: json["code"],
    image: json["image"],
    status: json["status"],
    amount: json["amount"],
    marketName: json["market_name"],
    createdAt: DateTime.parse(json["created_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "code": code,
    "image": image,
    "status": status,
    "amount": amount,
    "market_name": marketName,
    "created_at": createdAt.toIso8601String(),
  };
}
