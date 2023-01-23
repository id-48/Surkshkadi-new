
import 'dart:convert';

ResStoreCpDetails resStoreCpDetailsFromJson(String str) => ResStoreCpDetails.fromJson(json.decode(str));

String resStoreCpDetailsToJson(ResStoreCpDetails data) => json.encode(data.toJson());

class ResStoreCpDetails {
  ResStoreCpDetails({
    required this.status,
    required this.message,
  });

  int status;
  String message;

  factory ResStoreCpDetails.fromJson(Map<String, dynamic> json) => ResStoreCpDetails(
    status: json["status"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
  };
}
