
import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:surakshakadi/data/datasource/app_dio.dart';
import 'package:surakshakadi/data/model/home/dashboard/payment/plan_chat_sub_payment/req_plan_chat_sub_payment.dart';
import 'package:surakshakadi/data/model/home/dashboard/payment/plan_chat_sub_payment/res_plan_chat_sub_payment.dart';

import 'package:surakshakadi/data/model/home/dashboard/payment/single_user_assets_payment/req_single_user_assets_payment.dart';
import 'package:surakshakadi/data/model/home/dashboard/payment/single_user_assets_payment/res_single_user_assets_payment.dart';
import 'package:surakshakadi/data/model/home/dashboard/submit_kyc/req_submit_kyc.dart';
import 'package:surakshakadi/data/model/home/dashboard/submit_kyc/res_submit_kyc.dart';
import 'package:surakshakadi/utils/constants/api_end_points.dart';

import '../data/model/result.dart';


abstract class SubmitKycRepository {

  Future<Result<ResSubmitKyc>> submitKyc(ReqSubmitKyc data);

}

final submitKycRepositoryProvider =
Provider((ref) => SubmitKycRepositoryImpl(ref.read));

class SubmitKycRepositoryImpl implements SubmitKycRepository {
  SubmitKycRepositoryImpl(this._reader);

  final Reader _reader;

  late final Dio dio = _reader(dioProvider);



  @override
  Future<Result<ResSubmitKyc>> submitKyc(ReqSubmitKyc data) {
    return Result.guardFuture(() async {
      print("tests ---->> ${data.toJson()}");
      return AppDio()
          .multipartPost(apiSubmitKyc, data:  FormData.fromMap(data.toJson()),)
          .then((value) async {
        final data = ResSubmitKyc.fromJson(value.data);
        return data;
      });
    }).catchError((error) {
      throw error;
    });
  }


}
