
import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:surakshakadi/data/datasource/app_dio.dart';
import 'package:surakshakadi/data/model/home/dashboard/beneficiary/req_beneficiary.dart';
import 'package:surakshakadi/data/model/home/dashboard/beneficiary/res_beneficiary.dart';
import 'package:surakshakadi/data/model/home/dashboard/profile_detail/res_profile.dart';

import 'package:surakshakadi/data/model/home/dashboard/state_and_city/res_state.dart';
import 'package:surakshakadi/utils/constants/api_end_points.dart';

import '../data/model/result.dart';


abstract class ProfileDetailRepository {

  Future<Result<ResProfileDetails>> getProfileDetail();

}

final profileDetailRepositoryProvider =
Provider((ref) => ProfileDetailRepositoryImpl(ref.read));

class ProfileDetailRepositoryImpl implements ProfileDetailRepository {
  ProfileDetailRepositoryImpl(this._reader);

  final Reader _reader;

  late final Dio dio = _reader(dioProvider);


  @override
  Future<Result<ResProfileDetails>> getProfileDetail() {
    return Result.guardFuture(() async {
      return dio
          .get(apiProfile)
          .then((value) async {
        final data = ResProfileDetails.fromJson(value.data);
        return data;
      });
    }).catchError((error) {
      throw error;
    });
  }

}
