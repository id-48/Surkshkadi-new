import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:surakshakadi/data/model/home/dashboard/components/single_user_assets/req_single_user_assets.dart';
import 'package:surakshakadi/data/model/home/dashboard/components/single_user_assets/res_single_user_assets.dart';
import 'package:surakshakadi/data/model/home/dashboard/res_dashboard.dart';
import 'package:surakshakadi/repository/dashboard_repository.dart';
import 'package:surakshakadi/utils/constants/app_constant.dart';
import 'package:surakshakadi/utils/constants/loading_dialog.dart';


final dashboardProvider = StateNotifierProvider.autoDispose<DashboardViewModel,
    AsyncValue<ResDashboard>>((ref) => DashboardViewModel((ref.read)));

class DashboardViewModel extends StateNotifier<AsyncValue<ResDashboard>> {
  DashboardViewModel(this._reader) : super(const AsyncValue.loading());
  late final Reader _reader;

  late final DashboardRepository repositery =
      _reader(dashboardRepositoryProvider);

  Future<ResDashboard?> getDashboard({required BuildContext context}) async {
    final result = await repositery.getDashboard();
    return result.when(success: (result) async {
      state = AsyncValue.data(result);
      assetsData = result;
      return result;

    }, failure: (error) {
      throw error;
    });
  }

  Future<ResSingleUserAssets?> getSingleUserAssets(
      {required BuildContext context, required ReqSingleUserAssets data,}) async {
    showLoadingDialog(context: context);
    final result = await repositery.getSingleUserAssets(data);
    return result.when(
        success: (result) async {
          hideLoadingDialog(context: context);

          // displayToast(result.message.toString());
          //
          // navigationService.push(routeConfirmationSpecific);
          // // navigationService.push(routeAddInformationScreen,arguments: {navAISpecificAssets: "SpecificAssets"});

          return result;
        },
        failure: (error) {
          hideLoadingDialog(context: context);

        });
  }
}
