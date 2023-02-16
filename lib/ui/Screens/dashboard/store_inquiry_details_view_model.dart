import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:surakshakadi/data/model/home/dashboard/about_us/store_inquiry_details/req_store_inquiry_details.dart';
import 'package:surakshakadi/data/model/home/dashboard/about_us/store_inquiry_details/res_store_inquiry_details.dart';

import 'package:surakshakadi/data/model/home/dashboard/components/single_user_assets/req_single_user_assets.dart';
import 'package:surakshakadi/data/model/home/dashboard/components/single_user_assets/res_single_user_assets.dart';
import 'package:surakshakadi/data/model/home/dashboard/res_dashboard.dart';
import 'package:surakshakadi/data/model/home/dashboard/security_content/req_security_content.dart';
import 'package:surakshakadi/data/model/home/dashboard/security_content/res_security_content.dart';
import 'package:surakshakadi/repository/dashboard_repository.dart';
import 'package:surakshakadi/repository/security_content_repository.dart';
import 'package:surakshakadi/repository/store_inquiry_details_repository.dart';
import 'package:surakshakadi/utils/constants/app_constant.dart';
import 'package:surakshakadi/utils/constants/loading_dialog.dart';


final storeInquiryDetailsProvider = StateNotifierProvider.autoDispose<StoreInquiryDetailsViewModel,
    AsyncValue<ResStoreInquiryDetails>>((ref) => StoreInquiryDetailsViewModel((ref.read)));

class StoreInquiryDetailsViewModel extends StateNotifier<AsyncValue<ResStoreInquiryDetails>> {
  StoreInquiryDetailsViewModel(this._reader) : super(const AsyncValue.loading());
  late final Reader _reader;

  late final StoreInquiryDetailsRepository repositery =
  _reader(storeInquiryDetailsRepositoryProvider);

  Future<ResStoreInquiryDetails?> getStoreInquiryDetails(
      {required BuildContext context, required ReqStoreInquiryDetails data,}) async {
    showLoadingDialog(context: context);
    final result = await repositery.getStoreInquiryDetails(data);
    return result.when(
        success: (result) async {
          hideLoadingDialog(context: context);
          // displayToast(result.message.toString());
          //
          // navigationService.push(routeConfirmationSpecific);
          // // navigationService.push(routeAddInformationScreen,arguments: {navAISpecificAssets: "SpecificAssets"});

          return result;
        },
        failure: (error) {});
  }
}
