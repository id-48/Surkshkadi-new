import 'package:meta/meta.dart';
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
    required this.userId,
    required this.name,
    required this.email,
    required this.mobile,
    required this.dob,
    required this.address,
    required this.gender,
    required this.wpNo,
    required this.state,
    required this.city,
    required this.postCode,
    required this.annualIncome,
    required this.occupation,
    required this.fatherName,
    required this.isFatherAlive,
    required this.nominee,
    required this.nomineeRelation,
    required this.covidDose,
    required this.nicotineProducts,
    required this.planValidity,
  });

  int subscriptionId;
  String userId;
  String name;
  String email;
  String mobile;
  DateTime dob;
  String address;
  String gender;
  String wpNo;
  String state;
  String city;
  String postCode;
  String annualIncome;
  String occupation;
  String fatherName;
  String isFatherAlive;
  String nominee;
  String nomineeRelation;
  String covidDose;
  String nicotineProducts;
  String planValidity;

  factory Response.fromJson(Map<String, dynamic> json) => Response(
    subscriptionId: json["subscription_id"],
    userId: json["user_id"],
    name: json["name"],
    email: json["email"],
    mobile: json["mobile"],
    dob: DateTime.parse(json["dob"]),
    address: json["address"],
    gender: json["gender"],
    wpNo: json["wp_no"],
    state: json["state"],
    city: json["city"],
    postCode: json["post_code"],
    annualIncome: json["annual_income"],
    occupation: json["occupation"],
    fatherName: json["father_name"],
    isFatherAlive: json["is_father_alive"],
    nominee: json["nominee"],
    nomineeRelation: json["nominee_relation"],
    covidDose: json["covid_dose"],
    nicotineProducts: json["nicotine_products"],
    planValidity: json["plan_validity"].toString(),
  );

  Map<String, dynamic> toJson() => {
    "subscription_id": subscriptionId,
    "user_id": userId,
    "name": name,
    "email": email,
    "mobile": mobile,
    "dob": "${dob.year.toString().padLeft(4, '0')}-${dob.month.toString().padLeft(2, '0')}-${dob.day.toString().padLeft(2, '0')}",
    "address": address,
    "gender": gender,
    "wp_no": wpNo,
    "state": state,
    "city": city,
    "post_code": postCode,
    "annual_income": annualIncome,
    "occupation": occupation,
    "father_name": fatherName,
    "is_father_alive": isFatherAlive,
    "nominee": nominee,
    "nominee_relation": nomineeRelation,
    "covid_dose": covidDose,
    "nicotine_products": nicotineProducts,
    "plan_validity": planValidity,
  };
}
