import 'dart:convert';

ResGetClient resGetClientFromJson(String str) => ResGetClient.fromJson(json.decode(str));

String resGetClientToJson(ResGetClient data) => json.encode(data.toJson());

class ResGetClient {
  ResGetClient({
    required this.status,
    required this.message,
    required this.response,
  });

  int status;
  String message;
  List<Response> response;

  factory ResGetClient.fromJson(Map<String, dynamic> json) => ResGetClient(
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
    required this.clientId,
    required this.clientType,
    required this.companyName,
    required this.name,
    required this.email,
    required this.mobile,
    required this.status,
    required this.registeredOn,
  });

  String clientId;
  String clientType;
  String companyName;
  String name;
  String email;
  String mobile;
  String status;
  String registeredOn;

  factory Response.fromJson(Map<String, dynamic> json) => Response(
    clientId: json["client_id"],
    clientType: json["client_type"],
    companyName: json["company_name"],
    name: json["name"],
    email: json["email"],
    mobile: json["mobile"],
    status: json["status"],
    registeredOn: json["registered_on"],
  );

  Map<String, dynamic> toJson() => {
    "client_id": clientId,
    "client_type": clientType,
    "company_name": companyName,
    "name": name,
    "email": email,
    "mobile": mobile,
    "status": status,
    "registered_on": registeredOn,
  };
}
