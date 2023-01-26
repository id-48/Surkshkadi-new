
import 'dart:convert';

ResGetRewards resGetRewardsFromJson(String str) => ResGetRewards.fromJson(json.decode(str));

String resGetRewardsToJson(ResGetRewards data) => json.encode(data.toJson());

class ResGetRewards {
  ResGetRewards({
    required this.status,
    required this.message,
    required this.response,
  });

  int status;
  String message;
  List<dynamic> response;

  factory ResGetRewards.fromJson(Map<String, dynamic> json) => ResGetRewards(
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
