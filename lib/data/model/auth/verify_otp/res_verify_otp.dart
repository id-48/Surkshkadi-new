import 'dart:convert';

ResVerifyOtp resVerifyOtpFromJson(String str) => ResVerifyOtp.fromJson(json.decode(str));

String resVerifyOtpToJson(ResVerifyOtp data) => json.encode(data.toJson());

class ResVerifyOtp {
  ResVerifyOtp({
    required this.status,
    required this.message,
    required this.response,
  });

  int status;
  String message;
  Response response;

  factory ResVerifyOtp.fromJson(Map<String, dynamic> json) => ResVerifyOtp(
    status: json["status"],
    message: json["message"],
    response: Response.fromJson(json["response"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "response": response.toJson(),
  };
}

class Response {
  Response({
    required this.accountStatus,
    required this.isCompleted,
    required this.isSubscribed,
    required this.firstChatBotStatus,
    required this.paymentStatus,
    required this.kycStatus,
    required this.secondChatBotStatus,
    required this.beneficiaryStatus,
    required this.willDocumentStatus,
    required this.willReviewStatus,
    required this.assetDetailsStatus,
    required this.userId,
    required this.name,
    required this.email,
    required this.mobile,
    required this.referCode,
    required this.registrationType,
    required this.walletAmount,
    required this.registeredOn,
  });

  String accountStatus;
  String isCompleted;
  String isSubscribed;
  String firstChatBotStatus;
  String paymentStatus;
  String kycStatus;
  String secondChatBotStatus;
  String beneficiaryStatus;
  String willDocumentStatus;
  String willReviewStatus;
  String assetDetailsStatus;
  String userId;
  String name;
  String email;
  String mobile;
  String referCode;
  String registrationType;
  String walletAmount;
  String registeredOn;

  factory Response.fromJson(Map<String, dynamic> json) => Response(
    accountStatus: json["account_status"],
    isCompleted: json["is_completed"],
    isSubscribed: json["is_subscribed"],
    firstChatBotStatus: json["first_chat_bot_status"],
    paymentStatus: json["payment_status"],
    kycStatus: json["kyc_status"],
    secondChatBotStatus: json["second_chat_bot_status"],
    beneficiaryStatus: json["beneficiary_status"],
    willDocumentStatus: json["will_document_status"],
    willReviewStatus: json["will_review_status"],
    assetDetailsStatus: json["asset_details_status"],
    userId: json["user_id"],
    name: json["name"],
    email: json["email"],
    mobile: json["mobile"],
    referCode: json["refer_code"],
    registrationType: json["registration_type"],
    walletAmount: json["wallet_amount"],
    registeredOn:json["registered_on"].toString(),
  );

  Map<String, dynamic> toJson() => {
    "account_status": accountStatus,
    "is_completed": isCompleted,
    "is_subscribed": isSubscribed,
    "first_chat_bot_status": firstChatBotStatus,
    "payment_status": paymentStatus,
    "kyc_status": kycStatus,
    "second_chat_bot_status": secondChatBotStatus,
    "beneficiary_status": beneficiaryStatus,
    "will_document_status": willDocumentStatus,
    "will_review_status": willReviewStatus,
    "asset_details_status": assetDetailsStatus,
    "user_id": userId,
    "name": name,
    "email": email,
    "mobile": mobile,
    "refer_code": referCode,
    "registration_type": registrationType,
    "wallet_amount": walletAmount,
    "registered_on": registeredOn,
  };
}
