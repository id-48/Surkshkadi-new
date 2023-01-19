// //
// // import 'dart:convert';
// //
// // ResVerifyOtp resVerifyOtpFromJson(String str) => ResVerifyOtp.fromJson(json.decode(str));
// //
// // String resVerifyOtpToJson(ResVerifyOtp data) => json.encode(data.toJson());
// //
// // class ResVerifyOtp {
// //   ResVerifyOtp({
// //     required this.success,
// //     required this.message,
// //     required this.data,
// //   });
// //
// //   String success;
// //   String message;
// //   Data data;
// //
// //   factory ResVerifyOtp.fromJson(Map<String, dynamic> json) => ResVerifyOtp(
// //     success: json["success"].toString(),
// //     message: json["message"],
// //     data: Data.fromJson(json["data"]),
// //   );
// //
// //   Map<String, dynamic> toJson() => {
// //     "success": success,
// //     "message": message,
// //     "data": data.toJson(),
// //   };
// // }
// //
// // class Data {
// //   Data({
// //     required this.id,
// //     required this.roleId,
// //     required this.name,
// //     required this.email,
// //     required this.mobile,
// //     required this.emailVerifiedAt,
// //     required this.profileImage,
// //     required this.status,
// //     required this.mobileVerifyStatus,
// //     required this.otp,
// //     required this.accessToken,
// //     required this.deviceToken,
// //     required this.deviceType,
// //     required this.zipcode,
// //     required this.latitude,
// //     required this.longitude,
// //     required this.otpVerifyStatus,
// //     required this.rememberToken,
// //     required this.createdAt,
// //     required this.updatedAt,
// //     required this.rajorpayCustomerId,
// //     required this.role,
// //     required this.profileStatus,
// //     required this.gstNumber,
// //     required this.shopName,
// //     required this.imageUrl,
// //   });
// //
// //   String id;
// //   String roleId;
// //   String name;
// //   String email;
// //   String mobile;
// //   String emailVerifiedAt;
// //   String profileImage;
// //   String status;
// //   String mobileVerifyStatus;
// //   String otp;
// //   String accessToken;
// //   String deviceToken;
// //   String deviceType;
// //   String zipcode;
// //   String latitude;
// //   String longitude;
// //   String otpVerifyStatus;
// //   String rememberToken;
// //   String createdAt;
// //   String updatedAt;
// //   String rajorpayCustomerId;
// //   String role;
// //   String profileStatus;
// //   String gstNumber;
// //   String shopName;
// //   String imageUrl;
// //
// //   factory Data.fromJson(Map<String, dynamic> json) => Data(
// //     id: json["id"].toString(),
// //     roleId: json["role_id"].toString(),
// //     name: json["name"].toString(),
// //     email: json["email"].toString(),
// //     mobile: json["mobile"].toString(),
// //     emailVerifiedAt: json["email_verified_at"].toString(),
// //     profileImage: json["profile_image"].toString(),
// //     status: json["status"].toString(),
// //     mobileVerifyStatus: json["mobile_verify_status"].toString(),
// //     otp: json["otp"].toString(),
// //     accessToken: json["access_token"].toString(),
// //     deviceToken: json["device_token"].toString(),
// //     deviceType: json["device_type"].toString(),
// //     zipcode: json["zipcode"].toString(),
// //     latitude: json["latitude"].toString(),
// //     longitude: json["longitude"].toString(),
// //     otpVerifyStatus: json["otp_verify_status"].toString(),
// //     rememberToken: json["remember_token"].toString(),
// //     createdAt: DateTime.parse(json["created_at"]).toString(),
// //     updatedAt: DateTime.parse(json["updated_at"]).toString(),
// //     rajorpayCustomerId: json["rajorpay_customer_id"].toString(),
// //     role: json["role"].toString(),
// //     profileStatus: json["profile_status"].toString(),
// //     gstNumber: json["gst_number"].toString(),
// //     shopName: json["shop_name"].toString(),
// //     imageUrl: json["image_url"].toString(),
// //   );
// //
// //   Map<String, dynamic> toJson() => {
// //     "id": id,
// //     "role_id": roleId,
// //     "name": name,
// //     "email": email,
// //     "mobile": mobile,
// //     "email_verified_at": emailVerifiedAt,
// //     "profile_image": profileImage,
// //     "status": status,
// //     "mobile_verify_status": mobileVerifyStatus,
// //     "otp": otp,
// //     "access_token": accessToken,
// //     "device_token": deviceToken,
// //     "device_type": deviceType,
// //     "zipcode": zipcode,
// //     "latitude": latitude,
// //     "longitude": longitude,
// //     "otp_verify_status": otpVerifyStatus,
// //     "remember_token": rememberToken,
// //     "created_at": createdAt,
// //     "updated_at": updatedAt,
// //     "rajorpay_customer_id": rajorpayCustomerId,
// //     "role": role,
// //     "profile_status": profileStatus,
// //     "gst_number": gstNumber,
// //     "shop_name": shopName,
// //     "image_url": imageUrl,
// //   };
// // }
//
//
//
//
// import 'dart:convert';
//
// ResVerifyOtp resVerifyOtpFromJson(String str) => ResVerifyOtp.fromJson(json.decode(str));
//
// String resVerifyOtpToJson(ResVerifyOtp data) => json.encode(data.toJson());
//
// class ResVerifyOtp {
//   ResVerifyOtp({
//     required this.status,
//     required this.message,
//     required this.response,
//   });
//
//   String status;
//   String message;
//   Response response;
//
//   factory ResVerifyOtp.fromJson(Map<String, dynamic> json) => ResVerifyOtp(
//     status: json["status"].toString(),
//     message: json["message"],
//     response: Response.fromJson(json["response"]),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "status": status,
//     "message": message,
//     "response": response.toJson(),
//   };
// }
//
// class Response {
//   Response({
//     required this.userId,
//     required this.name,
//     required this.email,
//     required this.mobile,
//     required this.dob,
//     required this.address,
//     required this.gender,
//     required this.wpNo,
//     required this.state,
//     required this.city,
//     required this.postCode,
//     required this.annualIncome,
//     required this.occupation,
//     required this.fatherName,
//     required this.nominee,
//     required this.nomineeRelation,
//     required this.covidDose,
//     required this.nicotineProducts,
//     required this.profileStatus,
//     required this.registeredOn,
//   });
//
//   String userId;
//   String name;
//   String email;
//   String mobile;
//   String dob;
//   String address;
//   String gender;
//   String wpNo;
//   String state;
//   String city;
//   String postCode;
//   String annualIncome;
//   String occupation;
//   String fatherName;
//   String nominee;
//   String nomineeRelation;
//   String covidDose;
//   String nicotineProducts;
//   String profileStatus;
//   DateTime registeredOn;
//
//   factory Response.fromJson(Map<String, dynamic> json) => Response(
//     userId: json["user_id"],
//     name: json["name"],
//     email: json["email"],
//     mobile: json["mobile"],
//     dob: json["dob"],
//     address: json["address"],
//     gender: json["gender"],
//     wpNo: json["wp_no"],
//     state: json["state"],
//     city: json["city"],
//     postCode: json["post_code"],
//     annualIncome: json["annual_income"],
//     occupation: json["occupation"],
//     fatherName: json["father_name"],
//     nominee: json["nominee"],
//     nomineeRelation: json["nominee_relation"],
//     covidDose: json["covid_dose"],
//     nicotineProducts: json["nicotine_products"],
//     profileStatus: json["second_chatboard_status"],
//     registeredOn: DateTime.parse(json["registered_on"]),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "user_id": userId,
//     "name": name,
//     "email": email,
//     "mobile": mobile,
//     "dob": dob,
//     "address": address,
//     "gender": gender,
//     "wp_no": wpNo,
//     "state": state,
//     "city": city,
//     "post_code": postCode,
//     "annual_income": annualIncome,
//     "occupation": occupation,
//     "father_name": fatherName,
//     "nominee": nominee,
//     "nominee_relation": nomineeRelation,
//     "covid_dose": covidDose,
//     "nicotine_products": nicotineProducts,
//     "second_chatboard_status": profileStatus,
//     "registered_on": registeredOn.toIso8601String(),
//   };
// }
//


import 'dart:convert';

ResVerifyOtp? resVerifyOtpFromJson(String str) => ResVerifyOtp.fromJson(json.decode(str));

String resVerifyOtpToJson(ResVerifyOtp? data) => json.encode(data!.toJson());

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
    "response": response!.toJson(),
  };
}

class Response {
  Response({
    required this.userId,
    required this.name,
    required this.email,
    required this.mobile,
    required this.registeredOn,
  });

  String userId;
  String name;
  String email;
  String mobile;
  DateTime registeredOn;

  factory Response.fromJson(Map<String, dynamic> json) => Response(
    userId: json["user_id"],
    name: json["name"],
    email: json["email"],
    mobile: json["mobile"],
    registeredOn: DateTime.parse(json["registered_on"]),
  );

  Map<String, dynamic> toJson() => {
    "user_id": userId,
    "name": name,
    "email": email,
    "mobile": mobile,
    "registered_on": registeredOn.toIso8601String(),
  };
}




