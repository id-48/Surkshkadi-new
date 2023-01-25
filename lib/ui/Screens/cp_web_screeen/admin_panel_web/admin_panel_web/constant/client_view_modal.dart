import 'package:flutter/Material.dart';
import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:surakshakadi/data/model/home/channelPartner/clients/add_clients/req_add_client.dart';
import 'package:surakshakadi/data/model/home/channelPartner/clients/add_clients/res_add_client.dart';
import 'package:surakshakadi/data/model/home/channelPartner/clients/get_clients/req_get_client.dart';
import 'package:surakshakadi/data/model/home/channelPartner/clients/get_clients/res_get_client.dart';
import 'package:surakshakadi/di/locator.dart';
import 'package:surakshakadi/repository/client_respository.dart';
import 'package:surakshakadi/ui/Screens/cp_web_screeen/admin_panel_web/admin_panel_web/dashboard_screen.dart';
import 'package:surakshakadi/utils/constants/navigation_route_constants.dart';



  final getClientProvider = StateNotifierProvider<GetClientViewModel, AsyncValue<ResGetClient>>(
        (ref) => GetClientViewModel((ref.read)));

class GetClientViewModel extends StateNotifier<AsyncValue<ResGetClient>> {


  GetClientViewModel(this._reader) : super(const AsyncValue.loading());
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


final addClientProvider = StateNotifierProvider<AddClientViewModel, AsyncValue<ResAddClient>>(
        (ref) => AddClientViewModel((ref.read)));

class AddClientViewModel extends StateNotifier<AsyncValue<ResAddClient>> {


  AddClientViewModel(this._reader) : super(const AsyncValue.loading());
  late final Reader _reader;

  late final ClientRepository repositery = _reader(clientRepositoryProvider);

  Future<ResAddClient?> addClient(
      {required BuildContext context, required ReqAddClient data}) async {
    final result = await repositery.addClient(data);
    return result.when(
        success: (result) async {
          Navigator.push(context, MaterialPageRoute(builder: (context) => AdminDashboard()));
          state= AsyncValue.data(result);
          return result;
        },
        failure: (error) {}
    );
  }

}