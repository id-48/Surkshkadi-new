import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:surakshakadi/data/model/home/channelPartner/clients/get_clients/req_get_client.dart';
import 'package:surakshakadi/data/model/home/channelPartner/clients/get_clients/res_get_client.dart';
import 'package:surakshakadi/repository/client_respository.dart';



final clientProvider = StateNotifierProvider<ClientViewModel, AsyncValue<ResGetClient>>(
        (ref) => ClientViewModel((ref.read)));

class ClientViewModel extends StateNotifier<AsyncValue<ResGetClient>> {


  ClientViewModel(this._reader) : super(const AsyncValue.loading());
  late final Reader _reader;

  late final ClientRepository repositery = _reader(clientRepositoryProvider);

  Future<ResGetClient?> getClient(
      {required BuildContext context, required ReqGetClient data}) async {
    final result = await repositery.getClient(data);
    return result.when(
        success: (result) async {
          state= AsyncValue.data(result);
          return result;
        },
        failure: (error) {}
    );
  }

}