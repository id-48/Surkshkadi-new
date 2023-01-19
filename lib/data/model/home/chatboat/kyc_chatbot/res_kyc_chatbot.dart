
// To parse this JSON data, do
//
//     final resKycChatBot = resKycChatBotFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

ResKycChatBot resKycChatBotFromJson(String str) => ResKycChatBot.fromJson(json.decode(str));

String resKycChatBotToJson(ResKycChatBot data) => json.encode(data.toJson());

class ResKycChatBot {
  ResKycChatBot({
    required this.status,
    required this.message,
    required this.response,
  });

  int status;
  String message;
  Response response;

  factory ResKycChatBot.fromJson(Map<String, dynamic> json) => ResKycChatBot(
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
    required this.subRegisterStatus,
    required this.motherName,
    required this.maritalStatus,
    required this.spouseName,
    required this.divorceStatus,
    required this.noOfChildren,
    required this.childName,
    required this.childAge,
    required this.childGender,
    required this.minorBeneficiaryName,
    required this.minorBeneficiaryRelation,
    required this.minorBeneficiaryAddress,
  });

  String subRegisterStatus;
  String motherName;
  String maritalStatus;
  String spouseName;
  String divorceStatus;
  String noOfChildren;
  String childName;
  String childAge;
  String childGender;
  String minorBeneficiaryName;
  String minorBeneficiaryRelation;
  String minorBeneficiaryAddress;

  factory Response.fromJson(Map<String, dynamic> json) => Response(
    subRegisterStatus: json["sub_register_status"],
    motherName: json["mother_name"],
    maritalStatus: json["marital_status"],
    spouseName: json["spouse_name"],
    divorceStatus: json["divorce_status"],
    noOfChildren: json["no_of_children"],
    childName: json["child_name"],
    childAge: json["child_age"],
    childGender: json["child_gender"],
    minorBeneficiaryName: json["minor_beneficiary_name"],
    minorBeneficiaryRelation: json["minor_beneficiary_relation"],
    minorBeneficiaryAddress: json["minor_beneficiary_address"],
  );

  Map<String, dynamic> toJson() => {
    "sub_register_status": subRegisterStatus,
    "mother_name": motherName,
    "marital_status": maritalStatus,
    "spouse_name": spouseName,
    "divorce_status": divorceStatus,
    "no_of_children": noOfChildren,
    "child_name": childName,
    "child_age": childAge,
    "child_gender": childGender,
    "minor_beneficiary_name": minorBeneficiaryName,
    "minor_beneficiary_relation": minorBeneficiaryRelation,
    "minor_beneficiary_address": minorBeneficiaryAddress,
  };
}
