
import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:surakshakadi/data/datasource/app_dio.dart';
import 'package:surakshakadi/data/model/home/dashboard/assets_details/get_selected_assets/req_get_selected_assets.dart';
import 'package:surakshakadi/data/model/home/dashboard/assets_details/get_selected_assets/res_get_selected_assets.dart';
import 'package:surakshakadi/data/model/home/dashboard/assets_details/store_assets_form_details/req_store_assets_form_details.dart';
import 'package:surakshakadi/data/model/home/dashboard/assets_details/store_assets_form_details/res_store_assets_form_details.dart';
import 'package:surakshakadi/data/model/home/dashboard/payment/plan_chat_sub_payment/req_plan_chat_sub_payment.dart';
import 'package:surakshakadi/data/model/home/dashboard/payment/plan_chat_sub_payment/res_plan_chat_sub_payment.dart';

import 'package:surakshakadi/data/model/home/dashboard/payment/single_user_assets_payment/req_single_user_assets_payment.dart';
import 'package:surakshakadi/data/model/home/dashboard/payment/single_user_assets_payment/res_single_user_assets_payment.dart';
import 'package:surakshakadi/data/model/home/dashboard/store_will_review_details/req_store_will_review_details.dart';
import 'package:surakshakadi/data/model/home/dashboard/store_will_review_details/res_store_will_review_details.dart';
import 'package:surakshakadi/data/model/home/dashboard/submit_kyc/req_submit_kyc.dart';
import 'package:surakshakadi/data/model/home/dashboard/submit_kyc/res_submit_kyc.dart';
import 'package:surakshakadi/utils/constants/api_end_points.dart';

import '../data/model/result.dart';


abstract class StoreRepository {

  Future<Result<ResStoreWillReviewDetails>> willReviewVideo(ReqStoreWillReviewDetails data);
  Future<Result<ResStoreAssetsFormDetails>> assetsFormDetails(ReqStoreAssetsFormDetails data);
  Future<Result<ResGetSelectedAssets>> getSelectedAssets(ReqGetSelectedAssets data);

}

final storeRepositoryProvider =
Provider((ref) => StoreRepositoryImpl(ref.read));

class StoreRepositoryImpl implements StoreRepository {
  StoreRepositoryImpl(this._reader);

  final Reader _reader;

  late final Dio dio = _reader(dioProvider);



  @override
  Future<Result<ResStoreWillReviewDetails>> willReviewVideo(ReqStoreWillReviewDetails data) {
    return Result.guardFuture(() async {
      print("tests ---->> ${data.toJson()}");
      return AppDio()
          .multipartPost(apiStoreWillReviewDetails, data:  FormData.fromMap(data.toJson()),)
          .then((value) async{
            print("print responsev   ------>>>> ${value.data}");
            print("print responsev   ------>>>> ${value.redirects}");
        final data = ResStoreWillReviewDetails.fromJson(value.data);
        return data;
      });
    }).catchError((error) {
      print("print responsev   ------>>>>1111");
      throw error;
    });
  }


  @override
  Future<Result<ResStoreAssetsFormDetails>> assetsFormDetails(ReqStoreAssetsFormDetails data) {
    return Result.guardFuture(() async {
      print("tests111 ---->> ${data.toJson()}");

      return AppDio()
          .multipartPost(apiAssetsFormDetails, data:  FormData.fromMap(data.toJson()),)
          .then((value) async{
        final data = ResStoreAssetsFormDetails.fromJson(value.data);
        return data;
      });
    }).catchError((error) {
      throw error;
    });
  }

  @override
  Future<Result<ResGetSelectedAssets>> getSelectedAssets(ReqGetSelectedAssets data) {
    return Result.guardFuture(() async {
      return AppDio()
          .multipartPost(apiGetSelectedAssets, data:  FormData.fromMap(data.toJson()),)
          .then((value) async{
        final data = ResGetSelectedAssets.fromJson(value.data);
        return data;
      });
    }).catchError((error) {
      throw error;
    });
  }



}
