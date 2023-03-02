
import 'dart:convert';

List<ResPincodeStateCity> resPincodeStateCityFromJson(String str) => List<ResPincodeStateCity>.from(json.decode(str).map((x) => ResPincodeStateCity.fromJson(x)));

String resPincodeStateCityToJson(List<ResPincodeStateCity> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ResPincodeStateCity {
  ResPincodeStateCity({
    required this.message,
    required this.status,
    required this.postOffice,
  });

  String message;
  String status;
  List<PostOffice> postOffice;

  factory ResPincodeStateCity.fromJson(Map<String, dynamic> json) => ResPincodeStateCity(
    message: json["Message"],
    status: json["Status"],
    postOffice: List<PostOffice>.from(json["PostOffice"].map((x) => PostOffice.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "Message": message,
    "Status": status,
    "PostOffice": List<dynamic>.from(postOffice.map((x) => x.toJson())),
  };
}

class PostOffice {
  PostOffice({
    required this.name,
    required this.description,
    required this.branchType,
    required this.deliveryStatus,
    required this.circle,
    required this.district,
    required this.division,
    required this.region,
    required this.block,
    required this.state,
    required this.country,
    required this.pincode,
  });

  String name;
  String description;
  String branchType;
  String deliveryStatus;
  String circle;
  String district;
  String division;
  String region;
  String block;
  String state;
  String country;
  String pincode;

  factory PostOffice.fromJson(Map<String, dynamic> json) => PostOffice(
    name: json["Name"].toString(),
    description: json["Description"].toString(),
    branchType: json["BranchType"].toString(),
    deliveryStatus: json["DeliveryStatus"].toString(),
    circle: json["Circle"].toString(),
    district: json["District"].toString(),
    division: json["Division"].toString(),
    region: json["Region"].toString(),
    block: json["Block"].toString(),
    state: json["State"].toString(),
    country: json["Country"].toString(),
    pincode: json["Pincode"].toString(),
  );

  Map<String, dynamic> toJson() => {
    "Name": name,
    "Description": description,
    "BranchType": branchType,
    "DeliveryStatus": deliveryStatus,
    "Circle": circle,
    "District": district,
    "Division": division,
    "Region": region,
    "Block": block,
    "State": state,
    "Country": country,
    "Pincode": pincode,
  };
}
