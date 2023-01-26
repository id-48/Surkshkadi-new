// To parse this JSON data, do
//
//     final resGetSubscribedClient = resGetSubscribedClientFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

ResGetSubscribedClient resGetSubscribedClientFromJson(String str) => ResGetSubscribedClient.fromJson(json.decode(str));

String resGetSubscribedClientToJson(ResGetSubscribedClient data) => json.encode(data.toJson());

class ResGetSubscribedClient {
  ResGetSubscribedClient({
    required this.status,
    required this.message,
    required this.response,
  });

  int status;
  String message;
  List<dynamic> response;

  factory ResGetSubscribedClient.fromJson(Map<String, dynamic> json) => ResGetSubscribedClient(
    status: json["status"],
    message: json["message"],
    response: List<dynamic>.from(json["response"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "response": List<dynamic>.from(response.map((x) => x)),
  };
}
