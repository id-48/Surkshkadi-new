import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:surakshakadi/data/model/home/dashboard/beneficiary/req_beneficiary.dart';
import 'package:surakshakadi/data/model/home/dashboard/beneficiary/res_beneficiary.dart';

import 'package:surakshakadi/data/model/home/dashboard/state_and_city/res_state.dart';
import 'package:surakshakadi/data/model/home/dashboard/will_document/req_will_documnet.dart';
import 'package:surakshakadi/data/model/home/dashboard/will_document/res_will_documnet.dart';
import 'package:surakshakadi/di/locator.dart';
import 'package:surakshakadi/repository/will_document_repository.dart';
import 'package:surakshakadi/utils/constants/loading_dialog.dart';
import 'package:surakshakadi/utils/constants/navigation_route_constants.dart';
import 'package:surakshakadi/utils/dialog_utils.dart';


import '../../../repository/beneficiary_repository.dart';


final willDocumentProvider = StateNotifierProvider.autoDispose<WillDocumentViewModel,
    AsyncValue<ResWillDocument>>((ref) => WillDocumentViewModel((ref.read)));

class WillDocumentViewModel extends StateNotifier<AsyncValue<ResWillDocument>> {
  WillDocumentViewModel(this._reader) : super(const AsyncValue.loading());
  late final Reader _reader;

  late final WillDocumentRepository repositery =
  _reader(willDocumentRepositoryProvider);

  Future<ResWillDocument?> postWillDocument({required BuildContext context ,required ReqWillDocument data}) async {
    showLoadingDialog(context: context);
    final result = await repositery.postWillDocument(data);
    return result.when(success: (result) async {
      displayToast(result.message);
      hideLoadingDialog(context: context);
      navigationService.push(routeWillReviewIssueDetail);
      return result;

    }, failure: (error) {
      hideLoadingDialog(context: context);
      throw error;
    });
  }

}






