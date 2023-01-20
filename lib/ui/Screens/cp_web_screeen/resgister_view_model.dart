

import 'package:flutter/Material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:surakshakadi/data/model/home/channelPartner/store_partner_details/req_store_cp_details.dart';
import 'package:surakshakadi/data/model/home/channelPartner/store_partner_details/res_store_cp_details.dart';
import 'package:surakshakadi/repository/cp_details_respository.dart';

final cpDetailsProvider = StateNotifierProvider.autoDispose<CPdetailsViewModel,
    AsyncValue<ResStoreCpDetails>>((ref) => CPdetailsViewModel((ref.read)));

class CPdetailsViewModel extends StateNotifier<AsyncValue<ResStoreCpDetails>> {
  CPdetailsViewModel(this._reader) : super(const AsyncValue.loading());
  late final Reader _reader;

  late final CPdetailsRepository repositery =
  _reader(CPdetailsRepositoryProvider);



  Future<ResStoreCpDetails?> postCPdetails(
      {required BuildContext context, required ReqStoreCPDetails data,}) async {
    final result = await repositery.postCPdetails(data);

    return result.when(
        success: (result) async {
          // hideLoadingDialog(context: context);
          // displayToast(result.message.toString());
          //
          // navigationService.push(routeConfirmationSpecific);
          // // navigationService.push(routeAddInformationScreen,arguments: {navAISpecificAssets: "SpecificAssets"});

          return result;
        },
        failure: (error) {});
  }
}
