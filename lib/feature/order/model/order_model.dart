// To parse this JSON data, do
//
//     final ordersModel = ordersModelFromJson(jsonString);

import 'dart:convert';

OrdersModel ordersModelFromJson(String str) => OrdersModel.fromJson(json.decode(str));

String ordersModelToJson(OrdersModel data) => json.encode(data.toJson());

class OrdersModel {
  dynamic message;
  bool error;
  List<OrderModelList> data;

  OrdersModel({
    this.message,
    required this.error,
    required this.data,
  });

  factory OrdersModel.fromJson(Map<String, dynamic> json) => OrdersModel(
    message: json["message"],
    error: json["error"],
    data: List<OrderModelList>.from(json["data"].map((x) => OrderModelList.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "error": error,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class OrderModelList {
  String id;
  String code;
  dynamic image;
  String status;
  int amount;
  String marketName;
  DateTime createdAt;

  OrderModelList({
    required this.id,
    required this.code,
    this.image,
    required this.status,
    required this.amount,
    required this.marketName,
    required this.createdAt,
  });

  factory OrderModelList.fromJson(Map<String, dynamic> json) => OrderModelList(
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
