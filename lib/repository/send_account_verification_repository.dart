
import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:surakshakadi/data/datasource/app_dio.dart';
import 'package:surakshakadi/data/model/home/channelPartner/start_partners/Res_send_account_verification.dart';
import 'package:surakshakadi/data/model/home/channelPartner/start_partners/req_send_account_verification.dart';
import 'package:surakshakadi/data/model/home/dashboard/components/single_user_assets/req_single_user_assets.dart';
import 'package:surakshakadi/data/model/home/dashboard/components/single_user_assets/res_single_user_assets.dart';
import 'package:surakshakadi/data/model/home/dashboard/how_it_work/how_it_work.dart';

import 'package:surakshakadi/data/model/home/dashboard/res_dashboard.dart';
import 'package:surakshakadi/data/model/home/dashboard/security_content/req_security_content.dart';
import 'package:surakshakadi/data/model/home/dashboard/security_content/res_security_content.dart';
import 'package:surakshakadi/utils/constants/api_end_points.dart';

import '../data/model/result.dart';


abstract class SendAccountVerificationRepository {
  Future<Result<ResSendAccountVerification>> getSendAccountVerification(ReqSendAccountVerification data);

}

final sendAccountVerificationRepositoryProvider =
Provider((ref) => SendAccountVerificationRepositoryImpl(ref.read));

class SendAccountVerificationRepositoryImpl implements SendAccountVerificationRepository {
  SendAccountVerificationRepositoryImpl(this._reader);

  final Reader _reader;

  late final Dio dio = _reader(dioProvider);



  @override
  Future<Result<ResSendAccountVerification>> getSendAccountVerification(ReqSendAccountVerification data) {
    return Result.guardFuture(() async {
      return AppDio()
          .multipartPost(apiSendAccountVerification, data:  FormData.fromMap(data.toJson()))
          .then((value) async {
        final data = ResSendAccountVerification.fromJson(value.data);
        return data;
      });
    }).catchError((error) {
      throw error;
    });
  }






}
