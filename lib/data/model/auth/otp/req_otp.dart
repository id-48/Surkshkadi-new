import 'dart:convert';

ReqOtp reqOtpFromJson(String str) => ReqOtp.fromJson(json.decode(str));

String reqOtpToJson(ReqOtp data) => json.encode(data.toJson());

class ReqOtp {
  ReqOtp({
    required this.mobileNo,
    required this.userType,
  });

  String mobileNo;
  String userType;

  factory ReqOtp.fromJson(Map<String, dynamic> json) => ReqOtp(
    mobileNo: json["mobile"],
    userType: json["user_type"],
  );

  Map<String, dynamic> toJson() => {
    "mobile": mobileNo,
    "user_type": userType,
  };
}
