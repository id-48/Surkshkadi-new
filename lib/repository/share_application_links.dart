
import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:surakshakadi/data/datasource/app_dio.dart';
import 'package:surakshakadi/data/model/home/dashboard/components/single_user_assets/req_single_user_assets.dart';
import 'package:surakshakadi/data/model/home/dashboard/components/single_user_assets/res_single_user_assets.dart';
import 'package:surakshakadi/data/model/home/dashboard/how_it_work/how_it_work.dart';

import 'package:surakshakadi/data/model/home/dashboard/res_dashboard.dart';
import 'package:surakshakadi/data/model/home/dashboard/security_content/req_security_content.dart';
import 'package:surakshakadi/data/model/home/dashboard/security_content/res_security_content.dart';
import 'package:surakshakadi/data/model/home/dashboard/share_application_links/req_share_application_links.dart';
import 'package:surakshakadi/data/model/home/dashboard/share_application_links/res_share_application_links.dart';
import 'package:surakshakadi/utils/constants/api_end_points.dart';

import '../data/model/result.dart';


abstract class ShareApplicationLinksRepository {
  Future<Result<ResShareApplicationLinks>> getShareApplicationLinks(ReqShareApplicationLinks data);

}

final shareApplicationLinksRepositoryProvider =
Provider((ref) => ShareApplicationLinksRepositoryImpl(ref.read));

class ShareApplicationLinksRepositoryImpl implements ShareApplicationLinksRepository {
  ShareApplicationLinksRepositoryImpl(this._reader);

  final Reader _reader;

  late final Dio dio = _reader(dioProvider);



  @override
  Future<Result<ResShareApplicationLinks>> getShareApplicationLinks(ReqShareApplicationLinks data) {
    return Result.guardFuture(() async {
      return AppDio()
          .multipartPost(apiShareApplicationLinks, data:  FormData.fromMap(data.toJson()))
          .then((value) async {
        final data = ResShareApplicationLinks.fromJson(value.data);
        return data;
      });
    }).catchError((error) {
      throw error;
    });
  }






}
