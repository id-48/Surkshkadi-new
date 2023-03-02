

import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:surakshakadi/data/datasource/app_dio.dart';
import 'package:surakshakadi/data/model/home/chatboat/pincode_state_city/res_pincode_state_city.dart';
import 'package:surakshakadi/utils/constants/api_end_points.dart';

import '../data/model/result.dart';

abstract class PincodeSCRepository {
  Future<Result<List<ResPincodeStateCity>>> getPincodeStateCity(String pinCodeData);


}

final pincodeSCRepositoryProvider =
Provider((ref) => PincodeSCRepositoryImpl(ref.read));

class PincodeSCRepositoryImpl implements PincodeSCRepository {
  PincodeSCRepositoryImpl(this._reader);

  final Reader _reader;

  late final Dio dio = _reader(dioProvider);


  @override
  Future<Result<List<ResPincodeStateCity>>> getPincodeStateCity(String pinCodeData) {
    List<ResPincodeStateCity> pincodeSC = [];

    return Result.guardFuture(() async {
      return dio
          .get("${apiPincodeSC}${pinCodeData}")
          .then((value) async {

            for(int i = 0; i< value.data.length; i ++){
              pincodeSC.add(ResPincodeStateCity.fromJson(value.data[i]));
            }
        // final data = ResPincodeStateCity.fromJson(value.data);

        return pincodeSC;
      });
    }).catchError((error) {
      throw error;
    });
  }



}
