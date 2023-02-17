import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:surakshakadi/data/model/home/dashboard/components/single_user_assets/req_single_user_assets.dart';
import 'package:surakshakadi/data/model/home/dashboard/components/single_user_assets/res_single_user_assets.dart';
import 'package:surakshakadi/data/model/home/dashboard/res_dashboard.dart';
import 'package:surakshakadi/data/model/home/dashboard/security_content/req_security_content.dart';
import 'package:surakshakadi/data/model/home/dashboard/security_content/res_security_content.dart';
import 'package:surakshakadi/repository/dashboard_repository.dart';
import 'package:surakshakadi/repository/security_content_repository.dart';
import 'package:surakshakadi/utils/constants/app_constant.dart';
import 'package:surakshakadi/utils/constants/loading_dialog.dart';


final securityContentProvider = StateNotifierProvider.autoDispose<SecurityContentViewModel,
    AsyncValue<ResSecurityContent>>((ref) => SecurityContentViewModel((ref.read)));

class SecurityContentViewModel extends StateNotifier<AsyncValue<ResSecurityContent>> {
  SecurityContentViewModel(this._reader) : super(const AsyncValue.loading());
  late final Reader _reader;

  late final SecurityContentRepository repositery =
  _reader(securityContentRepositoryProvider);

  Future<ResSecurityContent?> getSecurityContent(
      {required BuildContext context, required ReqSecurityContent data,}) async {
    showLoadingDialog(context: context);
    final result = await repositery.getSecurityContent(data);
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
