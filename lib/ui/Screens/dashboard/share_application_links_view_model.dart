import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:surakshakadi/data/model/home/dashboard/share_application_links/req_share_application_links.dart';
import 'package:surakshakadi/data/model/home/dashboard/share_application_links/res_share_application_links.dart';
import 'package:surakshakadi/repository/share_application_links.dart';
import 'package:surakshakadi/utils/constants/loading_dialog.dart';
import 'package:surakshakadi/utils/dialog_utils.dart';


final shareApplicationLinksProvider = StateNotifierProvider.autoDispose<ShareApplicationLinksViewModel,
    AsyncValue<ResShareApplicationLinks>>((ref) => ShareApplicationLinksViewModel((ref.read)));

class ShareApplicationLinksViewModel extends StateNotifier<AsyncValue<ResShareApplicationLinks>> {
  ShareApplicationLinksViewModel(this._reader) : super(const AsyncValue.loading());
  late final Reader _reader;

  late final ShareApplicationLinksRepository repositery =
  _reader(shareApplicationLinksRepositoryProvider);

  Future<ResShareApplicationLinks?> getShareApplicationLinks(
      {required BuildContext context, required ReqShareApplicationLinks data,}) async {
    showLoadingDialog(context: context);
    final result = await repositery.getShareApplicationLinks(data);
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
          displayToast(error.message);
        });
  }
}
