import 'package:meta/meta.dart';
import 'dart:convert';

ResShareApplicationLinks resShareApplicationLinksFromJson(String str) => ResShareApplicationLinks.fromJson(json.decode(str));

String resShareApplicationLinksToJson(ResShareApplicationLinks data) => json.encode(data.toJson());

class ResShareApplicationLinks {
  ResShareApplicationLinks({
    required this.status,
    required this.message,
  });

  int status;
  String message;

  factory ResShareApplicationLinks.fromJson(Map<String, dynamic> json) => ResShareApplicationLinks(
    status: json["status"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
  };
}
