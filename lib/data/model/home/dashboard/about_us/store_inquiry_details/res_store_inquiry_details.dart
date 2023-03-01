import 'package:meta/meta.dart';
import 'dart:convert';

ResStoreInquiryDetails resStoreInquiryDetailsFromJson(String str) => ResStoreInquiryDetails.fromJson(json.decode(str));

String resStoreInquiryDetailsToJson(ResStoreInquiryDetails data) => json.encode(data.toJson());

class ResStoreInquiryDetails {
  ResStoreInquiryDetails({
    required this.status,
    required this.message,
  });

  int status;
  String message;

  factory ResStoreInquiryDetails.fromJson(Map<String, dynamic> json) => ResStoreInquiryDetails(
    status: json["status"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
  };
}
