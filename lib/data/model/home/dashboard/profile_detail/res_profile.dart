
import 'dart:convert';

ResProfileDetails resProfileDetailsFromJson(String str) => ResProfileDetails.fromJson(json.decode(str));

String resProfileDetailsToJson(ResProfileDetails data) => json.encode(data.toJson());

class ResProfileDetails {
  ResProfileDetails({
    required this.status,
    required this.message,
    required this.response,
  });

  int status;
  String message;
  List<Response> response;

  factory ResProfileDetails.fromJson(Map<String, dynamic> json) => ResProfileDetails(
    status: json["status"],
    message: json["message"],
    response: List<Response>.from(json["response"].map((x) => Response.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "response": List<dynamic>.from(response.map((x) => x.toJson())),
  };
}

class Response {
  Response({
    required this.name,
    required this.dob,
    required this.email,
    required this.mobile,
    required this.address,
    required this.kycStatus,
    required this.aadharNo,
    required this.panNo,
    required this.plan,
  });

  String name;
  String dob;
  String email;
  String mobile;
  String address;
  String kycStatus;
  String aadharNo;
  String panNo;
  String plan;

  factory Response.fromJson(Map<String, dynamic> json) => Response(
    name: json["name"],
    dob: json["dob"].toString(),
    email: json["email"],
    mobile: json["mobile"],
    address: json["address"],
    kycStatus: json["kyc_status"],
    aadharNo: json["aadhar_no"],
    panNo: json["pan_no"],
    plan: json["plan"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "dob": dob,
    "email": email,
    "mobile": mobile,
    "address": address,
    "kyc_status": kycStatus,
    "aadhar_no": aadharNo,
    "pan_no": panNo,
    "plan": plan,
  };
}
