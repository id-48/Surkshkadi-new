import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:surakshakadi/data/model/home/dashboard/profile_detail/res_profile.dart';
import 'package:surakshakadi/repository/profile_detail_repository.dart';


final profileDetailProvider = StateNotifierProvider.autoDispose<AcProfileViewModel,
    AsyncValue<ResProfileDetails>>((ref) => AcProfileViewModel((ref.read)));

class AcProfileViewModel extends StateNotifier<AsyncValue<ResProfileDetails>> {
  AcProfileViewModel(this._reader) : super(const AsyncValue.loading());
  late final Reader _reader;

  late final ProfileDetailRepository repositery =
  _reader(profileDetailRepositoryProvider);

  Future<ResProfileDetails?> getProfileDetail({required BuildContext context}) async {
    final result = await repositery.getProfileDetail();
    return result.when(success: (result) async {
      state = AsyncValue.data(result);

      return result;

    }, failure: (error) {
      throw error;
    });
  }


}
