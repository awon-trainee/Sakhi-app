class SignInUser {
  final String phoneNumber;


  SignInUser( {
    required this.phoneNumber,
  });

  factory SignInUser.fromJson(Map<String, dynamic> json) {
    return SignInUser(
      phoneNumber: json['phone'],

    );
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['phone'] = phoneNumber;

    return map;
  }
}