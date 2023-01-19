
import 'dart:convert';

ResSingleUaPayment resSingleUaPaymentFromJson(String str) => ResSingleUaPayment.fromJson(json.decode(str));

String resSingleUaPaymentToJson(ResSingleUaPayment data) => json.encode(data.toJson());

class ResSingleUaPayment {
  ResSingleUaPayment({
    required this.status,
    required this.message,
  });

  int status;
  String message;

  factory ResSingleUaPayment.fromJson(Map<String, dynamic> json) => ResSingleUaPayment(
    status: json["status"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
  };
}
