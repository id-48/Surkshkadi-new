import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:surakshakadi/data/model/home/dashboard/how_it_work/how_it_work.dart';
import 'package:surakshakadi/data/model/home/dashboard/res_dashboard.dart';
import 'package:surakshakadi/di/locator.dart';
import 'package:surakshakadi/repository/dashboard_repository.dart';
import 'package:surakshakadi/utils/color_utils.dart';
import 'package:surakshakadi/utils/constants/app_constant.dart';
import 'package:surakshakadi/utils/constants/loading_dialog.dart';
import 'package:surakshakadi/utils/constants/navigation_route_constants.dart';
import 'package:surakshakadi/utils/constants/preference_key_constant.dart';
import 'package:surakshakadi/utils/dialog_utils.dart';
import 'package:surakshakadi/utils/preference_utils.dart';

import '../../../utils/constants/navigations_key_constant.dart';


final howItWorkProvider = StateNotifierProvider.autoDispose<HowItWorkViewModel,
    AsyncValue<ResHowItWork>>((ref) => HowItWorkViewModel((ref.read)));

class HowItWorkViewModel extends StateNotifier<AsyncValue<ResHowItWork>> {
  HowItWorkViewModel(this._reader) : super(const AsyncValue.loading());
  late final Reader _reader;

  late final DashboardRepository repositery =
  _reader(dashboardRepositoryProvider);

  Future<ResHowItWork?> getHowItWork({required BuildContext context}) async {
    final result = await repositery.getHowItWork();
    return result.when(success: (result) async {
      state = AsyncValue.data(result);

      return result;

    }, failure: (error) {
      throw error;
    });
  }


}
