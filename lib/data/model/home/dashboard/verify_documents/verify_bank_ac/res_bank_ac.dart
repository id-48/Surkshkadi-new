
import 'dart:convert';

ResBankAc resBankAcFromJson(String str) => ResBankAc.fromJson(json.decode(str));

String resBankAcToJson(ResBankAc data) => json.encode(data.toJson());

class ResBankAc {
  ResBankAc({
    required this.result,
  });

  Result result;

  factory ResBankAc.fromJson(Map<String, dynamic> json) => ResBankAc(
    result: Result.fromJson(json["result"]),
  );

  Map<String, dynamic> toJson() => {
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
    required this.accountExists,
    required this.upiId,
    required this.fullName,
    required this.remarks,
    required this.ifscDetails,
  });

  String clientId;
  bool accountExists;
  String upiId;
  String fullName;
  String remarks;
  IfscDetails ifscDetails;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    clientId: json["client_id"],
    accountExists: json["account_exists"],
    upiId: json["upi_id"].toString(),
    fullName: json["full_name"],
    remarks: json["remarks"],
    ifscDetails: IfscDetails.fromJson(json["ifsc_details"]),
  );

  Map<String, dynamic> toJson() => {
    "client_id": clientId,
    "account_exists": accountExists,
    "upi_id": upiId,
    "full_name": fullName,
    "remarks": remarks,
    "ifsc_details": ifscDetails.toJson(),
  };
}

class IfscDetails {
  IfscDetails({
    required this.id,
    required this.ifsc,
    required this.micr,
    required this.iso3166,
    required this.swift,
    required this.bank,
    required this.bankCode,
    required this.bankName,
    required this.branch,
    required this.centre,
    required this.district,
    required this.state,
    required this.city,
    required this.address,
    required this.contact,
    required this.imps,
    required this.rtgs,
    required this.neft,
    required this.upi,
    required this.micrCheck,
  });

  String id;
  dynamic ifsc;
  String micr;
  String iso3166;
  String swift;
  String bank;
  String bankCode;
  String bankName;
  String branch;
  String centre;
  String district;
  String state;
  String city;
  String address;
  String contact;
  bool imps;
  bool rtgs;
  bool neft;
  bool upi;
  bool micrCheck;

  factory IfscDetails.fromJson(Map<String, dynamic> json) => IfscDetails(
    id: json["id"].toString(),
    ifsc: json["ifsc"],
    micr: json["micr"].toString(),
    iso3166: json["iso3166"],
    swift: json["swift"].toString(),
    bank: json["bank"],
    bankCode: json["bank_code"],
    bankName: json["bank_name"],
    branch: json["branch"],
    centre: json["centre"],
    district: json["district"],
    state: json["state"],
    city: json["city"],
    address: json["address"],
    contact: json["contact"],
    imps: json["imps"],
    rtgs: json["rtgs"],
    neft: json["neft"],
    upi: json["upi"],
    micrCheck: json["micr_check"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "ifsc": ifsc,
    "micr": micr,
    "iso3166": iso3166,
    "swift": swift,
    "bank": bank,
    "bank_code": bankCode,
    "bank_name": bankName,
    "branch": branch,
    "centre": centre,
    "district": district,
    "state": state,
    "city": city,
    "address": address,
    "contact": contact,
    "imps": imps,
    "rtgs": rtgs,
    "neft": neft,
    "upi": upi,
    "micr_check": micrCheck,
  };
}
