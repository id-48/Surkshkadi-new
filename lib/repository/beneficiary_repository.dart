
import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:surakshakadi/data/datasource/app_dio.dart';
import 'package:surakshakadi/data/model/home/dashboard/beneficiary/req_beneficiary.dart';
import 'package:surakshakadi/data/model/home/dashboard/beneficiary/res_beneficiary.dart';

import 'package:surakshakadi/data/model/home/dashboard/state_and_city/res_state.dart';
import 'package:surakshakadi/utils/constants/api_end_points.dart';

import '../data/model/result.dart';


abstract class BeneficiaryRepository {

  Future<Result<ResBeneficiary>> postBeneficiary(ReqBeneficiary data);




}

final beneficiaryRepositoryProvider =
Provider((ref) => BeneficiaryRepositoryImpl(ref.read));

class BeneficiaryRepositoryImpl implements BeneficiaryRepository {
  BeneficiaryRepositoryImpl(this._reader);

  final Reader _reader;

  late final Dio dio = _reader(dioProvider);


  @override

  Future<Result<ResBeneficiary>> postBeneficiary(ReqBeneficiary data) {
    return Result.guardFuture(() async {
      return AppDio()
          .multipartPost(apiBeneficiaryDetails, data:  FormData.fromMap(data.toJson()))
          .then((value) async {
        final data = ResBeneficiary.fromJson(value.data);
        return data;
      });
    }).catchError((error) {
      throw error;
    });
  }

















}
