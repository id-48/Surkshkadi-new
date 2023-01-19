
import 'dart:convert';

ResPancardNo resPancardNoFromJson(String str) => ResPancardNo.fromJson(json.decode(str));

String resPancardNoToJson(ResPancardNo data) => json.encode(data.toJson());

class ResPancardNo {
  ResPancardNo({
    required this.result,
  });

  ResPancardNoResult result;

  factory ResPancardNo.fromJson(Map<String, dynamic> json) => ResPancardNo(
    result: ResPancardNoResult.fromJson(json["result"]),
  );

  Map<String, dynamic> toJson() => {
    "result": result.toJson(),
  };
}

class ResPancardNoResult {
  ResPancardNoResult({
    required this.essentials,
    required this.id,
    required this.patronId,
    required this.task,
    required this.result,
  });

  Essentials essentials;
  String id;
  String patronId;
  String task;
  ResultResult result;

  factory ResPancardNoResult.fromJson(Map<String, dynamic> json) => ResPancardNoResult(
    essentials: Essentials.fromJson(json["essentials"]),
    id: json["id"],
    patronId: json["patronId"],
    task: json["task"],
    result: ResultResult.fromJson(json["result"]),
  );

  Map<String, dynamic> toJson() => {
    "essentials": essentials.toJson(),
    "id": id,
    "patronId": patronId,
    "task": task,
    "result": result.toJson(),
  };
}

class Essentials {
  Essentials({
    required this.number,
  });

  String number;

  factory Essentials.fromJson(Map<String, dynamic> json) => Essentials(
    number: json["number"],
  );

  Map<String, dynamic> toJson() => {
    "number": number,
  };
}

class ResultResult {
  ResultResult({
    required this.name,
    required this.number,
    required this.typeOfHolder,
    required this.isIndividual,
    required this.isValid,
    required this.firstName,
    required this.middleName,
    required this.lastName,
    required this.title,
    required this.panStatus,
    required this.panStatusCode,
    required this.aadhaarSeedingStatus,
    required this.aadhaarSeedingStatusCode,
    required this.lastUpdatedOn,
  });

  String name;
  String number;
  String typeOfHolder;
  bool isIndividual;
  bool isValid;
  String firstName;
  String middleName;
  String lastName;
  String title;
  String panStatus;
  String panStatusCode;
  String aadhaarSeedingStatus;
  String aadhaarSeedingStatusCode;
  String lastUpdatedOn;

  factory ResultResult.fromJson(Map<String, dynamic> json) => ResultResult(
    name: json["name"],
    number: json["number"],
    typeOfHolder: json["typeOfHolder"],
    isIndividual: json["isIndividual"],
    isValid: json["isValid"],
    firstName: json["firstName"],
    middleName: json["middleName"],
    lastName: json["lastName"],
    title: json["title"],
    panStatus: json["panStatus"],
    panStatusCode: json["panStatusCode"],
    aadhaarSeedingStatus: json["aadhaarSeedingStatus"],
    aadhaarSeedingStatusCode: json["aadhaarSeedingStatusCode"],
    lastUpdatedOn: json["lastUpdatedOn"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "number": number,
    "typeOfHolder": typeOfHolder,
    "isIndividual": isIndividual,
    "isValid": isValid,
    "firstName": firstName,
    "middleName": middleName,
    "lastName": lastName,
    "title": title,
    "panStatus": panStatus,
    "panStatusCode": panStatusCode,
    "aadhaarSeedingStatus": aadhaarSeedingStatus,
    "aadhaarSeedingStatusCode": aadhaarSeedingStatusCode,
    "lastUpdatedOn": lastUpdatedOn,
  };
}
