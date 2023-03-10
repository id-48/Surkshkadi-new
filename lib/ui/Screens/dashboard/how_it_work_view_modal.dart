import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:surakshakadi/data/model/home/dashboard/how_it_work/how_it_work.dart';
import 'package:surakshakadi/repository/dashboard_repository.dart';
import 'package:surakshakadi/utils/constants/loading_dialog.dart';


final howItWorkProvider = StateNotifierProvider.autoDispose<HowItWorkViewModel,
    AsyncValue<ResHowItWork>>((ref) => HowItWorkViewModel((ref.read)));

class HowItWorkViewModel extends StateNotifier<AsyncValue<ResHowItWork>> {
  HowItWorkViewModel(this._reader) : super(const AsyncValue.loading());
  late final Reader _reader;

  late final DashboardRepository repositery =
  _reader(dashboardRepositoryProvider);

  Future<ResHowItWork?> getHowItWork({required BuildContext context}) async {
showLoadingDialog(context: context);
    final result = await repositery.getHowItWork();
    return result.when(success: (result) async {
      state = AsyncValue.data(result);
      hideLoadingDialog(context: context);

      return result;

    }, failure: (error) {
      hideLoadingDialog(context: context);

      throw error;
    });
  }


}
