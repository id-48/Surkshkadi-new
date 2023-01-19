
import 'dart:convert';

ResAadharNo resAadharNoFromJson(String str) => ResAadharNo.fromJson(json.decode(str));

String resAadharNoToJson(ResAadharNo data) => json.encode(data.toJson());

class ResAadharNo {
  ResAadharNo({
     this.code,
     this.result,
  });

  int? code;
  Result? result;

  factory ResAadharNo.fromJson(Map<String, dynamic> json) => ResAadharNo(
    code: json["code"],
    result: Result.fromJson(json["result"]),
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "result": result?.toJson(),
  };
}

class Result {
  Result({
    this.data,
    this.statusCode,
    this.messageCode,
    this.message,
    this.success,
  });

  Data? data;
  int? statusCode;
  String? messageCode;
  String? message;
  bool? success;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    data: Data.fromJson(json["data"]),
    statusCode: json["status_code"],
    messageCode: json["message_code"],
    message: json["message"],
    success: json["success"],
  );

  Map<String, dynamic> toJson() => {
    "data": data?.toJson(),
    "status_code": statusCode,
    "message_code": messageCode,
    "message": message,
    "success": success,
  };
}

class Data {
  Data({
     this.clientId,
     this.otpSent,
     this.ifNumber,
     this.validAadhaar,
  });

  String? clientId;
  bool? otpSent;
  bool? ifNumber;
  bool? validAadhaar;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    clientId: json["client_id"],
    otpSent: json["otp_sent"],
    ifNumber: json["if_number"],
    validAadhaar: json["valid_aadhaar"],
  );

  Map<String, dynamic> toJson() => {
    "client_id": clientId,
    "otp_sent": otpSent,
    "if_number": ifNumber,
    "valid_aadhaar": validAadhaar,
  };
}
