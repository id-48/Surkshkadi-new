
import 'dart:convert';

ResGstNo resGstNoFromJson(String str) => ResGstNo.fromJson(json.decode(str));

String resGstNoToJson(ResGstNo data) => json.encode(data.toJson());

class ResGstNo {
  ResGstNo({
    required this.code,
    required this.result,
  });

  int code;
  ResGstNoResult result;

  factory ResGstNo.fromJson(Map<String, dynamic> json) => ResGstNo(
    code: json["code"],
    result: ResGstNoResult.fromJson(json["result"]),
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "result": result.toJson(),
  };
}

class ResGstNoResult {
  ResGstNoResult({
    required this.task,
    required this.essentials,
    required this.id,
    required this.patronId,
    required this.result,
  });

  String task;
  Essentials essentials;
  String id;
  String patronId;
  ResultResult result;

  factory ResGstNoResult.fromJson(Map<String, dynamic> json) => ResGstNoResult(
    task: json["task"],
    essentials: Essentials.fromJson(json["essentials"]),
    id: json["id"],
    patronId: json["patronId"],
    result: ResultResult.fromJson(json["result"]),
  );

  Map<String, dynamic> toJson() => {
    "task": task,
    "essentials": essentials.toJson(),
    "id": id,
    "patronId": patronId,
    "result": result.toJson(),
  };
}

class Essentials {
  Essentials({
    required this.gstin,
  });

  String gstin;

  factory Essentials.fromJson(Map<String, dynamic> json) => Essentials(
    gstin: json["gstin"],
  );

  Map<String, dynamic> toJson() => {
    "gstin": gstin,
  };
}

class ResultResult {
  ResultResult({
    required this.gstnDetailed,
    required this.gstnRecords,
    required this.gstin,
    required this.annualAggregateTurnOver,
    required this.aggregateTurnOverRange,
    required this.grossTotalIncome,
    required this.grossTotalIncomeFinancialYear,
    required this.filingStatus,
  });

  GstnDetailed gstnDetailed;
  List<GstnRecord> gstnRecords;
  String gstin;
  String annualAggregateTurnOver;
  AggregateTurnOverRange aggregateTurnOverRange;
  String grossTotalIncome;
  String grossTotalIncomeFinancialYear;
  List<FilingStatus> filingStatus;

  factory ResultResult.fromJson(Map<String, dynamic> json) => ResultResult(
    gstnDetailed: GstnDetailed.fromJson(json["gstnDetailed"]),
    gstnRecords: List<GstnRecord>.from(json["gstnRecords"].map((x) => GstnRecord.fromJson(x))),
    gstin: json["gstin"],
    annualAggregateTurnOver: json["annualAggregateTurnOver"],
    aggregateTurnOverRange: AggregateTurnOverRange.fromJson(json["aggregateTurnOverRange"]),
    grossTotalIncome: json["grossTotalIncome"],
    grossTotalIncomeFinancialYear: json["grossTotalIncomeFinancialYear"].toString(),
    filingStatus: List<FilingStatus>.from(json["filingStatus"].map((x) => FilingStatus.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "gstnDetailed": gstnDetailed.toJson(),
    "gstnRecords": List<dynamic>.from(gstnRecords.map((x) => x.toJson())),
    "gstin": gstin,
    "annualAggregateTurnOver": annualAggregateTurnOver,
    "aggregateTurnOverRange": aggregateTurnOverRange.toJson(),
    "grossTotalIncome": grossTotalIncome,
    "grossTotalIncomeFinancialYear": grossTotalIncomeFinancialYear,
    "filingStatus": List<dynamic>.from(filingStatus.map((x) => x.toJson())),
  };
}

class AggregateTurnOverRange {
  AggregateTurnOverRange({
    required this.minimum,
    required this.maximum,
  });

  int minimum;
  int maximum;

  factory AggregateTurnOverRange.fromJson(Map<String, dynamic> json) => AggregateTurnOverRange(
    minimum: json["minimum"],
    maximum: json["maximum"],
  );

  Map<String, dynamic> toJson() => {
    "minimum": minimum,
    "maximum": maximum,
  };
}

class FilingStatus {
  FilingStatus({
    required this.filingYear,
    required this.monthOfFiling,
    required this.methodOfFilling,
    required this.dateOfFiling,
    required this.gstType,
    required this.gstStatus,
  });

  String filingYear;
  String monthOfFiling;
  String methodOfFilling;
  DateTime dateOfFiling;
  String gstType;
  String gstStatus;

  factory FilingStatus.fromJson(Map<String, dynamic> json) => FilingStatus(
    filingYear: json["filingYear"].toString(),
    monthOfFiling: json["monthOfFiling"],
    methodOfFilling: json["methodOfFilling"].toString(),
    dateOfFiling: DateTime.parse(json["dateOfFiling"]),
    gstType: json["gstType"].toString(),
    gstStatus: json["gstStatus"].toString(),
  );

  Map<String, dynamic> toJson() => {
    "filingYear": filingYear,
    "monthOfFiling": monthOfFiling,
    "methodOfFilling": methodOfFilling,
    "dateOfFiling": "${dateOfFiling.year.toString().padLeft(4, '0')}-${dateOfFiling.month.toString().padLeft(2, '0')}-${dateOfFiling.day.toString().padLeft(2, '0')}",
    "gstType": gstType,
    "gstStatus": gstStatus,
  };
}



class GstnDetailed {
  GstnDetailed({
     required this.constitutionOfBusiness,
     required this.legalNameOfBusiness,
     required this.tradeNameOfBusiness,
     required this.centreJurisdiction,
     required this.stateJurisdiction,
     required this.registrationDate,
     required this.taxPayerDate,
     required this.taxPayerType,
     required this.gstinStatus,
     required this.cancellationDate,
     required this.natureOfBusinessActivities,
     required this.principalPlaceLatitude,
     required this.principalPlaceLongitude,
     required this.principalPlaceStreet,
     required this.principalPlaceLocality,
     required this.principalPlaceCity,
     required this.principalPlaceDistrict,
     required this.principalPlaceState,
     required this.principalPlacePincode,
     required this.additionalPlaceLatitude,
     required this.additionalPlaceLongitude,
     required this.additionalPlaceStreet,
     required this.additionalPlaceLocality,
     required this.additionalPlaceCity,
     required this.additionalPlaceDistrict,
     required this.additionalPlaceState,
     required this.additionalPlacePincode,
     required this.complianceRating,
     required this.additionalPlaceAddress,
     required this.directorNames,
     required this.principalPlaceAddress,
  });

  String constitutionOfBusiness;
  String legalNameOfBusiness;
  String tradeNameOfBusiness;
  String centreJurisdiction;
  String stateJurisdiction;
  DateTime registrationDate;
  String taxPayerDate;
  String taxPayerType;
  String gstinStatus;
  DateTime cancellationDate;
  List<String> natureOfBusinessActivities;
  String principalPlaceLatitude;
  String principalPlaceLongitude;
  String principalPlaceStreet;
  String principalPlaceLocality;
  String principalPlaceCity;
  String principalPlaceDistrict;
  String principalPlaceState;
  String principalPlacePincode;
  String additionalPlaceLatitude;
  String additionalPlaceLongitude;
  String additionalPlaceStreet;
  String additionalPlaceLocality;
  String additionalPlaceCity;
  String additionalPlaceDistrict;
  String additionalPlaceState;
  String additionalPlacePincode;
  String complianceRating;
  List<dynamic> additionalPlaceAddress;
  List<String> directorNames;
  PrincipalPlaceAddress principalPlaceAddress;

  factory GstnDetailed.fromJson(Map<String, dynamic> json) => GstnDetailed(
    constitutionOfBusiness: json["constitutionOfBusiness"],
    legalNameOfBusiness: json["legalNameOfBusiness"],
    tradeNameOfBusiness: json["tradeNameOfBusiness"],
    centreJurisdiction: json["centreJurisdiction"],
    stateJurisdiction: json["stateJurisdiction"],
    registrationDate: DateTime.parse(json["registrationDate"]),
    taxPayerDate: json["taxPayerDate"],
    taxPayerType: json["taxPayerType"],
    gstinStatus: json["gstinStatus"],
    cancellationDate: DateTime.parse(json["cancellationDate"]),
    natureOfBusinessActivities: List<String>.from(json["natureOfBusinessActivities"].map((x) => x)),
    principalPlaceLatitude: json["principalPlaceLatitude"],
    principalPlaceLongitude: json["principalPlaceLongitude"],
    principalPlaceStreet: json["principalPlaceStreet"],
    principalPlaceLocality: json["principalPlaceLocality"],
    principalPlaceCity: json["principalPlaceCity"],
    principalPlaceDistrict: json["principalPlaceDistrict"],
    principalPlaceState: json["principalPlaceState"],
    principalPlacePincode: json["principalPlacePincode"],
    additionalPlaceLatitude: json["additionalPlaceLatitude"],
    additionalPlaceLongitude: json["additionalPlaceLongitude"],
    additionalPlaceStreet: json["additionalPlaceStreet"],
    additionalPlaceLocality: json["additionalPlaceLocality"],
    additionalPlaceCity: json["additionalPlaceCity"],
    additionalPlaceDistrict: json["additionalPlaceDistrict"],
    additionalPlaceState: json["additionalPlaceState"],
    additionalPlacePincode: json["additionalPlacePincode"],
    complianceRating: json["complianceRating"],
    additionalPlaceAddress: List<dynamic>.from(json["additionalPlaceAddress"].map((x) => x)),
    directorNames: List<String>.from(json["directorNames"].map((x) => x)),
    principalPlaceAddress: PrincipalPlaceAddress.fromJson(json["principalPlaceAddress"]),
  );

  Map<String, dynamic> toJson() => {
    "constitutionOfBusiness": constitutionOfBusiness,
    "legalNameOfBusiness": legalNameOfBusiness,
    "tradeNameOfBusiness": tradeNameOfBusiness,
    "centreJurisdiction": centreJurisdiction,
    "stateJurisdiction": stateJurisdiction,
    "registrationDate": "${registrationDate.year.toString().padLeft(4, '0')}-${registrationDate.month.toString().padLeft(2, '0')}-${registrationDate.day.toString().padLeft(2, '0')}",
    "taxPayerDate": taxPayerDate,
    "taxPayerType": taxPayerType,
    "gstinStatus": gstinStatus,
    "cancellationDate": "${cancellationDate.year.toString().padLeft(4, '0')}-${cancellationDate.month.toString().padLeft(2, '0')}-${cancellationDate.day.toString().padLeft(2, '0')}",
    "natureOfBusinessActivities": List<dynamic>.from(natureOfBusinessActivities.map((x) => x)),
    "principalPlaceLatitude": principalPlaceLatitude,
    "principalPlaceLongitude": principalPlaceLongitude,
    "principalPlaceStreet": principalPlaceStreet,
    "principalPlaceLocality": principalPlaceLocality,
    "principalPlaceCity": principalPlaceCity,
    "principalPlaceDistrict": principalPlaceDistrict,
    "principalPlaceState": principalPlaceState,
    "principalPlacePincode": principalPlacePincode,
    "additionalPlaceLatitude": additionalPlaceLatitude,
    "additionalPlaceLongitude": additionalPlaceLongitude,
    "additionalPlaceStreet": additionalPlaceStreet,
    "additionalPlaceLocality": additionalPlaceLocality,
    "additionalPlaceCity": additionalPlaceCity,
    "additionalPlaceDistrict": additionalPlaceDistrict,
    "additionalPlaceState": additionalPlaceState,
    "additionalPlacePincode": additionalPlacePincode,
    "complianceRating": complianceRating,
    "additionalPlaceAddress": List<dynamic>.from(additionalPlaceAddress.map((x) => x)),
    "directorNames": List<dynamic>.from(directorNames.map((x) => x)),
    "principalPlaceAddress": principalPlaceAddress.toJson(),
  };
}

class PrincipalPlaceAddress {
  PrincipalPlaceAddress({
    required this.emailId,
    required this.address,
    required this.natureOfBusiness,
    required this.mobile,
    required this.lastUpdatedDate,
    required this.splitAddress,
  });

  String emailId;
  String address;
  String natureOfBusiness;
  String mobile;
  String lastUpdatedDate;
  SplitAddress splitAddress;

  factory PrincipalPlaceAddress.fromJson(Map<String, dynamic> json) => PrincipalPlaceAddress(
    emailId: json["emailId"],
    address: json["address"],
    natureOfBusiness: json["natureOfBusiness"],
    mobile: json["mobile"],
    lastUpdatedDate: json["lastUpdatedDate"],
    splitAddress: SplitAddress.fromJson(json["splitAddress"]),
  );

  Map<String, dynamic> toJson() => {
    "emailId": emailId,
    "address": address,
    "natureOfBusiness": natureOfBusiness,
    "mobile": mobile,
    "lastUpdatedDate": lastUpdatedDate,
    "splitAddress": splitAddress.toJson(),
  };
}

class SplitAddress {
  SplitAddress({
   required this.district,
   required this.state,
   required this.city,
   required this.pincode,
   required this.country,
   required this.addressLine,
  });

  List<String> district;
  List<List<String>> state;
  List<String> city;
  String pincode;
  List<String> country;
  String addressLine;

  factory SplitAddress.fromJson(Map<String, dynamic> json) => SplitAddress(
    district: List<String>.from(json["district"].map((x) => x)),
    state: List<List<String>>.from(json["state"].map((x) => List<String>.from(x.map((x) => x)))),
    city: List<String>.from(json["city"].map((x) => x)),
    pincode: json["pincode"],
    country: List<String>.from(json["country"].map((x) => x)),
    addressLine: json["addressLine"],
  );

  Map<String, dynamic> toJson() => {
    "district": List<dynamic>.from(district.map((x) => x)),
    "state": List<dynamic>.from(state.map((x) => List<dynamic>.from(x.map((x) => x)))),
    "city": List<dynamic>.from(city.map((x) => x)),
    "pincode": pincode,
    "country": List<dynamic>.from(country.map((x) => x)),
    "addressLine": addressLine,
  };
}

class GstnRecord {
  GstnRecord({
    required this.applicationStatus,
    required this.registrationName,
    required this.mobNum,
    required this.regType,
    required this.emailId,
    required this.tinNumber,
    required this.gstinRefId,
    required this.gstin,
  });

  String applicationStatus;
  String registrationName;
  String mobNum;
  String regType;
  String emailId;
  String tinNumber;
  String gstinRefId;
  String gstin;

  factory GstnRecord.fromJson(Map<String, dynamic> json) => GstnRecord(
    applicationStatus: json["applicationStatus"],
    registrationName: json["registrationName"],
    mobNum: json["mobNum"],
    regType: json["regType"],
    emailId: json["emailId"],
    tinNumber: json["tinNumber"],
    gstinRefId: json["gstinRefId"],
    gstin: json["gstin"],
  );

  Map<String, dynamic> toJson() => {
    "applicationStatus": applicationStatus,
    "registrationName": registrationName,
    "mobNum": mobNum,
    "regType": regType,
    "emailId": emailId,
    "tinNumber": tinNumber,
    "gstinRefId": gstinRefId,
    "gstin": gstin,
  };
}


