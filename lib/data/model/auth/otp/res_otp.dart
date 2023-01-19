// // To parse this JSON data, do
// //
// //     final resOtp = resOtpFromJson(jsonString);
//
// import 'dart:convert';
//
// ResOtp resOtpFromJson(String str) => ResOtp.fromJson(json.decode(str));
//
// String resOtpToJson(ResOtp data) => json.encode(data.toJson());
//
// class ResOtp {
//   ResOtp({
//     required this.status,
//     required this.message,
//     required this.response,
//   });
//
//   String status;
//   String message;
//   Response response;
//
//   factory ResOtp.fromJson(Map<String, dynamic> json) => ResOtp(
//     status: json["status"].toString(),
//     message: json["message"].toString(),
//     response: Response.fromJson(json["response"]),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "status": status,
//     "message": message,
//     "response": response.toJson(),
//   };
// }
//
// class Response {
//   Response({
//     required this.userId,
//     required this.otp,
//   });
//
//   String userId;
//   String otp;
//
//   factory Response.fromJson(Map<String, dynamic> json) => Response(
//     userId: json["user_id"].toString(),
//     otp: json["otp"].toString(),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "user_id": userId,
//     "otp": otp,
//   };
// }


import 'dart:convert';

ResOtp? resOtpFromJson(String str) => ResOtp.fromJson(json.decode(str));

String resOtpToJson(ResOtp? data) => json.encode(data!.toJson());

class ResOtp {
  ResOtp({
    required this.status,
    required this.message,
    required this.response,
  });

  int? status;
  String? message;
  Response? response;

  factory ResOtp.fromJson(Map<String, dynamic> json) => ResOtp(
    status: json["status"],
    message: json["message"],
    response: Response.fromJson(json["response"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "response": response!.toJson(),
  };
}

class Response {
  Response({
    required this.userType,
    required this.userId,
    required this.otp,
  });

  String? userType;
  String? userId;
  int? otp;

  factory Response.fromJson(Map<String, dynamic> json) => Response(
    userType: json["user_type"],
    userId: json["user_id"].toString(),
    otp: json["otp"],
  );

  Map<String, dynamic> toJson() => {
    "user_type": userType,
    "user_id": userId,
    "otp": otp,
  };
}

