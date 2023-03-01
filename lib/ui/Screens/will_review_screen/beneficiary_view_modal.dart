import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:surakshakadi/data/model/home/dashboard/beneficiary/req_beneficiary.dart';
import 'package:surakshakadi/data/model/home/dashboard/beneficiary/res_beneficiary.dart';

import 'package:surakshakadi/data/model/home/dashboard/state_and_city/res_state.dart';
import 'package:surakshakadi/utils/constants/loading_dialog.dart';
import 'package:surakshakadi/utils/dialog_utils.dart';


import '../../../repository/beneficiary_repository.dart';


final beneficiaryProvider = StateNotifierProvider.autoDispose<BeneficiaryViewModel,
    AsyncValue<ResBeneficiary>>((ref) => BeneficiaryViewModel((ref.read)));

class BeneficiaryViewModel extends StateNotifier<AsyncValue<ResBeneficiary>> {
  BeneficiaryViewModel(this._reader) : super(const AsyncValue.loading());
  late final Reader _reader;

  late final BeneficiaryRepository repositery =
  _reader(beneficiaryRepositoryProvider);

  Future<ResBeneficiary?> postBeneficiary({required BuildContext context ,required ReqBeneficiary data}) async {
    showLoadingDialog(context: context);
    final result = await repositery.postBeneficiary(data);
    return result.when(success: (result) async {
      displayToast(result.message);
      hideLoadingDialog(context: context);
      return result;

    }, failure: (error) {
      hideLoadingDialog(context: context);
      throw error;
    });
  }

}






