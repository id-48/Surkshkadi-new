


import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:surakshakadi/data/model/home/dashboard/plan/res_plans.dart';
import 'package:surakshakadi/repository/plans_repository.dart';

final plansProvider = StateNotifierProvider.autoDispose<PlansViewModel,
    AsyncValue<ResPlans>>((ref) => PlansViewModel((ref.read)));

class PlansViewModel extends StateNotifier<AsyncValue<ResPlans>> {
  PlansViewModel(this._reader) : super(const AsyncValue.loading());
  late final Reader _reader;

  late final PlansRepository repositery =
  _reader(plansRepositoryProvider);

  Future<ResPlans?> getPlans({required BuildContext context}) async {
    final result = await repositery.getPlans();
    return result.when(success: (result) async {

      state = AsyncValue.data(result);

      // return result;

    }, failure: (error) {
      throw error;
    });
  }



}
