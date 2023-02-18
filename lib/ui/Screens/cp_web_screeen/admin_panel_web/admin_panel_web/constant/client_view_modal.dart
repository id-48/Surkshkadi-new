import 'package:flutter/Material.dart';
import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:surakshakadi/data/model/home/channelPartner/clients/add_cp_clients/req_add_client.dart';
import 'package:surakshakadi/data/model/home/channelPartner/clients/add_cp_clients/res_add_client.dart';
import 'package:surakshakadi/data/model/home/channelPartner/clients/get_cp_clients/req_get_client.dart';
import 'package:surakshakadi/data/model/home/channelPartner/clients/get_cp_clients/res_get_client.dart';
import 'package:surakshakadi/data/model/home/channelPartner/clients/get_cp_rewards/req_get_rewards.dart';
import 'package:surakshakadi/data/model/home/channelPartner/clients/get_cp_rewards/res_get_rewards.dart';
import 'package:surakshakadi/data/model/home/channelPartner/clients/get_cp_subscribed_clients/req_get_subscribed_client.dart';
import 'package:surakshakadi/data/model/home/channelPartner/clients/get_cp_subscribed_clients/res_get_subscribed_client.dart';
import 'package:surakshakadi/repository/client_respository.dart';
import 'package:surakshakadi/ui/Screens/cp_web_screeen/admin_panel_web/admin_panel_web/dashboard_screen.dart';
import 'package:surakshakadi/utils/constants/loading_dialog.dart';



  final getClientProvider = StateNotifierProvider<GetClientViewModel, AsyncValue<ResGetClient>>(
        (ref) => GetClientViewModel((ref.read)));

class GetClientViewModel extends StateNotifier<AsyncValue<ResGetClient>> {


  GetClientViewModel(this._reader) : super(const AsyncValue.loading());
  late final Reader _reader;

  late final ClientRepository repositery = _reader(clientRepositoryProvider);

  Future<ResGetClient?> getClient(
      {required BuildContext context, required ReqGetClient data}) async {

    showLoadingDialog(context: context);
    final result = await repositery.getClient(data);
    return result.when(
        success: (result) async {
          hideLoadingDialog(context: context);
          state= AsyncValue.data(result);
          return result;
        },
        failure: (error) {
          hideLoadingDialog(context: context);
        }
    );
  }

}


final addClientProvider = StateNotifierProvider<AddClientViewModel, AsyncValue<ResAddClient>>(
        (ref) => AddClientViewModel((ref.read)));

class AddClientViewModel extends StateNotifier<AsyncValue<ResAddClient>> {


  AddClientViewModel(this._reader) : super(const AsyncValue.loading());
  late final Reader _reader;

  late final ClientRepository repositery = _reader(clientRepositoryProvider);

  Future<ResAddClient?> addClient(
      {required BuildContext context, required ReqAddClient data}) async {
    showLoadingDialog(context: context);
    final result = await repositery.addClient(data);
    return result.when(
        success: (result) async {
          hideLoadingDialog(context: context);
          Navigator.push(context, MaterialPageRoute(builder: (context) => AdminDashboard()));
          state= AsyncValue.data(result);
          return result;
        },
        failure: (error) {
          hideLoadingDialog(context: context);
        }
    );
  }

}


final getSubscribedClientProvider = StateNotifierProvider<GetSubscribedClientViewModel, AsyncValue<ResGetSubscribedClient>>(
        (ref) => GetSubscribedClientViewModel((ref.read)));

class GetSubscribedClientViewModel extends StateNotifier<AsyncValue<ResGetSubscribedClient>> {
  GetSubscribedClientViewModel(this._reader) : super(const AsyncValue.loading());
  late final Reader _reader;

  late final ClientRepository repositery = _reader(clientRepositoryProvider);

  Future<ResGetSubscribedClient?> getSubscribedClient(
      {required BuildContext context, required ReqGetSubscribedClient data}) async {
    showLoadingDialog(context: context);
    final result = await repositery.getSubscribedClient(data);
    return result.when(
        success: (result) async {
          hideLoadingDialog(context: context);
          // Navigator.push(context, MaterialPageRoute(builder: (context) => AdminDashboard()));
          state= AsyncValue.data(result);
          return result;
        },
        failure: (error) {
          hideLoadingDialog(context: context);
        }
    );
  }

}


final getRewardsProvider = StateNotifierProvider<GetRewardsViewModel, AsyncValue<ResGetRewards>>(
        (ref) => GetRewardsViewModel((ref.read)));

class GetRewardsViewModel extends StateNotifier<AsyncValue<ResGetRewards>> {
  GetRewardsViewModel(this._reader) : super(const AsyncValue.loading());
  late final Reader _reader;

  late final ClientRepository repositery = _reader(clientRepositoryProvider);

  Future<ResGetRewards?> getRewards(
      {required BuildContext context, required ReqGetRewards data}) async {
    showLoadingDialog(context: context);
    final result = await repositery.getRewards(data);
    return result.when(
        success: (result) async {
          hideLoadingDialog(context: context);
          // Navigator.push(context, MaterialPageRoute(builder: (context) => AdminDashboard()));
          state= AsyncValue.data(result);
          return result;
        },
        failure: (error) {
          hideLoadingDialog(context: context);

        }
    );
  }

}



