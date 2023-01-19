// class ReqChooseAssets {
//   List<dynamic>? bankingInsurance;
//   List<dynamic>? utility;
//   List<dynamic>? govermentSchemes;
//   List<dynamic>? invesments;
//   List<dynamic>? immovable;
//   List<dynamic>? personal;
//   List<dynamic>? companyGST;
//   String? token;
//
//   ReqChooseAssets(
//       {this.bankingInsurance,
//       this.utility,
//       this.govermentSchemes,
//       this.invesments,
//       this.immovable,
//       this.personal,
//       this.token,
//       this.companyGST});
//
//   ReqChooseAssets.fromJson(Map<String, dynamic> json) {
//     bankingInsurance = json['Banking & Insurance'];
//     utility = json['Utility'];
//     govermentSchemes = json['Goverment Schemes'];
//     invesments = json['Invesments'];
//     immovable = json['Immovable'];
//     personal = json['Personal'];
//     companyGST = json['Company GST'];
//     token = json['token'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['Banking & Insurance'] = this.bankingInsurance;
//     data['Utility'] = this.utility;
//     data['Goverment Schemes'] = this.govermentSchemes;
//     data['Invesments'] = this.invesments;
//     data['Immovable'] = this.immovable;
//     data['Personal'] = this.personal;
//     data['Company GST'] = this.companyGST;
//     data['token'] = this.token;
//     return data;
//   }
// }

// To parse this JSON data, do
//
//     final reqVideoSubmit = reqVideoSubmitFromMap(jsonString);

import 'package:dio/dio.dart';

// ReqSingleChooseAssets reqSingleChooseAssetsFromMap(String str) =>
//     ReqSingleChooseAssets.fromMap(json.decode(str));
//
// String ReqSingleChooseAssetsToMap(ReqSingleChooseAssets data) => json.encode(data.toMap());
//
// class ReqSingleChooseAssets {
//   ReqSingleChooseAssets(
//       {this.userId,
//       this.specialities,
//       this.otherDetails,
//       this.email,
//       this.state,
//       this.city,
//       this.documents
//
//       // this.video,
//       // this.script,
//       });
//
//   String? userId;
//   String? specialities;
//   String? otherDetails;
//   String? email;
//   String? state;
//   String? city;
//   List<MultipartFile>? documents;
//
//   // final MultipartFile? video;
//   // final String? script;
//
//   ReqSingleChooseAssets copyWith({
//     String? userId,
//     String? specialities,
//     String? otherDetails,
//     String? email,
//     String? state,
//     String? city,
//     List<MultipartFile>? documents,
//
//     // MultipartFile? video,
//     // String? script,
//   }) =>
//       ReqSingleChooseAssets(
//         userId: userId ?? this.userId,
//         specialities: specialities ?? this.specialities,
//         otherDetails: otherDetails ?? this.otherDetails,
//         email: email ?? this.email,
//         state: state ?? this.state,
//         city: city ?? this.city,
//         documents: documents,
//
//         // video: video ?? this.video,
//         // script: script ?? this.script,
//       );
//
//   factory ReqSingleChooseAssets.fromMap(Map<String, dynamic> json) =>
//       ReqSingleChooseAssets(
//         userId: json["user_id"],
//         specialities: json["specialities"],
//         otherDetails: json["other_details"],
//         email: json["email"],
//         state: json["state"],
//         city: json["city"],
//         documents: json["documents"],
//
//         // video: json["specialities"],
//         // script: json["script"],
//       );
//
//   // Map<String, dynamic> toMap() => {
//   //       "proposal_id": proposalId,
//   //       "video": video,
//   //       "script": script,
//   //     };
//
//   FormData toFromData() {
//     FormData formData = FormData.fromMap({
//       "user_id": userId,
//       "specialities": specialities,
//       "other_details": otherDetails,
//       "email": email,
//       "state": state,
//       "city": city,
//       "documents": documents,
//
//       // "specialities": video,
//       // "script": script,
//     });
//     return formData;
//   }
// }





class ReqSingleUserAssets {
  // String token;
  // String name;
  // String description;
  // List productImage;
  // List? imageTemplate;
  // List? sourceFileList;
  // String categoryId;
  // String subCategoryId;
  // String subSubCategoryId;
  // String adminPrice;
  // String branchPrice;
  // String wholesalePrice;
  // String userPrice;
  // String variants;
  // String attributes;
  // String productCode;
  // int count;

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


        //
        // required this.name,
        // required this.token,
        // required this.description,
        // required this.productImage,
        // this.imageTemplate,
        // this.sourceFileList,
        // required this.categoryId,
        // required this.subCategoryId,
        // required this.subSubCategoryId,
        // required this.adminPrice,
        // required this.branchPrice,
        // required this.wholesalePrice,
        // required this.userPrice,
        // required this.variants,
        // required this.attributes,
        // required this.count,
        // required this.productCode
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


        // 'token': token,  3600*8=28,800 * 5 = driver
        // 'name': name,    3600*8=28,000
        // 'description': description,
        // 'product_image[]': productImage,
        // 'product_image_1[]': imageTemplate,
        // 'product_image_2[]': sourceFileList,
        // 'category_id': categoryId,
        // 'subcategory_id': subCategoryId,
        // 'subsubcategory_id': subSubCategoryId,
        // 'admin_price': adminPrice,
        // 'branch_price': branchPrice,
        // 'user_price': userPrice,
        // 'wholesale_price':wholesalePrice,
        // 'variants': variants,
        // 'attributes1': attributes,
        // 'count': count,
        // 'product_code': productCode
      };
}
