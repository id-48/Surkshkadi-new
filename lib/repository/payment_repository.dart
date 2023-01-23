
import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:surakshakadi/data/datasource/app_dio.dart';
import 'package:surakshakadi/data/model/home/dashboard/payment/plan_chat_sub_payment/req_plan_chat_sub_payment.dart';
import 'package:surakshakadi/data/model/home/dashboard/payment/plan_chat_sub_payment/res_plan_chat_sub_payment.dart';

import 'package:surakshakadi/data/model/home/dashboard/payment/single_user_assets_payment/req_single_user_assets_payment.dart';
import 'package:surakshakadi/data/model/home/dashboard/payment/single_user_assets_payment/res_single_user_assets_payment.dart';
import 'package:surakshakadi/utils/constants/api_end_points.dart';

import '../data/model/result.dart';


abstract class PaymentRepository {

  Future<Result<ResSingleUaPayment>> singleUAPayment(ReqSingleUAPayment data);
  Future<Result<ResPlanChatSubPayment>> planChatSubPayment(ReqPlanChatSubPayment data);


}

final paymentRepositoryProvider =
Provider((ref) => PaymentRepositoryImpl(ref.read));

class PaymentRepositoryImpl implements PaymentRepository {
  PaymentRepositoryImpl(this._reader);

  final Reader _reader;

  late final Dio dio = _reader(dioProvider);



  @override
  Future<Result<ResSingleUaPayment>> singleUAPayment(ReqSingleUAPayment data) {
    return Result.guardFuture(() async {
      return AppDio()
          .multipartPost(apiSingleUAPayment, data:  FormData.fromMap(data.toJson()))
          .then((value) async {
        final data = ResSingleUaPayment.fromJson(value.data);
        return data;
      });
    }).catchError((error) {
      throw error;
    });
  }

  @override
  Future<Result<ResPlanChatSubPayment>> planChatSubPayment(ReqPlanChatSubPayment data) {
    return Result.guardFuture(() async {
      return AppDio()
          .multipartPost(apiPlanChatSubPayment, data:  FormData.fromMap(await data.toJson()))
          .then((value) async {
        final data = ResPlanChatSubPayment.fromJson(value.data);
        return data;
      });
    }).catchError((error) {
      throw error;
    });
  }







}
