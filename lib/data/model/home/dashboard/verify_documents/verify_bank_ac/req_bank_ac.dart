
import 'dart:convert';

ReqBankAc reqBankAcFromJson(String str) => ReqBankAc.fromJson(json.decode(str));

String reqBankAcToJson(ReqBankAc data) => json.encode(data.toJson());

class ReqBankAc {
  ReqBankAc({
    required this.accountNumber,
    required this.ifsc,
    required this.ifscDetails,
  });

  String accountNumber;
  String ifsc;
  bool ifscDetails;

  factory ReqBankAc.fromJson(Map<String, dynamic> json) => ReqBankAc(
    accountNumber: json["accountNumber"],
    ifsc: json["ifsc"],
    ifscDetails: json["ifscDetails"],
  );

  Map<String, dynamic> toJson() => {
    "accountNumber": accountNumber,
    "ifsc": ifsc,
    "ifscDetails": ifscDetails,
  };
}
