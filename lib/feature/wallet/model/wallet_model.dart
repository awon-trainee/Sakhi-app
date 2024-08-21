// To parse this JSON data, do
//
//     final walletModel = walletModelFromJson(jsonString);

import 'dart:convert';

WalletModel walletModelFromJson(String str) => WalletModel.fromJson(json.decode(str));

String walletModelToJson(WalletModel data) => json.encode(data.toJson());

class WalletModel {
  dynamic message;
  bool error;
  Data data;

  WalletModel({
    this.message,
    required this.error,
    required this.data,
  });

  factory WalletModel.fromJson(Map<String, dynamic> json) => WalletModel(
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
  String category;
  int balance;
  List<LastOperation> lastOperation;

  Data({
    required this.category,
    required this.balance,
    required this.lastOperation,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    category: json["category"],
    balance: json["balance"],
    lastOperation: List<LastOperation>.from(json["last_operation"].map((x) => LastOperation.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "category": category,
    "balance": balance,
    "last_operation": List<dynamic>.from(lastOperation.map((x) => x.toJson())),
  };
}

class LastOperation {
  String? market;
  String? charity;
  bool today;
  String day;
  String time;
  DateTime date;
  String operation;
  dynamic amount;

  LastOperation({
    this.market,
    this.charity,
    required this.today,
    required this.day,
    required this.time,
    required this.date,
    required this.operation,
    required this.amount,
  });

  factory LastOperation.fromJson(Map<String, dynamic> json) => LastOperation(
    market: json["market"],
    charity: json["charity"],
    today: json["today"],
    day: json["day"],
    time: json["time"],
    date: DateTime.parse(json["date"]),
    operation: json["operation"],
    amount: json["amount"],
  );

  Map<String, dynamic> toJson() => {
    "market": market,
    "charity": charity,
    "today": today,
    "day": day,
    "time": time,
    "date": "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
    "operation": operation,
    "amount": amount,
  };
}
