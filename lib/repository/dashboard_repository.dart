
import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:surakshakadi/data/datasource/app_dio.dart';
import 'package:surakshakadi/data/model/home/dashboard/components/single_user_assets/req_single_user_assets.dart';
import 'package:surakshakadi/data/model/home/dashboard/components/single_user_assets/res_single_user_assets.dart';
import 'package:surakshakadi/data/model/home/dashboard/how_it_work/how_it_work.dart';

import 'package:surakshakadi/data/model/home/dashboard/res_dashboard.dart';
import 'package:surakshakadi/utils/constants/api_end_points.dart';

import '../data/model/result.dart';


abstract class DashboardRepository {
  Future<Result<ResDashboard>> getDashboard();
  Future<Result<ResSingleUserAssets>> getSingleUserAssets(ReqSingleUserAssets data);
  Future<Result<ResHowItWork>> getHowItWork();

}

final dashboardRepositoryProvider =
Provider((ref) => DashboardRepositoryImpl(ref.read));

class DashboardRepositoryImpl implements DashboardRepository {
  DashboardRepositoryImpl(this._reader);

  final Reader _reader;

  late final Dio dio = _reader(dioProvider);


  @override
  Future<Result<ResDashboard>> getDashboard() {
    return Result.guardFuture(() async {
      return dio
          .get(apiDashboard)
          .then((value) async {
        final data = ResDashboard.fromJson(value.data);
        return data;
      });
    }).catchError((error) {
      throw error;
    });
  }



  @override
  Future<Result<ResSingleUserAssets>> getSingleUserAssets(ReqSingleUserAssets data) {
    return Result.guardFuture(() async {
      return AppDio()
          .multipartPost(apiSingleChooseAssets, data:  FormData.fromMap(data.toJson()))
          .then((value) async {
        final data = ResSingleUserAssets.fromJson(value.data);
        return data;
      });
    }).catchError((error) {
      throw error;
    });
  }



  @override
  Future<Result<ResHowItWork>> getHowItWork() {
    return Result.guardFuture(() async {
      return dio
          .get(apiHowItWork)
          .then((value) async {
        final data = ResHowItWork.fromJson(value.data);
        return data;
      });
    }).catchError((error) {
      throw error;
    });
  }





}
