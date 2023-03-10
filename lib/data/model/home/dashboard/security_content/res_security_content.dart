import 'package:meta/meta.dart';
import 'dart:convert';

ResSecurityContent resSecurityContentFromJson(String str) => ResSecurityContent.fromJson(json.decode(str));

String resSecurityContentToJson(ResSecurityContent data) => json.encode(data.toJson());

class ResSecurityContent {
  ResSecurityContent({
    required this.status,
    required this.message,
    required this.response,
  });

  int status;
  String message;
  Response response;

  factory ResSecurityContent.fromJson(Map<String, dynamic> json) => ResSecurityContent(
    status: json["status"],
    message: json["message"],
    response: Response.fromJson(json["response"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "response": response.toJson(),
  };
}

class Response {
  Response({
    required this.content,
  });

  String content;

  factory Response.fromJson(Map<String, dynamic> json) => Response(
    content: json["content"],
  );

  Map<String, dynamic> toJson() => {
    "content": content,
  };
}
