
import 'dart:convert';

ReqAadharNo reqAadharNoFromJson(String str) => ReqAadharNo.fromJson(json.decode(str));

String reqAadharNoToJson(ReqAadharNo data) => json.encode(data.toJson());

class ReqAadharNo {
  ReqAadharNo({
    required this.aadhaarNumber,
  });

  String aadhaarNumber;

  factory ReqAadharNo.fromJson(Map<String, dynamic> json) => ReqAadharNo(
    aadhaarNumber: json["aadhaarNumber"],
  );

  Map<String, dynamic> toJson() => {
    "aadhaarNumber": aadhaarNumber,
  };
}
