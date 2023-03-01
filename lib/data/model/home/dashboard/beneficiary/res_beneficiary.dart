

import 'dart:convert';

ResBeneficiary resBeneficiaryFromJson(String str) => ResBeneficiary.fromJson(json.decode(str));

String resBeneficiaryToJson(ResBeneficiary data) => json.encode(data.toJson());

class ResBeneficiary {
  ResBeneficiary({
    required this.status,
    required this.message,
  });

  int status;
  String message;

  factory ResBeneficiary.fromJson(Map<String, dynamic> json) => ResBeneficiary(
    status: json["status"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
  };
}
