

import 'package:flutter/Material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:surakshakadi/data/model/home/channelPartner/store_partner_details/req_store_cp_details.dart';
import 'package:surakshakadi/data/model/home/channelPartner/store_partner_details/res_store_cp_details.dart';
import 'package:surakshakadi/repository/cp_details_respository.dart';

final storeCPDetailsProvider = StateNotifierProvider.autoDispose<StoreCPDetailsViewModel,
    AsyncValue<ResStoreCpDetails>>((ref) => StoreCPDetailsViewModel((ref.read)));

class StoreCPDetailsViewModel extends StateNotifier<AsyncValue<ResStoreCpDetails>> {
  StoreCPDetailsViewModel(this._reader) : super(const AsyncValue.loading());
  late final Reader _reader;

  late final StoreCPDetailsRepository repositery =
  _reader(StoreCPDetailsRepositoryProvider);



  Future<ResStoreCpDetails?> storeCPDetails(
      {required BuildContext context, required ReqStoreCPDetails data,}) async {
    final result = await repositery.storeCPDetails(data);

    print("test--------   ${result}");
    return result.when(
        success: (result) async {
          // hideLoadingDialog(context: context);
          // displayToast(result.message.toString());
          //
          // navigationService.push(routeConfirmationSpecific);
          // // navigationService.push(routeAddInformationScreen,arguments: {navAISpecificAssets: "SpecificAssets"});

          print("test--->> ${result.status}");
          return result;
        },
        failure: (error) {
          print('yashu patel>>>>>>> ${error}');
        });
  }
}
