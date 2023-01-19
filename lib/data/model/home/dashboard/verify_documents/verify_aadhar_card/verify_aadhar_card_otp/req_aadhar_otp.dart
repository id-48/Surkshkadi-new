import 'dart:convert';

ReqAadharOtp reqAadharOtpFromJson(String str) => ReqAadharOtp.fromJson(json.decode(str));

String reqAadharOtpToJson(ReqAadharOtp data) => json.encode(data.toJson());

class ReqAadharOtp {
  ReqAadharOtp({
    this.clientId,
    this.otp,
  });

  String? clientId;
  String? otp;

  factory ReqAadharOtp.fromJson(Map<String, dynamic> json) => ReqAadharOtp(
    clientId: json["client_id"],
    otp: json["otp"],
  );

  Map<String, dynamic> toJson() => {
    "client_id": clientId,
    "otp": otp,
  };
}
