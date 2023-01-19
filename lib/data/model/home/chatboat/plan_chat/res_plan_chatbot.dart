
import 'dart:convert';

ResPlanChatBot resPlanChatBotFromJson(String str) => ResPlanChatBot.fromJson(json.decode(str));

String resPlanChatBotToJson(ResPlanChatBot data) => json.encode(data.toJson());

class ResPlanChatBot {
  ResPlanChatBot({
    required this.status,
    required this.message,
    required this.response,
  });

  int status;
  String message;
  Response response;

  factory ResPlanChatBot.fromJson(Map<String, dynamic> json) => ResPlanChatBot(
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
    required this.subscriptionId,
  });

  int subscriptionId;

  factory Response.fromJson(Map<String, dynamic> json) => Response(
    subscriptionId: json["subscription_id"],
  );

  Map<String, dynamic> toJson() => {
    "subscription_id": subscriptionId,
  };
}


