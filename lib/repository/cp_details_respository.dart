import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:surakshakadi/data/datasource/app_dio.dart';
import 'package:surakshakadi/data/model/home/channelPartner/store_partner_details/req_store_cp_details.dart';
import 'package:surakshakadi/data/model/home/channelPartner/store_partner_details/res_store_cp_details.dart';
import 'package:surakshakadi/utils/constants/api_end_points.dart';

import '../data/model/result.dart';

abstract class CPdetailsRepository {
  Future<Result<ResStoreCpDetails>> postCPdetails(ReqStoreCPDetails data);
}
final CPdetailsRepositoryProvider =
Provider((ref) => CPdetailsRepositoryImpl(ref.read));
class CPdetailsRepositoryImpl implements CPdetailsRepository {
  final Reader _reader;

  CPdetailsRepositoryImpl(this._reader);
  late final Dio dio = _reader(dioProvider);

  @override
  Future<Result<ResStoreCpDetails>> postCPdetails(ReqStoreCPDetails data) {
    return Result.guardFuture(() async {
      return AppDio()
          .post(apiStoreCPdetails, data:  FormData.fromMap(await data.toJson()))
          .then((value) async {
        final data = ResStoreCpDetails.fromJson(value.data);
        return data;
      });
    }).catchError((error) {
      throw error;
    });
  }
}
