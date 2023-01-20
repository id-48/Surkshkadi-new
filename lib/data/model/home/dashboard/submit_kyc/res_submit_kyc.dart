
import 'dart:convert';

ResSubmitKyc resSubmitKycFromJson(String str) => ResSubmitKyc.fromJson(json.decode(str));

String resSubmitKycToJson(ResSubmitKyc data) => json.encode(data.toJson());

class ResSubmitKyc {
  ResSubmitKyc({
    required this.status,
    required this.message,
  });

  int status;
  String message;

  factory ResSubmitKyc.fromJson(Map<String, dynamic> json) => ResSubmitKyc(
    status: json["status"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
  };
}
