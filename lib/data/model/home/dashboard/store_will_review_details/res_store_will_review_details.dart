
import 'dart:convert';

ResStoreWillReviewDetails resStoreWillReviewDetailsFromJson(String str) => ResStoreWillReviewDetails.fromJson(json.decode(str));

String resStoreWillReviewDetailsToJson(ResStoreWillReviewDetails data) => json.encode(data.toJson());

class ResStoreWillReviewDetails {
  ResStoreWillReviewDetails({
    required this.status,
    required this.message,
  });

  int status;
  String message;

  factory ResStoreWillReviewDetails.fromJson(Map<String, dynamic> json) => ResStoreWillReviewDetails(
    status: json["status"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
  };
}
