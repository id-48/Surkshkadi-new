import 'dart:convert';

ReqVehicleNo reqVehicleNoFromJson(String str) => ReqVehicleNo.fromJson(json.decode(str));

String reqVehicleNoToJson(ReqVehicleNo data) => json.encode(data.toJson());

class ReqVehicleNo {
  ReqVehicleNo({
    required this.vehicleNumber,
    required this.blacklistCheck,
  });

  String vehicleNumber;
  bool blacklistCheck;

  factory ReqVehicleNo.fromJson(Map<String, dynamic> json) => ReqVehicleNo(
    vehicleNumber: json["vehicleNumber"],
    blacklistCheck: json["blacklistCheck"],
  );

  Map<String, dynamic> toJson() => {
    "vehicleNumber": vehicleNumber,
    "blacklistCheck": blacklistCheck,
  };
}

