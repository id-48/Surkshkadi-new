
import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:surakshakadi/data/datasource/app_dio.dart';
import 'package:surakshakadi/data/model/home/chatboat/kyc_chatbot/req_kyc_chatbot.dart';
import 'package:surakshakadi/data/model/home/chatboat/kyc_chatbot/res_kyc_chatbot.dart';
import 'package:surakshakadi/data/model/home/chatboat/kyc_chatbot_update/req_update_second_chatbot.dart';
import 'package:surakshakadi/data/model/home/chatboat/kyc_chatbot_update/res_update_second_chatbot.dart';
import 'package:surakshakadi/data/model/home/chatboat/plan_chat/req_plan_chatbot.dart';
import 'package:surakshakadi/data/model/home/chatboat/plan_chat/res_plan_chatbot.dart';
import 'package:surakshakadi/data/model/home/chatboat/plan_chat_update/req_plan_chat_update.dart';
import 'package:surakshakadi/data/model/home/chatboat/plan_chat_update/res_plan_chat_update.dart';

import 'package:surakshakadi/utils/constants/api_end_points.dart';

import '../data/model/result.dart';


abstract class KYCChatBotRepository {

  Future<Result<ResKycChatBot>> kycChatBot(ReqKycChatBot data);
  Future<Result<ResUpdateSecondChatBot>> postUpdateSecondChatBot(ReqUpdateSecondChatBot data);

}

final kYCChatBotRepositoryProvider =
Provider((ref) => KYCChatBotRepositoryImpl(ref.read));

class KYCChatBotRepositoryImpl implements KYCChatBotRepository {
  KYCChatBotRepositoryImpl(this._reader);

  final Reader _reader;

  late final Dio dio = _reader(dioProvider);


  @override
  Future<Result<ResKycChatBot>> kycChatBot(ReqKycChatBot data) {
    return Result.guardFuture(() async {
      return AppDio().multipartPost(apiKycChatBot, data:  FormData.fromMap(data.toJson())).then((value) async {
        // return dio.post(apiPlanChatBot, data: data.toJson()).then((value) async {

        final data = ResKycChatBot.fromJson(value.data);
        return data;
      });
    }).catchError((error) {
      throw error;
    });
  }

  @override
  Future<Result<ResUpdateSecondChatBot>> postUpdateSecondChatBot(ReqUpdateSecondChatBot data) {
    return Result.guardFuture(() async {
      return AppDio().multipartPost(apiUpdateSecondChatBoat, data:  FormData.fromMap(data.toJson())).then((value) async {


        final data = ResUpdateSecondChatBot.fromJson(value.data);
        return data;
      });
    }).catchError((error) {
      throw error;
    });
  }





}
