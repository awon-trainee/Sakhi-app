class ValidateOTP {
  final String phoneNumber;
  final String sms;


  ValidateOTP( {
    required this.phoneNumber,
    required this.sms,
  });

  factory ValidateOTP.fromJson(Map<String, dynamic> json) {
    return ValidateOTP(
      phoneNumber: json['phone'],
      sms: json['sms'],

    );
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['phone'] = phoneNumber;
    map['sms'] = sms;

    return map;
  }
}