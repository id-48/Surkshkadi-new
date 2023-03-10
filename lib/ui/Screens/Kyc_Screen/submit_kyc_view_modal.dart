



import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:surakshakadi/data/model/home/dashboard/submit_kyc/req_submit_kyc.dart';
import 'package:surakshakadi/data/model/home/dashboard/submit_kyc/res_submit_kyc.dart';
import 'package:surakshakadi/repository/submit_kyc_repository.dart';
import 'package:surakshakadi/utils/constants/loading_dialog.dart';
import 'package:surakshakadi/utils/dialog_utils.dart';

final submitKycProvider = StateNotifierProvider<SubmitKycViewModel, AsyncValue<ResSubmitKyc>>(
        (ref) => SubmitKycViewModel((ref.read)));

class SubmitKycViewModel extends StateNotifier<AsyncValue<ResSubmitKyc>> {


  SubmitKycViewModel(this._reader) : super(const AsyncValue.loading());
  late final Reader _reader;

  late final SubmitKycRepository repositery = _reader(submitKycRepositoryProvider);

  Future<ResSubmitKyc?> submitKyc(
      {required BuildContext context, required ReqSubmitKyc data}) async {
    showLoadingDialog(context: context);
    final result = await repositery.submitKyc(data);
    return result.when(
        success: (result) async {

          state= AsyncValue.data(result);
          hideLoadingDialog(context: context);
          return result;
        },
        failure: (error) {
          displayToast(error.message);
          hideLoadingDialog(context: context);


        }
    );
  }

}