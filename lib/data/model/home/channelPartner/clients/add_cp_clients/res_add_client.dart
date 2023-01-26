import 'dart:convert';

ResAddClient resAddClientFromJson(String str) => ResAddClient.fromJson(json.decode(str));

String resAddClientToJson(ResAddClient data) => json.encode(data.toJson());

class ResAddClient {
  ResAddClient({
    required this.status,
    required this.message,
  });

  int status;
  String message;

  factory ResAddClient.fromJson(Map<String, dynamic> json) => ResAddClient(
    status: json["status"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
  };
}
