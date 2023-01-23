

import 'dart:convert';

ResVerifyOtp? resVerifyOtpFromJson(String str) => ResVerifyOtp.fromJson(json.decode(str));

String resVerifyOtpToJson(ResVerifyOtp? data) => json.encode(data!.toJson());

class ResVerifyOtp {
  ResVerifyOtp({
    required this.status,
    required this.message,
    required this.response,
  });

  int status;
  String message;
  Response response;

  factory ResVerifyOtp.fromJson(Map<String, dynamic> json) => ResVerifyOtp(
    status: json["status"],
    message: json["message"],
    response: Response.fromJson(json["response"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "response": response.toJson(),
  };
}

class Response {
  Response({
    required this.userId,
    required this.name,
    required this.email,
    required this.mobile,
    required this.registeredOn,
  });

  String userId;
  String name;
  String email;
  String mobile;
  DateTime registeredOn;

  factory Response.fromJson(Map<String, dynamic> json) => Response(
    userId: json["user_id"],
    name: json["name"],
    email: json["email"],
    mobile: json["mobile"],
    registeredOn: DateTime.parse(json["registered_on"]),
  );

  Map<String, dynamic> toJson() => {
    "user_id": userId,
    "name": name,
    "email": email,
    "mobile": mobile,
    "registered_on": registeredOn.toIso8601String(),
  };
}




