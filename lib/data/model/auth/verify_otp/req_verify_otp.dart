import 'dart:convert';

ReqVerifyOtp ReqVerifyOtpFromJson(String str) => ReqVerifyOtp.fromJson(json.decode(str));

String ReqVerifyOtpToJson(ReqVerifyOtp data) => json.encode(data.toJson());

class ReqVerifyOtp {
  ReqVerifyOtp({
    required this.userId,
    required this.otp,
    required this.userType,

  });

  String userId;
  String otp;
  String userType;


  factory ReqVerifyOtp.fromJson(Map<String, dynamic> json) => ReqVerifyOtp(
    userId: json["user_id"],
    otp: json["otp"].toString(),
    userType: json["user_type"],

  );

  Map<String, dynamic> toJson() => {
    "user_id": userId,
    "otp": otp,
    "user_type": userType,

  };
}
