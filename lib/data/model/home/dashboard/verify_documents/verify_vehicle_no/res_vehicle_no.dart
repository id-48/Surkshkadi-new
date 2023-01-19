

import 'dart:convert';

ResVehicleNo resVehicleNoFromJson(String str) => ResVehicleNo.fromJson(json.decode(str));

String resVehicleNoToJson(ResVehicleNo data) => json.encode(data.toJson());

class ResVehicleNo {
  ResVehicleNo({
    required this.code,
    required this.result,
  });

  String code;
  Result result;

  factory ResVehicleNo.fromJson(Map<String, dynamic> json) => ResVehicleNo(
    code: json["code"].toString(),
    result: Result.fromJson(json["result"]),
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "result": result.toJson(),
  };
}

class Result {
  Result({
    required this.regNo,
    required this.resultClass,
    required this.chassis,
    required this.engine,
    required this.vehicleManufacturerName,
    required this.model,
    required this.vehicleColour,
    required this.type,
    required this.normsType,
    required this.bodyType,
    required this.ownerCount,
    required this.owner,
    required this.ownerFatherName,
    required this.mobileNumber,
    required this.status,
    required this.statusAsOn,
    required this.regAuthority,
    required this.regDate,
    required this.vehicleManufacturingMonthYear,
    required this.rcExpiryDate,
    required this.vehicleTaxUpto,
    required this.vehicleInsuranceCompanyName,
    required this.vehicleInsuranceUpto,
    required this.vehicleInsurancePolicyNumber,
    required this.rcFinancer,
    required this.splitPresentAddress,
    required this.vehicleCubicCapacity,
    required this.grossVehicleWeight,
    required this.unladenWeight,
    required this.vehicleCategory,
    required this.rcStandardCap,
    required this.vehicleCylindersNo,
    required this.vehicleSeatCapacity,
    required this.vehicleSleeperCapacity,
    required this.vehicleStandingCapacity,
    required this.wheelbase,
    required this.vehicleNumber,
    required this.puccNumber,
    required this.puccUpto,
    required this.blacklistStatus,
    required this.blacklistDetails,
    required this.challanDetails,
    required this.permitIssueDate,
    required this.permitNumber,
    required this.permitType,
    required this.permitValidFrom,
    required this.permitValidUpto,
    required this.nonUseStatus,
    required this.nonUseFrom,
    required this.nonUseTo,
    required this.nationalPermitNumber,
    required this.nationalPermitUpto,
    required this.nationalPermitIssuedBy,
    required this.isCommercial,
    required this.nocDetails,
  });

  String regNo;
  String resultClass;
  String chassis;
  String engine;
  String vehicleManufacturerName;
  String model;
  String vehicleColour;
  String type;
  String normsType;
  String bodyType;
  String ownerCount;
  String owner;
  String ownerFatherName;
  String mobileNumber;
  String status;
  String statusAsOn;
  String regAuthority;
  String regDate;
  String vehicleManufacturingMonthYear;
  String rcExpiryDate;
  String vehicleTaxUpto;
  String vehicleInsuranceCompanyName;
  String vehicleInsuranceUpto;
  String vehicleInsurancePolicyNumber;
  String rcFinancer;
  SplitPresentAddress splitPresentAddress;
  String vehicleCubicCapacity;
  String grossVehicleWeight;
  String unladenWeight;
  String vehicleCategory;
  String rcStandardCap;
  String vehicleCylindersNo;
  String vehicleSeatCapacity;
  String vehicleSleeperCapacity;
  String vehicleStandingCapacity;
  String wheelbase;
  String vehicleNumber;
  String puccNumber;
  String puccUpto;
  String blacklistStatus;
  List<dynamic> blacklistDetails;
  List<dynamic> challanDetails;
  String permitIssueDate;
  String permitNumber;
  String permitType;
  String permitValidFrom;
  String permitValidUpto;
  String nonUseStatus;
  String nonUseFrom;
  String nonUseTo;
  String nationalPermitNumber;
  String nationalPermitUpto;
  String nationalPermitIssuedBy;
  bool isCommercial;
  String nocDetails;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    regNo: json["regNo"],
    resultClass: json["class"],
    chassis: json["chassis"],
    engine: json["engine"],
    vehicleManufacturerName: json["vehicleManufacturerName"],
    model: json["model"],
    vehicleColour: json["vehicleColour"],
    type: json["type"],
    normsType: json["normsType"],
    bodyType: json["bodyType"],
    ownerCount: json["ownerCount"],
    owner: json["owner"],
    ownerFatherName: json["ownerFatherName"],
    mobileNumber: json["mobileNumber"],
    status: json["status"],
    statusAsOn: json["statusAsOn"],
    regAuthority: json["regAuthority"],
    regDate: json["regDate"],
    vehicleManufacturingMonthYear: json["vehicleManufacturingMonthYear"],
    rcExpiryDate: json["rcExpiryDate"],
    vehicleTaxUpto: json["vehicleTaxUpto"],
    vehicleInsuranceCompanyName: json["vehicleInsuranceCompanyName"],
    vehicleInsuranceUpto: json["vehicleInsuranceUpto"],
    vehicleInsurancePolicyNumber: json["vehicleInsurancePolicyNumber"],
    rcFinancer: json["rcFinancer"],
    splitPresentAddress: SplitPresentAddress.fromJson(json["splitPresentAddress"]),
    vehicleCubicCapacity: json["vehicleCubicCapacity"],
    grossVehicleWeight: json["grossVehicleWeight"],
    unladenWeight: json["unladenWeight"],
    vehicleCategory: json["vehicleCategory"],
    rcStandardCap: json["rcStandardCap"],
    vehicleCylindersNo: json["vehicleCylindersNo"],
    vehicleSeatCapacity: json["vehicleSeatCapacity"],
    vehicleSleeperCapacity: json["vehicleSleeperCapacity"],
    vehicleStandingCapacity: json["vehicleStandingCapacity"],
    wheelbase: json["wheelbase"],
    vehicleNumber: json["vehicleNumber"],
    puccNumber: json["puccNumber"],
    puccUpto: json["puccUpto"],
    blacklistStatus: json["blacklistStatus"],
    blacklistDetails: List<dynamic>.from(json["blacklistDetails"].map((x) => x)),
    challanDetails: List<dynamic>.from(json["challanDetails"].map((x) => x)),
    permitIssueDate: json["permitIssueDate"],
    permitNumber: json["permitNumber"],
    permitType: json["permitType"],
    permitValidFrom: json["permitValidFrom"],
    permitValidUpto: json["permitValidUpto"],
    nonUseStatus: json["nonUseStatus"],
    nonUseFrom: json["nonUseFrom"],
    nonUseTo: json["nonUseTo"],
    nationalPermitNumber: json["nationalPermitNumber"],
    nationalPermitUpto: json["nationalPermitUpto"],
    nationalPermitIssuedBy: json["nationalPermitIssuedBy"],
    isCommercial: json["isCommercial"],
    nocDetails: json["nocDetails"],
  );

  Map<String, dynamic> toJson() => {
    "regNo": regNo,
    "class": resultClass,
    "chassis": chassis,
    "engine": engine,
    "vehicleManufacturerName": vehicleManufacturerName,
    "model": model,
    "vehicleColour": vehicleColour,
    "type": type,
    "normsType": normsType,
    "bodyType": bodyType,
    "ownerCount": ownerCount,
    "owner": owner,
    "ownerFatherName": ownerFatherName,
    "mobileNumber": mobileNumber,
    "status": status,
    "statusAsOn": statusAsOn,
    "regAuthority": regAuthority,
    "regDate": regDate,
    "vehicleManufacturingMonthYear": vehicleManufacturingMonthYear,
    "rcExpiryDate": rcExpiryDate,
    "vehicleTaxUpto": vehicleTaxUpto,
    "vehicleInsuranceCompanyName": vehicleInsuranceCompanyName,
    "vehicleInsuranceUpto": vehicleInsuranceUpto,
    "vehicleInsurancePolicyNumber": vehicleInsurancePolicyNumber,
    "rcFinancer": rcFinancer,
    "splitPresentAddress": splitPresentAddress.toJson(),
    "vehicleCubicCapacity": vehicleCubicCapacity,
    "grossVehicleWeight": grossVehicleWeight,
    "unladenWeight": unladenWeight,
    "vehicleCategory": vehicleCategory,
    "rcStandardCap": rcStandardCap,
    "vehicleCylindersNo": vehicleCylindersNo,
    "vehicleSeatCapacity": vehicleSeatCapacity,
    "vehicleSleeperCapacity": vehicleSleeperCapacity,
    "vehicleStandingCapacity": vehicleStandingCapacity,
    "wheelbase": wheelbase,
    "vehicleNumber": vehicleNumber,
    "puccNumber": puccNumber,
    "puccUpto": puccUpto,
    "blacklistStatus": blacklistStatus,
    "blacklistDetails": List<dynamic>.from(blacklistDetails.map((x) => x)),
    "challanDetails": List<dynamic>.from(challanDetails.map((x) => x)),
    "permitIssueDate": permitIssueDate,
    "permitNumber": permitNumber,
    "permitType": permitType,
    "permitValidFrom": permitValidFrom,
    "permitValidUpto": permitValidUpto,
    "nonUseStatus": nonUseStatus,
    "nonUseFrom": nonUseFrom,
    "nonUseTo": nonUseTo,
    "nationalPermitNumber": nationalPermitNumber,
    "nationalPermitUpto": nationalPermitUpto,
    "nationalPermitIssuedBy": nationalPermitIssuedBy,
    "isCommercial": isCommercial,
    "nocDetails": nocDetails,
  };
}

class SplitPresentAddress {
  SplitPresentAddress({
    required this.district,
    required this.state,
    required this.pincode,
    required this.country,
  });

  List<String> district;
  List<List<String>> state;
  String pincode;
  List<String> country;

  factory SplitPresentAddress.fromJson(Map<String, dynamic> json) => SplitPresentAddress(
    district: List<String>.from(json["district"].map((x) => x)),
    state: List<List<String>>.from(json["state"].map((x) => List<String>.from(x.map((x) => x)))),
    pincode: json["pincode"],
    country: List<String>.from(json["country"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "district": List<dynamic>.from(district.map((x) => x)),
    "state": List<dynamic>.from(state.map((x) => List<dynamic>.from(x.map((x) => x)))),
    "pincode": pincode,
    "country": List<dynamic>.from(country.map((x) => x)),
  };
}
