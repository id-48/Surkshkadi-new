
import 'dart:convert';

ResVerifyOtp resVerifyOtpFromJson(String str) => ResVerifyOtp.fromJson(json.decode(str));

String resVerifyOtpToJson(ResVerifyOtp data) => json.encode(data.toJson());

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
    required this.referCode,
    required this.registrationType,
    required this.walletAmount,
    required this.accountStatus,
    required this.userId,
    required this.name,
    required this.email,
    required this.mobile,
    required this.registeredOn,
  });

  String referCode;
  String registrationType;
  dynamic walletAmount;
  String accountStatus;
  String userId;
  String name;
  String email;
  String mobile;
  DateTime registeredOn;

  factory Response.fromJson(Map<String, dynamic> json) => Response(
    referCode: json["refer_code"],
    registrationType: json["registration_type"],
    walletAmount: json["wallet_amount"],
    accountStatus: json["account_status"],
    userId: json["user_id"],
    name: json["name"],
    email: json["email"],
    mobile: json["mobile"],
    registeredOn: DateTime.parse(json["registered_on"]),
  );

  Map<String, dynamic> toJson() => {
    "refer_code": referCode,
    "registration_type": registrationType,
    "wallet_amount": walletAmount,
    "account_status": accountStatus,
    "user_id": userId,
    "name": name,
    "email": email,
    "mobile": mobile,
    "registered_on": registeredOn.toIso8601String(),
  };
}
