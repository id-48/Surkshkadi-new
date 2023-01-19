

import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:surakshakadi/data/datasource/app_dio.dart';
import 'package:surakshakadi/data/model/home/dashboard/plan/res_plans.dart';
import 'package:surakshakadi/data/model/result.dart';
import 'package:surakshakadi/utils/constants/api_end_points.dart';

abstract class PlansRepository {
  Future<Result<ResPlans>> getPlans();
  // Future<Result<ResSingleUserAssets>> getSingleUserAssets(ReqSingleUserAssets data);

}

final plansRepositoryProvider =
Provider((ref) => PlansRepositoryImpl(ref.read));

class PlansRepositoryImpl implements PlansRepository {
  PlansRepositoryImpl(this._reader);

  final Reader _reader;

  late final Dio dio = _reader(dioProvider);


  @override
  Future<Result<ResPlans>> getPlans() {
    return Result.guardFuture(() async {
      return dio
          .get(apiPlans,
        // options: Options(headers: {"Authorization":getString(prefToken)})
      )
          .then((value) async {
        final data = ResPlans.fromJson(value.data);
        return data;
      });
    }).catchError((error) {
      throw error;
    });
  }





}
