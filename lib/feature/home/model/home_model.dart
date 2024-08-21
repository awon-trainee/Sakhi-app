// To parse this JSON data, do
//
//     final homeModel = homeModelFromJson(jsonString);

import 'dart:convert';

HomeModel homeModelFromJson(String str) => HomeModel.fromJson(json.decode(str));

String homeModelToJson(HomeModel data) => json.encode(data.toJson());

class HomeModel {
  dynamic message;
  bool error;
  HomeDataModel data;

  HomeModel({
    this.message,
    required this.error,
    required this.data,
  });

  factory HomeModel.fromJson(Map<String, dynamic> json) => HomeModel(
    message: json["message"],
    error: json["error"],
    data: HomeDataModel.fromJson(json["data"]),

  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "error": error,
    "data": data.toJson(),
  };
}

class HomeDataModel {
  int balance;
  String categoryName;
  int categoryId;
  List<Market> market;

  HomeDataModel({
    required this.balance,
    required this.categoryName,
    required this.categoryId,
    required this.market,
  });

  factory HomeDataModel.fromJson(Map<String, dynamic> json) => HomeDataModel(
    balance: json["balance"],
    categoryName: json["category_name"],
    categoryId: json["category_id"],
    market: List<Market>.from(json["market"].map((x) => Market.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "balance": balance,
    "category_name": categoryName,
    "category_id": categoryId,
    "market": List<dynamic>.from(market.map((x) => x.toJson())),
  };
}

class Market {
  int id;
  String name;
  String image;

  Market({
    required this.id,
    required this.name,
    required this.image,
  });

  factory Market.fromJson(Map<String, dynamic> json) => Market(
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
