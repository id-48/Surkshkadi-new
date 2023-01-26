import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:surakshakadi/data/datasource/app_dio.dart';
import 'package:surakshakadi/data/model/home/channelPartner/clients/add_cp_clients/req_add_client.dart';
import 'package:surakshakadi/data/model/home/channelPartner/clients/add_cp_clients/res_add_client.dart';
import 'package:surakshakadi/data/model/home/channelPartner/clients/get_cp_clients/req_get_client.dart';
import 'package:surakshakadi/data/model/home/channelPartner/clients/get_cp_clients/res_get_client.dart';
import 'package:surakshakadi/data/model/home/channelPartner/clients/get_cp_rewards/req_get_rewards.dart';
import 'package:surakshakadi/data/model/home/channelPartner/clients/get_cp_subscribed_clients/req_get_subscribed_client.dart';
import 'package:surakshakadi/data/model/home/channelPartner/clients/get_cp_subscribed_clients/res_get_subscribed_client.dart';
import 'package:surakshakadi/data/model/home/channelPartner/clients/get_cp_rewards/res_get_rewards.dart';
import 'package:surakshakadi/utils/constants/api_end_points.dart';
import '../data/model/result.dart';

abstract class ClientRepository {
  Future<Result<ResGetClient>> getClient(ReqGetClient data);
  Future<Result<ResAddClient>> addClient(ReqAddClient data);
  Future<Result<ResGetSubscribedClient>> getSubscribedClient(ReqGetSubscribedClient data);
  Future<Result<ResGetRewards>> getRewards(ReqGetRewards data);
}

final clientRepositoryProvider =
    Provider((ref) => clientRepositoryImpl(ref.read));

class clientRepositoryImpl implements ClientRepository {
  clientRepositoryImpl(this._reader);

  final Reader _reader;

  late final Dio dio = _reader(dioProvider);

  @override
  Future<Result<ResGetClient>> getClient(ReqGetClient data) {
    return Result.guardFuture(() async {
      return AppDio()
          .multipartPost(apiGetClient, data: FormData.fromMap(data.toJson()))
          .then((value) async {
        final data = ResGetClient.fromJson(value.data);

        return data;
      });
    }).catchError((error) {
      throw error;
    });
  }


  @override
  Future<Result<ResAddClient>> addClient(ReqAddClient data) {
    return Result.guardFuture(() async {
      return AppDio()
          .multipartPost(apiAddClient, data: FormData.fromMap(data.toJson()))
          .then((value) async {
        final data = ResAddClient.fromJson(value.data);

        return data;
      });
    }).catchError((error) {
      throw error;
    });
  }

  @override
  Future<Result<ResGetSubscribedClient>> getSubscribedClient(ReqGetSubscribedClient data) {
    return Result.guardFuture(() async {
      return AppDio()
          .multipartPost(apiSubscribedClient, data: FormData.fromMap(data.toJson()))
          .then((value) async {
        final data = ResGetSubscribedClient.fromJson(value.data);

        return data;
      });
    }).catchError((error) {
      throw error;
    });
  }


  @override
  Future<Result<ResGetRewards>> getRewards(ReqGetRewards data) {
    return Result.guardFuture(() async {
      return AppDio()
          .multipartPost(apiRewards, data: FormData.fromMap(data.toJson()))
          .then((value) async {
        final data = ResGetRewards.fromJson(value.data);

        return data;
      });
    }).catchError((error) {
      throw error;
    });
  }


}
