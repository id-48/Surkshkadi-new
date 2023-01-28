import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:surakshakadi/data/model/auth/otp/req_otp.dart';
import 'package:surakshakadi/data/model/auth/otp/res_otp.dart';
import 'package:surakshakadi/data/model/auth/verify_otp/req_verify_otp.dart';
import 'package:surakshakadi/data/model/auth/verify_otp/res_verify_otp.dart';
import 'package:surakshakadi/di/locator.dart';
import 'package:surakshakadi/repository/auth_respository.dart';
import 'package:surakshakadi/utils/constants/loading_dialog.dart';
import 'package:surakshakadi/utils/constants/navigation_route_constants.dart';
import 'package:surakshakadi/utils/constants/navigations_key_constant.dart';
import 'package:surakshakadi/utils/constants/preference_key_constant.dart';
import 'package:surakshakadi/utils/dialog_utils.dart';
import 'package:surakshakadi/utils/preference_utils.dart';

final authProvider = StateNotifierProvider<AuthViewModel, AsyncValue<ResOtp>>(
    (ref) => AuthViewModel((ref.read)));

class AuthViewModel extends StateNotifier<AsyncValue<ResOtp>> {
  AuthViewModel(this._reader) : super(const AsyncValue.loading());
  late final Reader _reader;

  late final AuthRepository repositery = _reader(authRepositoryProvider);




  Future<ResOtp?> logIn(
      {required BuildContext context, required ReqOtp data}) async {
    final result = await repositery.logIn(data);
    return result.when(
        success: (result) async {
          return result;
        },
        failure: (error) {});
  }



  Future<ResVerifyOtp?> verifyOtp(
      {required BuildContext context, required ReqVerifyOtp data}) async {
    showLoadingDialog(context: context);

    final result = await repositery.verifyOtp(data);
    return result.when(success: (result) async {
      hideLoadingDialog(context: context);
      return result;

    },
        failure: (error) {
          displayToast("${error.message}");
      // displayToast(error.response!.data["errors"][0]['code']);
    });
  }
}
