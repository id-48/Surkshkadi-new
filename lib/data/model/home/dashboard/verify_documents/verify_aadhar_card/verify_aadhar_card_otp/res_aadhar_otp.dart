

import 'dart:convert';

ResAadharOtp resAadharOtpFromJson(String str) => ResAadharOtp.fromJson(json.decode(str));

String resAadharOtpToJson(ResAadharOtp data) => json.encode(data.toJson());

class ResAadharOtp {
  ResAadharOtp({
    required this.code,
    required this.result,
  });

  int code;
  Result result;

  factory ResAadharOtp.fromJson(Map<String, dynamic> json) => ResAadharOtp(
    code: json["code"],
    result: Result.fromJson(json["result"]),
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "result": result.toJson(),
  };
}

class Result {
  Result({
    required this.data,
    required this.statusCode,
    required this.success,
    required this.message,
    required this.messageCode,
  });

  Data data;
  int statusCode;
  bool success;
  dynamic message;
  String messageCode;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    data: Data.fromJson(json["data"]),
    statusCode: json["status_code"],
    success: json["success"],
    message: json["message"],
    messageCode: json["message_code"],
  );

  Map<String, dynamic> toJson() => {
    "data": data.toJson(),
    "status_code": statusCode,
    "success": success,
    "message": message,
    "message_code": messageCode,
  };
}

class Data {
  Data({
    required this.clientId,
    required this.fullName,
    required this.aadhaarNumber,
    required this.dob,
    required this.gender,
    required this.address,
    required this.faceStatus,
    required this.faceScore,
    required this.zip,
    required this.profileImage,
    required this.hasImage,
    required this.emailHash,
    required this.mobileHash,
    required this.rawXml,
    required this.zipData,
    required this.careOf,
    required this.shareCode,
    required this.mobileVerified,
    required this.referenceId,
    required this.aadhaarPdf,
  });

  String clientId;
  String fullName;
  String aadhaarNumber;
  DateTime dob;
  String gender;
  Address address;
  bool faceStatus;
  int faceScore;
  String zip;
  String profileImage;
  bool hasImage;
  String emailHash;
  String mobileHash;
  String rawXml;
  String zipData;
  dynamic careOf;
  String shareCode;
  bool mobileVerified;
  String referenceId;
  dynamic aadhaarPdf;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    clientId: json["client_id"],
    fullName: json["full_name"],
    aadhaarNumber: json["aadhaar_number"],
    dob: DateTime.parse(json["dob"]),
    gender: json["gender"],
    address: Address.fromJson(json["address"]),
    faceStatus: json["face_status"],
    faceScore: json["face_score"],
    zip: json["zip"],
    profileImage: json["profile_image"],
    hasImage: json["has_image"],
    emailHash: json["email_hash"],
    mobileHash: json["mobile_hash"],
    rawXml: json["raw_xml"],
    zipData: json["zip_data"],
    careOf: json["care_of"],
    shareCode: json["share_code"],
    mobileVerified: json["mobile_verified"],
    referenceId: json["reference_id"],
    aadhaarPdf: json["aadhaar_pdf"],
  );

  Map<String, dynamic> toJson() => {
    "client_id": clientId,
    "full_name": fullName,
    "aadhaar_number": aadhaarNumber,
    "dob": "${dob.year.toString().padLeft(4, '0')}-${dob.month.toString().padLeft(2, '0')}-${dob.day.toString().padLeft(2, '0')}",
    "gender": gender,
    "address": address.toJson(),
    "face_status": faceStatus,
    "face_score": faceScore,
    "zip": zip,
    "profile_image": profileImage,
    "has_image": hasImage,
    "email_hash": emailHash,
    "mobile_hash": mobileHash,
    "raw_xml": rawXml,
    "zip_data": zipData,
    "care_of": careOf,
    "share_code": shareCode,
    "mobile_verified": mobileVerified,
    "reference_id": referenceId,
    "aadhaar_pdf": aadhaarPdf,
  };
}

class Address {
  Address({
    required this.country,
    required this.dist,
    required this.state,
    required this.po,
    required this.loc,
    required this.vtc,
    required this.subdist,
    required this.street,
    required this.house,
    required this.landmark,
  });

  String country;
  String dist;
  String state;
  String po;
  String loc;
  String vtc;
  String subdist;
  String street;
  String house;
  String landmark;

  factory Address.fromJson(Map<String, dynamic> json) => Address(
    country: json["country"],
    dist: json["dist"],
    state: json["state"],
    po: json["po"],
    loc: json["loc"],
    vtc: json["vtc"],
    subdist: json["subdist"],
    street: json["street"],
    house: json["house"],
    landmark: json["landmark"],
  );

  Map<String, dynamic> toJson() => {
    "country": country,
    "dist": dist,
    "state": state,
    "po": po,
    "loc": loc,
    "vtc": vtc,
    "subdist": subdist,
    "street": street,
    "house": house,
    "landmark": landmark,
  };
}
