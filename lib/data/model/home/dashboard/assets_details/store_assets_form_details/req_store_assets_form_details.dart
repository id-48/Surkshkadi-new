//
// class ReqStoreAssetsFormDetails {
//
//
//   int subscriptionAssetId;
//   List<Map<String,dynamic>> formDetails;
//   List assetDocuments;
//
//   // List<ReqVariants> variants;
//
//   ReqStoreAssetsFormDetails(
//       {
//
//       required  this.subscriptionAssetId,
//       required  this.formDetails,
//       required  this.assetDocuments,
//
//
//       });
//
//   Map<String, dynamic> toJson() =>
//       {
//
//         "subscription_asset_id": subscriptionAssetId,
//         "form_details": formDetails,
//         "asset_documents": assetDocuments,
//
//
//       };
// }



import 'dart:convert';

ReqStoreAssetsFormDetails reqStoreAssetsFormDetailsFromJson(String str) => ReqStoreAssetsFormDetails.fromJson(json.decode(str));

String reqStoreAssetsFormDetailsToJson(ReqStoreAssetsFormDetails data) => json.encode(data.toJson());

class ReqStoreAssetsFormDetails {
  ReqStoreAssetsFormDetails({
    required this.subscriptionAssetId,
    required this.formDetails,
    required this.assetDocuments,
  });

  int subscriptionAssetId;
  List<dynamic> formDetails;
  List<dynamic> assetDocuments;

  factory ReqStoreAssetsFormDetails.fromJson(Map<String, dynamic> json) => ReqStoreAssetsFormDetails(
    subscriptionAssetId: json["subscription_asset_id"],
    formDetails: List<dynamic>.from(json["form_details"].map((x) => x)),
    assetDocuments: List<dynamic>.from(json["asset_documents"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "subscription_asset_id": subscriptionAssetId,
    "form_details": List<dynamic>.from(formDetails.map((x) => x)),
    "asset_documents": List<dynamic>.from(assetDocuments.map((x) => x)),
  };
}
