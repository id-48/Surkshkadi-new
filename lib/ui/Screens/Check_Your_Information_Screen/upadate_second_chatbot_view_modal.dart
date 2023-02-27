import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:surakshakadi/data/model/home/chatboat/kyc_chatbot_update/req_update_second_chatbot.dart';
import 'package:surakshakadi/data/model/home/chatboat/kyc_chatbot_update/res_update_second_chatbot.dart';
import 'package:surakshakadi/data/model/home/chatboat/plan_chat_update/req_plan_chat_update.dart';
import 'package:surakshakadi/data/model/home/chatboat/plan_chat_update/res_plan_chat_update.dart';
import 'package:surakshakadi/repository/kyc_chatbot_repository.dart';
import 'package:surakshakadi/repository/planchat_repository.dart';
import 'package:surakshakadi/utils/constants/loading_dialog.dart';

final UpdateSecondChatBoatProvider = StateNotifierProvider.autoDispose<UpdateSecondChatBoatViewModel, AsyncValue<ResPlanChatUpdate>>(
        (ref) => UpdateSecondChatBoatViewModel((ref.read)));

class UpdateSecondChatBoatViewModel extends StateNotifier<AsyncValue<ResUpdateSecondChatBot>> {
  UpdateSecondChatBoatViewModel(this._reader) : super(const AsyncValue.loading());
  late final Reader _reader;

  late final KYCChatBotRepository repositery = _reader(kYCChatBotRepositoryProvider);

  Future<ResUpdateSecondChatBot?> postUpdateSecondChatBot(
      {required BuildContext context, required ReqUpdateSecondChatBot data,}) async {
    showLoadingDialog(context: context);
    final result = await repositery.postUpdateSecondChatBot(data);
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