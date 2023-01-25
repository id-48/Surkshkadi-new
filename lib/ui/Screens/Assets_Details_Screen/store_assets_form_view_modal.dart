import 'package:flutter/Material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:surakshakadi/data/model/home/dashboard/assets_details/get_selected_assets/req_get_selected_assets.dart';
import 'package:surakshakadi/data/model/home/dashboard/assets_details/get_selected_assets/res_get_selected_assets.dart';
import 'package:surakshakadi/data/model/home/dashboard/assets_details/store_assets_form_details/req_store_assets_form_details.dart';
import 'package:surakshakadi/data/model/home/dashboard/assets_details/store_assets_form_details/res_store_assets_form_details.dart';
import 'package:surakshakadi/repository/store_repository.dart';


final storeAssetsFormProvider = StateNotifierProvider<StoreAssetsFormDetailsViewModel, AsyncValue<ResStoreAssetsFormDetails>>(
        (ref) => StoreAssetsFormDetailsViewModel((ref.read)));

class StoreAssetsFormDetailsViewModel extends StateNotifier<AsyncValue<ResStoreAssetsFormDetails>> {


  StoreAssetsFormDetailsViewModel(this._reader) : super(const AsyncValue.loading());
  late final Reader _reader;

  late final StoreRepository repositery = _reader(storeRepositoryProvider);

  Future<ResStoreAssetsFormDetails?> assetsFormDetails(
      {required BuildContext context, required ReqStoreAssetsFormDetails data}) async {
    final result = await repositery.assetsFormDetails(data);
    return result.when(
        success: (result) async {
          // state= AsyncValue.data(result);
          return result;
        },
        failure: (error) {}
    );
  }

}

final getSelectedAssetsProvider = StateNotifierProvider<GetSelectedAssetsViewModel, AsyncValue<ResGetSelectedAssets>>(
        (ref) => GetSelectedAssetsViewModel((ref.read)));

class GetSelectedAssetsViewModel extends StateNotifier<AsyncValue<ResGetSelectedAssets>> {


  GetSelectedAssetsViewModel(this._reader) : super(const AsyncValue.loading());
  late final Reader _reader;

  late final StoreRepository repositery = _reader(storeRepositoryProvider);

  Future<ResGetSelectedAssets?> getSelectedAssets(
      {required BuildContext context, required ReqGetSelectedAssets data}) async {
    final result = await repositery.getSelectedAssets(data);
    return result.when(
        success: (result) async {
          state= AsyncValue.data(result);
          return result;
        },
        failure: (error) {}
    );
  }

}

