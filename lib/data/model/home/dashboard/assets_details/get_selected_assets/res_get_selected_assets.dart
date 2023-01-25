// import 'dart:convert';
//
// ResGetSelectedAssets resGetSelectedAssetsFromJson(String str) => ResGetSelectedAssets.fromJson(json.decode(str));
//
// String resGetSelectedAssetsToJson(ResGetSelectedAssets data) => json.encode(data.toJson());
//
// class ResGetSelectedAssets {
//   ResGetSelectedAssets({
//     required this.status,
//     required this.message,
//     required this.response,
//   });
//
//   int status;
//   String message;
//   List<Response> response;
//
//   factory ResGetSelectedAssets.fromJson(Map<String, dynamic> json) => ResGetSelectedAssets(
//     status: json["status"],
//     message: json["message"],
//     response: List<Response>.from(json["response"].map((x) => Response.fromJson(x))),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "status": status,
//     "message": message,
//     "response": List<dynamic>.from(response.map((x) => x.toJson())),
//   };
// }
//
// class Response {
//   Response({
//     required this.assetCategory,
//     required this.categoryBoxColor,
//     required this.selectedAssets,
//   });
//
//   String assetCategory;
//   String categoryBoxColor;
//   List<SelectedAsset> selectedAssets;
//
//   factory Response.fromJson(Map<String, dynamic> json) => Response(
//     assetCategory: json["asset_category"],
//     categoryBoxColor: json["category_box_color"],
//     selectedAssets: List<SelectedAsset>.from(json["selected_assets"].map((x) => SelectedAsset.fromJson(x))),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "asset_category": assetCategory,
//     "category_box_color": categoryBoxColor,
//     "selected_assets": List<dynamic>.from(selectedAssets.map((x) => x.toJson())),
//   };
// }
//
// class SelectedAsset {
//   SelectedAsset({
//     required this.subscriptionAssetId,
//     required this.assetId,
//     required this.assetName,
//   });
//
//   String subscriptionAssetId;
//   String assetId;
//   String assetName;
//
//   factory SelectedAsset.fromJson(Map<String, dynamic> json) => SelectedAsset(
//     subscriptionAssetId: json["subscription_asset_id"],
//     assetId: json["asset_id"],
//     assetName: json["asset_name"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "subscription_asset_id": subscriptionAssetId,
//     "asset_id": assetId,
//     "asset_name": assetName,
//   };
// }




import 'dart:convert';

ResGetSelectedAssets resGetSelectedAssetsFromJson(String str) => ResGetSelectedAssets.fromJson(json.decode(str));

String resGetSelectedAssetsToJson(ResGetSelectedAssets data) => json.encode(data.toJson());

class ResGetSelectedAssets {
  ResGetSelectedAssets({
    required this.status,
    required this.message,
    required this.response,
  });

  int status;
  String message;
  List<Response> response;

  factory ResGetSelectedAssets.fromJson(Map<String, dynamic> json) => ResGetSelectedAssets(
    status: json["status"],
    message: json["message"],
    response: List<Response>.from(json["response"].map((x) => Response.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "response": List<dynamic>.from(response.map((x) => x.toJson())),
  };
}

class Response {
  Response({
    required this.assetCategory,
    required this.categoryImage,
    required this.categoryBoxColor,
    required this.selectedAssets,
  });

  String assetCategory;
  String categoryImage;
  String categoryBoxColor;
  List<SelectedAsset> selectedAssets;

  factory Response.fromJson(Map<String, dynamic> json) => Response(
    assetCategory: json["asset_category"],
    categoryImage: json["category_image"],
    categoryBoxColor: json["category_box_color"],
    selectedAssets: List<SelectedAsset>.from(json["selected_assets"].map((x) => SelectedAsset.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "asset_category": assetCategory,
    "category_image": categoryImage,
    "category_box_color": categoryBoxColor,
    "selected_assets": List<dynamic>.from(selectedAssets.map((x) => x.toJson())),
  };
}

class SelectedAsset {
  SelectedAsset({
    required this.subscriptionAssetId,
    required this.assetId,
    required this.assetName,
    required this.formStatus,
  });

  String subscriptionAssetId;
  String assetId;
  String assetName;
  String formStatus;

  factory SelectedAsset.fromJson(Map<String, dynamic> json) => SelectedAsset(
    subscriptionAssetId: json["subscription_asset_id"],
    assetId: json["asset_id"],
    assetName: json["asset_name"],
    formStatus: json["form_status"],
  );

  Map<String, dynamic> toJson() => {
    "subscription_asset_id": subscriptionAssetId,
    "asset_id": assetId,
    "asset_name": assetName,
    "form_status": formStatus,
  };
}



