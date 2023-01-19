
import 'dart:convert';

ReqGstNo reqGstNoFromJson(String str) => ReqGstNo.fromJson(json.decode(str));

String reqGstNoToJson(ReqGstNo data) => json.encode(data.toJson());

class ReqGstNo {
  ReqGstNo({
    required this.gstin,
  });

  String gstin;

  factory ReqGstNo.fromJson(Map<String, dynamic> json) => ReqGstNo(
    gstin: json["gstin"],
  );

  Map<String, dynamic> toJson() => {
    "gstin": gstin,
  };
}
