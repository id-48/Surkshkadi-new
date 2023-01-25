import 'package:dio/dio.dart';

class ReqSingleUserAssets {


  String? userId;
  String? specialities;
  String? otherDetails;
  String? email;
  String? state;
  String? city;
  List<MultipartFile>? documents;
  // List<ReqVariants> variants;

  ReqSingleUserAssets(
      {

        this.userId,
        this.specialities,
        this.otherDetails,
        this.email,
        this.state,
        this.city,
        this.documents,

      });

  Map<String, dynamic> toJson() =>
      {

        "user_id": userId,
        "specialities": specialities,
        "other_details": otherDetails,
        "email": email,
        "state": state,
        "city": city,
        "documents": documents

      };
}
