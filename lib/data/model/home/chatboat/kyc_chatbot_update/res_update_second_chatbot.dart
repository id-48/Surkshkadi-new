
import 'dart:convert';

ResUpdateSecondChatBot resUpdateSecondChatBotFromJson(String str) => ResUpdateSecondChatBot.fromJson(json.decode(str));

String resUpdateSecondChatBotToJson(ResUpdateSecondChatBot data) => json.encode(data.toJson());

class ResUpdateSecondChatBot {
  ResUpdateSecondChatBot({
    required this.status,
    required this.message,
  });

  int status;
  String message;

  factory ResUpdateSecondChatBot.fromJson(Map<String, dynamic> json) => ResUpdateSecondChatBot(
    status: json["status"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
  };
}
