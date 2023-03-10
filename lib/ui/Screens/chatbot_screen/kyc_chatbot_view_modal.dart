

import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:surakshakadi/data/model/home/chatboat/kyc_chatbot/req_kyc_chatbot.dart';
import 'package:surakshakadi/data/model/home/chatboat/kyc_chatbot/res_kyc_chatbot.dart';
import 'package:surakshakadi/repository/kyc_chatbot_repository.dart';
import 'package:surakshakadi/utils/constants/loading_dialog.dart';



final kycChatBotProvider = StateNotifierProvider.autoDispose<KycChatBotViewModel, AsyncValue<ResKycChatBot>>(
        (ref) => KycChatBotViewModel((ref.read)));

class KycChatBotViewModel extends StateNotifier<AsyncValue<ResKycChatBot>> {
  KycChatBotViewModel(this._reader) : super(const AsyncValue.loading());
  late final Reader _reader;

  late final KYCChatBotRepository repositery = _reader(kYCChatBotRepositoryProvider);

  Future<ResKycChatBot?> kycChatBot(
      {required BuildContext context, required ReqKycChatBot data,}) async {

    showLoadingDialog(context: context);
    final result = await repositery.kycChatBot(data);

    return result.when(
        success: (result) async {
          hideLoadingDialog(context: context);
          return result;
        },
        failure: (error) {
          hideLoadingDialog(context: context);
        });
  }


}


