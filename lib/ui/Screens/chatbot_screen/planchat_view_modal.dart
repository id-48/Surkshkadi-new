

import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:surakshakadi/data/model/home/chatboat/plan_chat/req_plan_chatbot.dart';
import 'package:surakshakadi/data/model/home/chatboat/plan_chat/res_plan_chatbot.dart';
import 'package:surakshakadi/repository/planchat_repository.dart';
import 'package:surakshakadi/utils/constants/loading_dialog.dart';



final planChatProvider = StateNotifierProvider.autoDispose<PlanChatViewModel, AsyncValue<ResPlanChatBot>>(
        (ref) => PlanChatViewModel((ref.read)));

class PlanChatViewModel extends StateNotifier<AsyncValue<ResPlanChatBot>> {
  PlanChatViewModel(this._reader) : super(const AsyncValue.loading());
  late final Reader _reader;

  late final PlanChatRepository repositery = _reader(planChatRepositoryProvider);

  Future<ResPlanChatBot?> planChatBotSub(
      {required BuildContext context, required ReqPlanChatBot data,}) async {
    showLoadingDialog(context: context);
    final result = await repositery.planChatBotSub(data);
    return result.when(
        success: (result) async {
          hideLoadingDialog(context: context);
          return result;
        },
        failure: (error) {});
  }


}


