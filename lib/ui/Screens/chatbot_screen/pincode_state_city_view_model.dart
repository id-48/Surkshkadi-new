

import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:surakshakadi/data/model/home/chatboat/pincode_state_city/res_pincode_state_city.dart';
import 'package:surakshakadi/repository/pincode_repository.dart';
import 'package:surakshakadi/utils/constants/loading_dialog.dart';
import 'package:surakshakadi/utils/dialog_utils.dart';



final pincodeSCProvider = StateNotifierProvider.autoDispose<PincodeSCViewModel, AsyncValue<ResPincodeStateCity>>(
        (ref) => PincodeSCViewModel((ref.read)));

class PincodeSCViewModel extends StateNotifier<AsyncValue<ResPincodeStateCity>> {
  PincodeSCViewModel(this._reader) : super(const AsyncValue.loading());
  late final Reader _reader;

  late final PincodeSCRepository repositery = _reader(pincodeSCRepositoryProvider);

  Future<List<ResPincodeStateCity>?> getPincodeStateCity({required BuildContext context,required String pinCodeData}) async {
    showLoadingDialog(context: context);
    final result = await repositery.getPincodeStateCity(pinCodeData);
    return result.when(
        success: (result) async {
          hideLoadingDialog(context: context);
          // state = AsyncValue.data(result);
          return result;
        },
        failure: (error) {
          hideLoadingDialog(context: context);
          displayToast(error.message.toString());
          return null;
        });
  }


}


