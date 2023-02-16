
import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:surakshakadi/data/datasource/app_dio.dart';
import 'package:surakshakadi/data/model/home/dashboard/components/single_user_assets/req_single_user_assets.dart';
import 'package:surakshakadi/data/model/home/dashboard/components/single_user_assets/res_single_user_assets.dart';
import 'package:surakshakadi/data/model/home/dashboard/how_it_work/how_it_work.dart';

import 'package:surakshakadi/data/model/home/dashboard/res_dashboard.dart';
import 'package:surakshakadi/data/model/home/dashboard/security_content/req_security_content.dart';
import 'package:surakshakadi/data/model/home/dashboard/security_content/res_security_content.dart';
import 'package:surakshakadi/utils/constants/api_end_points.dart';

import '../data/model/result.dart';


abstract class SecurityContentRepository {
  Future<Result<ResSecurityContent>> getSecurityContent(ReqSecurityContent data);

}

final securityContentRepositoryProvider =
Provider((ref) => SecurityContentRepositoryImpl(ref.read));

class SecurityContentRepositoryImpl implements SecurityContentRepository {
  SecurityContentRepositoryImpl(this._reader);

  final Reader _reader;

  late final Dio dio = _reader(dioProvider);



  @override
  Future<Result<ResSecurityContent>> getSecurityContent(ReqSecurityContent data) {
    return Result.guardFuture(() async {
      return AppDio()
          .multipartPost(apiSecurityContent, data:  FormData.fromMap(data.toJson()))
          .then((value) async {
        final data = ResSecurityContent.fromJson(value.data);
        return data;
      });
    }).catchError((error) {
      throw error;
    });
  }






}
