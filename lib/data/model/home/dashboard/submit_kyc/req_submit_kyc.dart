
import 'package:dio/dio.dart';


class ReqSubmitKyc {


  String? userId;
  String? userType;
  String? aadharNo;
  String? aadharFrontImage;
  String? aadharBackImage;
  String? panNo;
  String? panFrontImage;
  String? selfImage;
  // List<MultipartFile>? documents;

  ReqSubmitKyc(
      {
        this.userId,
        this.userType,
        this.aadharNo,
        this.aadharFrontImage,
        this.aadharBackImage,
        this.panNo,
        this.panFrontImage,
        this.selfImage
      });
  Map<String, dynamic> toJson() =>
      {
        "user_id": userId,
        "user_type": userType,
        "aadhar_no": aadharNo,
        "aadhar_front_image": aadharFrontImage,
        "aadhar_back_image": aadharBackImage,
        "pan_no": panNo,
        "pan_front_image": panFrontImage,
        "self_image": selfImage
      };
}
