


import 'dart:convert';

ResWillDocument resWillDocumentFromJson(String str) => ResWillDocument.fromJson(json.decode(str));

String resWillDocumentToJson(ResWillDocument data) => json.encode(data.toJson());

class ResWillDocument {
  ResWillDocument({
    required this.status,
    required this.message,
  });

  int status;
  String message;

  factory ResWillDocument.fromJson(Map<String, dynamic> json) => ResWillDocument(
    status: json["status"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
  };
}
