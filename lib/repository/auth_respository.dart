import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:surakshakadi/data/datasource/app_dio.dart';
import 'package:surakshakadi/data/model/auth/otp/req_otp.dart';
import 'package:surakshakadi/data/model/auth/otp/res_otp.dart';
import 'package:surakshakadi/data/model/auth/verify_otp/req_verify_otp.dart';
import 'package:surakshakadi/data/model/auth/verify_otp/res_verify_otp.dart';
import 'package:surakshakadi/data/model/result.dart';
import 'package:surakshakadi/utils/constants/api_end_points.dart';
import 'package:surakshakadi/utils/constants/loading_dialog.dart';
import 'package:surakshakadi/utils/dialog_utils.dart';

abstract class AuthRepository {
  Future<Result<ResOtp>> logIn(ReqOtp data,context);

  Future<Result<ResVerifyOtp>> verifyOtp(ReqVerifyOtp data);
}

final authRepositoryProvider = Provider((ref) => authRepositoryImpl(ref.read));

class authRepositoryImpl implements AuthRepository {
  authRepositoryImpl(this._reader);

  final Reader _reader;

  late final Dio dio = _reader(dioProvider);

  @override
  Future<Result<ResOtp>> logIn(ReqOtp data,context) {
    return Result.guardFuture(() async {
      return AppDio().multipartPost(apiOtp, data: FormData.fromMap(data.toJson())).then((value) async {

        if(value.data['status']  == 0) {
          displayToast("${value.data['message']}");
          hideLoadingDialog(context: context);
        }

        final data = ResOtp.fromJson(value.data);

        return data;
      });
    }).catchError((error) {
      throw error;
    });
  }

  @override
  Future<Result<ResVerifyOtp>> verifyOtp(ReqVerifyOtp data) {
    return Result.guardFuture(() async {

      // return dio.post(apiVerifyOtp, data: data.toJson()).then((value) async {
      //   final data = ResVerifyOtp.fromJson(value.data);
      return AppDio().multipartPost(apiVerifyOtp, data: FormData.fromMap(data.toJson())).then((value) async {
        final data = ResVerifyOtp.fromJson(value.data);
        return data;
      });
    }).catchError((error) {
      throw error;
    });
  }
}
