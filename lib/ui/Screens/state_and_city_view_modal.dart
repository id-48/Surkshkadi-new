import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:surakshakadi/data/model/home/dashboard/components/single_user_assets/req_single_user_assets.dart';
import 'package:surakshakadi/data/model/home/dashboard/components/single_user_assets/res_single_user_assets.dart';
import 'package:surakshakadi/data/model/home/dashboard/res_dashboard.dart';
import 'package:surakshakadi/data/model/home/dashboard/state_and_city/city/req_city.dart';
import 'package:surakshakadi/data/model/home/dashboard/state_and_city/city/res_city.dart';
import 'package:surakshakadi/data/model/home/dashboard/state_and_city/res_state.dart';
import 'package:surakshakadi/di/locator.dart';
import 'package:surakshakadi/repository/dashboard_repository.dart';
import 'package:surakshakadi/repository/state_and_city_repository.dart';
import 'package:surakshakadi/utils/color_utils.dart';
import 'package:surakshakadi/utils/constants/app_constant.dart';
import 'package:surakshakadi/utils/constants/loading_dialog.dart';
import 'package:surakshakadi/utils/constants/navigation_route_constants.dart';
import 'package:surakshakadi/utils/constants/preference_key_constant.dart';
import 'package:surakshakadi/utils/dialog_utils.dart';
import 'package:surakshakadi/utils/preference_utils.dart';

import '../../../utils/constants/navigations_key_constant.dart';


final stateProvider = StateNotifierProvider.autoDispose<StateViewModel,
    AsyncValue<ResState>>((ref) => StateViewModel((ref.read)));

class StateViewModel extends StateNotifier<AsyncValue<ResState>> {
  StateViewModel(this._reader) : super(const AsyncValue.loading());
  late final Reader _reader;

  late final StateAndCityRepository repositery =
  _reader(stateAndCityRepositoryProvider);

  Future<ResState?> getState({required BuildContext context}) async {
    final result = await repositery.getState();
    return result.when(success: (result) async {
      // state = AsyncValue.data(result);

      return result;

    }, failure: (error) {
      throw error;
    });
  }

}



final cityProvider = StateNotifierProvider<CityViewModel, AsyncValue<ResCity>>(
        (ref) => CityViewModel((ref.read)));

class CityViewModel extends StateNotifier<AsyncValue<ResCity>> {


  CityViewModel(this._reader) : super(const AsyncValue.loading());
  late final Reader _reader;

  late final StateAndCityRepository repositery = _reader(stateAndCityRepositoryProvider);

  Future<ResCity?> getCity(
      {required BuildContext context, required ReqCity data}) async {
    final result = await repositery.getCity(data);
    return result.when(
        success: (result) async {
          // state = AsyncValue.data(result);

          return result;
        },
        failure: (error) {}
    );
  }

}


