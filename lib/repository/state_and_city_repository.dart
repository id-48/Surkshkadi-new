
import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:surakshakadi/data/datasource/app_dio.dart';
import 'package:surakshakadi/data/model/home/dashboard/state_and_city/city/req_city.dart';
import 'package:surakshakadi/data/model/home/dashboard/state_and_city/city/res_city.dart';
import 'package:surakshakadi/data/model/home/dashboard/state_and_city/res_state.dart';
import 'package:surakshakadi/utils/constants/api_end_points.dart';

import '../data/model/result.dart';


abstract class StateAndCityRepository {

  Future<Result<ResState>> getState();
  Future<Result<ResCity>> getCity(ReqCity data);



}

final stateAndCityRepositoryProvider =
Provider((ref) => StateAndCityRepositoryImpl(ref.read));

class StateAndCityRepositoryImpl implements StateAndCityRepository {
  StateAndCityRepositoryImpl(this._reader);

  final Reader _reader;

  late final Dio dio = _reader(dioProvider);


  @override
  Future<Result<ResState>> getState() {
    return Result.guardFuture(() async {
      return dio
          .get(apiState)
          .then((value) async {
        final data = ResState.fromJson(value.data);
        return data;
      });
    }).catchError((error) {
      throw error;
    });
  }




  @override
  Future<Result<ResCity>> getCity(ReqCity data) {
    return Result.guardFuture(() async {
      return AppDio()
          .multipartPost(apiCity, data:  FormData.fromMap(data.toJson()))
          .then((value) async {
        final data = ResCity.fromJson(value.data);
        return data;
      });
    }).catchError((error) {
      throw error;
    });
  }









}
