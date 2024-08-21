// To parse this JSON data, do
//
//     final profileModel = profileModelFromJson(jsonString);

import 'dart:convert';

ProfileModel profileModelFromJson(String str) =>
    ProfileModel.fromJson(json.decode(str));

String profileModelToJson(ProfileModel data) => json.encode(data.toJson());

class ProfileModel {
  dynamic message;
  bool error;
  ProfileModelData data;

  ProfileModel({
    this.message,
    required this.error,
    required this.data,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
        message: json["message"],
        error: json["error"],
        data: ProfileModelData.fromJson(jsonDecode(json["data"])),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "error": error,
        "data": data.toJson(),
      };
}

class ProfileModelData {
  String idNumber;
  String name;
  String phone;
  String? email;
  String materialStatus;
  String monthlyIncome;
  String incomeSource;

  ProfileModelData(
      {required this.idNumber,
      required this.name,
      required this.phone,
        required this.email,
      required this.materialStatus,
      required this.monthlyIncome,
      required this.incomeSource});

  factory ProfileModelData.fromJson(Map<String, dynamic> json) =>
      ProfileModelData(
          idNumber: json["id_number"],
          name: json["name"],
          phone: json["phone"],
          email: json["email"],
          materialStatus: json["material_status"],
          monthlyIncome: json["monthly_income"],
          incomeSource: json['income_source']);

  Map<String, dynamic> toJson() => {
        "id_number": idNumber,
        "name": name,
        "phone": phone,
        "email": email,
        "material_status": materialStatus,
        "monthly_income": monthlyIncome,
        'income_source': incomeSource
      };
}
