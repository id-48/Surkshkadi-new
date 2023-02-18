




import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:surakshakadi/data/model/home/chatboat/plan_chat_update/req_plan_chat_update.dart';
import 'package:surakshakadi/data/model/home/chatboat/plan_chat_update/res_plan_chat_update.dart';
import 'package:surakshakadi/repository/planchat_repository.dart';
import 'package:surakshakadi/utils/constants/loading_dialog.dart';

final planChatUpdateProvider = StateNotifierProvider.autoDispose<PlanChatUpdateViewModel, AsyncValue<ResPlanChatUpdate>>(
        (ref) => PlanChatUpdateViewModel((ref.read)));

class PlanChatUpdateViewModel extends StateNotifier<AsyncValue<ResPlanChatUpdate>> {
  PlanChatUpdateViewModel(this._reader) : super(const AsyncValue.loading());
  late final Reader _reader;

  late final PlanChatRepository repositery = _reader(planChatRepositoryProvider);

  Future<ResPlanChatUpdate?> getPlanChatUpdate(
      {required BuildContext context, required ReqPlanChatUpdate data,}) async {
    showLoadingDialog(context: context);
    final result = await repositery.getPlanChatUpdate(data);
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


