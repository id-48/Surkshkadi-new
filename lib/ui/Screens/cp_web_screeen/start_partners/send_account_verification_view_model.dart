import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:surakshakadi/data/model/home/channelPartner/start_partners/Res_send_account_verification.dart';
import 'package:surakshakadi/data/model/home/channelPartner/start_partners/req_send_account_verification.dart';

import 'package:surakshakadi/data/model/home/dashboard/components/single_user_assets/req_single_user_assets.dart';
import 'package:surakshakadi/data/model/home/dashboard/components/single_user_assets/res_single_user_assets.dart';
import 'package:surakshakadi/data/model/home/dashboard/res_dashboard.dart';
import 'package:surakshakadi/data/model/home/dashboard/security_content/req_security_content.dart';
import 'package:surakshakadi/data/model/home/dashboard/security_content/res_security_content.dart';
import 'package:surakshakadi/repository/dashboard_repository.dart';
import 'package:surakshakadi/repository/security_content_repository.dart';
import 'package:surakshakadi/repository/send_account_verification_repository.dart';
import 'package:surakshakadi/utils/constants/app_constant.dart';
import 'package:surakshakadi/utils/constants/loading_dialog.dart';


final sendAccountVerificationProvider = StateNotifierProvider.autoDispose<SendAccountVerificationViewModel,
    AsyncValue<ResSendAccountVerification>>((ref) => SendAccountVerificationViewModel((ref.read)));

class SendAccountVerificationViewModel extends StateNotifier<AsyncValue<ResSendAccountVerification>> {
  SendAccountVerificationViewModel(this._reader) : super(const AsyncValue.loading());
  late final Reader _reader;

  late final SendAccountVerificationRepository repositery =
  _reader(sendAccountVerificationRepositoryProvider);

  Future<ResSendAccountVerification?> getSendAccountVerification(
      {required BuildContext context, required ReqSendAccountVerification data,}) async {
    showLoadingDialog(context: context);
    final result = await repositery.getSendAccountVerification(data);
    return result.when(
        success: (result) async {
          hideLoadingDialog(context: context);
          // displayToast(result.message.toString());
          //
          // navigationService.push(routeConfirmationSpecific);
          // // navigationService.push(routeAddInformationScreen,arguments: {navAISpecificAssets: "SpecificAssets"});

          return result;
        },
        failure: (error) {});
  }
}
