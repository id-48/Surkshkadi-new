import 'dart:convert';

ResPlanChatUpdate resPlanChatUpdateFromJson(String str) => ResPlanChatUpdate.fromJson(json.decode(str));

String resPlanChatUpdateToJson(ResPlanChatUpdate data) => json.encode(data.toJson());

class ResPlanChatUpdate {
  ResPlanChatUpdate({
    required this.status,
    required this.message,
  });

  int status;
  String message;

  factory ResPlanChatUpdate.fromJson(Map<String, dynamic> json) => ResPlanChatUpdate(
    status: json["status"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
  };
}
