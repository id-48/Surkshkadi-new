
import 'dart:convert';

ResState resStateFromJson(String str) => ResState.fromJson(json.decode(str));

String resStateToJson(ResState data) => json.encode(data.toJson());

class ResState {
  ResState({
    required this.status,
    required this.message,
    required this.response,
  });

  int status;
  String message;
  Response response;

  factory ResState.fromJson(Map<String, dynamic> json) => ResState(
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
    required this.states,
  });

  List<State> states;

  factory Response.fromJson(Map<String, dynamic> json) => Response(
    states: List<State>.from(json["states"].map((x) => State.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "states": List<dynamic>.from(states.map((x) => x.toJson())),
  };
}

class State {
  State({
    required this.name,
  });

  String name;

  factory State.fromJson(Map<String, dynamic> json) => State(
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
  };
}
