// class ResChooseAssets {
//   bool? status;
//   String? message;
//   Data? data;
//
//   ResChooseAssets({this.status, this.message, this.data});
//
//   ResChooseAssets.fromJson(Map<String, dynamic> json) {
//     status = json['status'];
//     message = json['message'];
//     data = json['data'] != null ? new Data.fromJson(json['data']) : null;
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['status'] = this.status;
//     data['message'] = this.message;
//     if (this.data != null) {
//       data['data'] = this.data!.toJson();
//     }
//     return data;
//   }
// }
//
// class Data {
//   List<dynamic>? bankingInsurance;
//   List<dynamic>? utility;
//   List<dynamic>? govermentSchemes;
//   List<dynamic>? invesments;
//   List<dynamic>? immovable;
//   List<dynamic>? personal;
//   List<dynamic>? companyGST;
//
//   Data(
//       {this.bankingInsurance,
//         this.utility,
//         this.govermentSchemes,
//         this.invesments,
//         this.immovable,
//         this.personal,
//         this.companyGST});
//
//   Data.fromJson(Map<String, dynamic> json) {
//     bankingInsurance = json['Banking_Insurance'];
//     utility = json['Utility'];
//     govermentSchemes = json['Goverment_Schemes'];
//     invesments = json['Invesments'];
//     immovable = json['Immovable'];
//     personal = json['Personal'];
//     companyGST = json['Company_GST'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['Banking_Insurance'] = this.bankingInsurance;
//     data['Utility'] = this.utility;
//     data['Goverment_Schemes'] = this.govermentSchemes;
//     data['Invesments'] = this.invesments;
//     data['Immovable'] = this.immovable;
//     data['Personal'] = this.personal;
//     data['Company_GST'] = this.companyGST;
//     return data;
//   }
// }




import 'dart:convert';

ResSingleUserAssets resSingleUserAssetsFromJson(String str) => ResSingleUserAssets.fromJson(json.decode(str));

String resSingleUserAssetsToJson(ResSingleUserAssets data) => json.encode(data.toJson());

class ResSingleUserAssets {
  ResSingleUserAssets({
    required this.status,
    required this.message,
    required this.response,
  });

  int status;
  String message;
  Response response;

  factory ResSingleUserAssets.fromJson(Map<String, dynamic> json) => ResSingleUserAssets(
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
    required this.singleUserAssetId,
  });

  int singleUserAssetId;

  factory Response.fromJson(Map<String, dynamic> json) => Response(
    singleUserAssetId: json["single_user_asset_id"],
  );

  Map<String, dynamic> toJson() => {
    "single_user_asset_id": singleUserAssetId,
  };
}


