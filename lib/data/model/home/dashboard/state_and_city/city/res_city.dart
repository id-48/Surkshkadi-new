
import 'dart:convert';

ResCity reqCityFromJson(String str) => ResCity.fromJson(json.decode(str));

String reqCityToJson(ResCity data) => json.encode(data.toJson());

class ResCity {
  ResCity({
    required this.status,
    required this.message,
    required this.response,
  });

  int status;
  String message;
  Response response;

  factory ResCity.fromJson(Map<String, dynamic> json) => ResCity(
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
    required this.cities,
  });

  List<City> cities;

  factory Response.fromJson(Map<String, dynamic> json) => Response(
    cities: List<City>.from(json["cities"].map((x) => City.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "cities": List<dynamic>.from(cities.map((x) => x.toJson())),
  };
}

class City {
  City({
    required this.name,
  });

  String name;

  factory City.fromJson(Map<String, dynamic> json) => City(
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
  };
}
