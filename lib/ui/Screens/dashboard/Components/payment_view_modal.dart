import 'package:flutter/material.dart';
import 'package:riverpod/riverpod.dart';
import 'package:surakshakadi/data/model/home/dashboard/payment/plan_chat_sub_payment/req_plan_chat_sub_payment.dart';
import 'package:surakshakadi/data/model/home/dashboard/payment/plan_chat_sub_payment/res_plan_chat_sub_payment.dart';
import 'package:surakshakadi/data/model/home/dashboard/payment/single_user_assets_payment/req_single_user_assets_payment.dart';
import 'package:surakshakadi/data/model/home/dashboard/payment/single_user_assets_payment/res_single_user_assets_payment.dart';
import 'package:surakshakadi/repository/payment_repository.dart';
import 'package:surakshakadi/utils/constants/loading_dialog.dart';





final singleUAPaymentProvider = StateNotifierProvider<SingleUAPaymentViewModel, AsyncValue<ResSingleUaPayment>>(
        (ref) => SingleUAPaymentViewModel((ref.read)));

class SingleUAPaymentViewModel extends StateNotifier<AsyncValue<ResSingleUaPayment>> {


  SingleUAPaymentViewModel(this._reader) : super(const AsyncValue.loading());
  late final Reader _reader;

  late final PaymentRepository repositery = _reader(paymentRepositoryProvider);

  Future<ResSingleUaPayment?> singleUAPayment(
      {required BuildContext context, required ReqSingleUAPayment data}) async {

    showLoadingDialog(context: context);
    final result = await repositery.singleUAPayment(data);
    return result.when(
        success: (result) async {
          hideLoadingDialog(context: context);
          // displayToast(result.message);
          return result;
        },
        failure: (error) {
          hideLoadingDialog(context: context);
        }
    );
  }

}




final planChatSubPaymentProvider = StateNotifierProvider<PlanChatSubPaymentViewModel, AsyncValue<ResPlanChatSubPayment>>(
        (ref) => PlanChatSubPaymentViewModel((ref.read)));

class PlanChatSubPaymentViewModel extends StateNotifier<AsyncValue<ResPlanChatSubPayment>> {


  PlanChatSubPaymentViewModel(this._reader) : super(const AsyncValue.loading());
  late final Reader _reader;

  late final PaymentRepository repositery = _reader(paymentRepositoryProvider);

  Future<ResPlanChatSubPayment?> planChatSubPayment(
      {required BuildContext context, required ReqPlanChatSubPayment data}) async {
    showLoadingDialog(context: context);
    final result = await repositery.planChatSubPayment(data);
    return result.when(
        success: (result) async {
          state= AsyncValue.data(result);
          hideLoadingDialog(context: context);
          // displayToast(result.message);
          return result;
        },
        failure: (error) {
          hideLoadingDialog(context: context);
        }
    );
  }

}


