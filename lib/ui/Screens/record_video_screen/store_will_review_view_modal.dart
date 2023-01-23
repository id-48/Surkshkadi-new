import 'package:flutter/Material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:surakshakadi/data/model/home/dashboard/store_will_review_details/req_store_will_review_details.dart';
import 'package:surakshakadi/data/model/home/dashboard/store_will_review_details/res_store_will_review_details.dart';
import 'package:surakshakadi/repository/store_repository.dart';


final storeWillReviewProvider = StateNotifierProvider<StoreWillReviewDetailsViewModel, AsyncValue<ResStoreWillReviewDetails>>(
        (ref) => StoreWillReviewDetailsViewModel((ref.read)));

class StoreWillReviewDetailsViewModel extends StateNotifier<AsyncValue<ResStoreWillReviewDetails>> {


  StoreWillReviewDetailsViewModel(this._reader) : super(const AsyncValue.loading());
  late final Reader _reader;

  late final StoreRepository repositery = _reader(storeRepositoryProvider);

  Future<ResStoreWillReviewDetails?> willReviewVideo(
      {required BuildContext context, required ReqStoreWillReviewDetails data}) async {
    final result = await repositery.willReviewVideo(data);
    return result.when(
        success: (result) async {
          // state= AsyncValue.data(result);
          return result;
        },
        failure: (error) {}
    );
  }

}