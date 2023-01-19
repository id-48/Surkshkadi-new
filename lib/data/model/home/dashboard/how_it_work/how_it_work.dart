
import 'dart:convert';

ResHowItWork resHowItWorkFromJson(String str) => ResHowItWork.fromJson(json.decode(str));

String resHowItWorkToJson(ResHowItWork data) => json.encode(data.toJson());

class ResHowItWork {
  ResHowItWork({
    required this.status,
    required this.message,
    required this.response,
  });

  int status;
  String message;
  List<Response> response;

  factory ResHowItWork.fromJson(Map<String, dynamic> json) => ResHowItWork(
    status: json["status"],
    message: json["message"],
    response: List<Response>.from(json["response"].map((x) => Response.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "response": List<dynamic>.from(response.map((x) => x.toJson())),
  };
}

class Response {
  Response({
    required this.category,
    required this.details,
  });

  String category;
  List<Detail> details;

  factory Response.fromJson(Map<String, dynamic> json) => Response(
    category: json["category"],
    details: List<Detail>.from(json["details"].map((x) => Detail.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "category": category,
    "details": List<dynamic>.from(details.map((x) => x.toJson())),
  };
}

class Detail {
  Detail({
    required this.content,
    required this.image,
  });

  String content;
  String image;

  factory Detail.fromJson(Map<String, dynamic> json) => Detail(
    content: json["content"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "content": content,
    "image": image,
  };
}
