import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:surakshakadi/data/model/home/dashboard/about_us/store_inquiry_details/req_store_inquiry_details.dart';
import 'package:surakshakadi/data/model/home/dashboard/about_us/store_inquiry_details/res_store_inquiry_details.dart';
import 'package:surakshakadi/repository/store_inquiry_details_repository.dart';
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
          return result;
        },
        failure: (error) {hideLoadingDialog(context: context);});
  }
}
