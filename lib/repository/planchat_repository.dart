
import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:surakshakadi/data/datasource/app_dio.dart';
import 'package:surakshakadi/data/model/home/chatboat/plan_chat/req_plan_chatbot.dart';
import 'package:surakshakadi/data/model/home/chatboat/plan_chat/res_plan_chatbot.dart';
import 'package:surakshakadi/data/model/home/chatboat/plan_chat_update/req_plan_chat_update.dart';
import 'package:surakshakadi/data/model/home/chatboat/plan_chat_update/res_plan_chat_update.dart';

import 'package:surakshakadi/utils/constants/api_end_points.dart';

import '../data/model/result.dart';


abstract class PlanChatRepository {

  Future<Result<ResPlanChatBot>> planChatBotSub(ReqPlanChatBot data);
  Future<Result<ResPlanChatUpdate>> getPlanChatUpdate(ReqPlanChatUpdate data);
}

final planChatRepositoryProvider =
Provider((ref) => PlanChatRepositoryImpl(ref.read));

class PlanChatRepositoryImpl implements PlanChatRepository {
  PlanChatRepositoryImpl(this._reader);

  final Reader _reader;

  late final Dio dio = _reader(dioProvider);


  @override
  Future<Result<ResPlanChatBot>> planChatBotSub(ReqPlanChatBot data) {
    return Result.guardFuture(() async {
      return AppDio().multipartPost(apiPlanChatBot, data:  FormData.fromMap(await data.toJson())).then((value) async {
      // return dio.post(apiPlanChatBot, data: data.toJson()).then((value) async {

        final data = ResPlanChatBot.fromJson(value.data);
        return data;
      });
    }).catchError((error) {
      throw error;
    });
  }


  @override
  Future<Result<ResPlanChatUpdate>> getPlanChatUpdate(ReqPlanChatUpdate data) {
    return Result.guardFuture(() async {
      return AppDio().multipartPost(apiPlanChatUpdate, data:  FormData.fromMap(await data.toJson())).then((value) async {
        final data = ResPlanChatUpdate.fromJson(value.data);
        return data;
      });
    }).catchError((error) {
      throw error;
    });
  }




}
