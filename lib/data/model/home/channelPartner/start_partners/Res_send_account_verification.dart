import 'package:meta/meta.dart';
import 'dart:convert';

ResSendAccountVerification resSendAccountVerificationFromJson(String str) => ResSendAccountVerification.fromJson(json.decode(str));

String resSendAccountVerificationToJson(ResSendAccountVerification data) => json.encode(data.toJson());

class ResSendAccountVerification {
  ResSendAccountVerification({
    required this.status,
    required this.message,
  });

  int status;
  String message;

  factory ResSendAccountVerification.fromJson(Map<String, dynamic> json) => ResSendAccountVerification(
    status: json["status"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
  };
}
