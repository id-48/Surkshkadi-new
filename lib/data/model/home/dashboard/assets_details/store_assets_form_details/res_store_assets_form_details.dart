
import 'dart:convert';

ResStoreAssetsFormDetails resStoreAssetsFormDetailsFromJson(String str) => ResStoreAssetsFormDetails.fromJson(json.decode(str));

String resStoreAssetsFormDetailsToJson(ResStoreAssetsFormDetails data) => json.encode(data.toJson());

class ResStoreAssetsFormDetails {
  ResStoreAssetsFormDetails({
    required this.status,
    required this.message,
  });

  int status;
  String message;

  factory ResStoreAssetsFormDetails.fromJson(Map<String, dynamic> json) => ResStoreAssetsFormDetails(
    status: json["status"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
  };
}
