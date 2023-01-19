import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:surakshakadi/data/datasource/app_dio.dart';
import 'package:surakshakadi/data/model/home/dashboard/verify_documents/verify_aadhar_card/verify_aadhar_card_no/req_aadhar_no.dart';
import 'package:surakshakadi/data/model/home/dashboard/verify_documents/verify_aadhar_card/verify_aadhar_card_no/res_aadhar_no.dart';
import 'package:surakshakadi/data/model/home/dashboard/verify_documents/verify_aadhar_card/verify_aadhar_card_otp/req_aadhar_otp.dart';
import 'package:surakshakadi/data/model/home/dashboard/verify_documents/verify_aadhar_card/verify_aadhar_card_otp/res_aadhar_otp.dart';
import 'package:surakshakadi/data/model/home/dashboard/verify_documents/verify_bank_ac/req_bank_ac.dart';
import 'package:surakshakadi/data/model/home/dashboard/verify_documents/verify_bank_ac/res_bank_ac.dart';
import 'package:surakshakadi/data/model/home/dashboard/verify_documents/verify_digilocker/digilocker_aadhar_no/res_digilocker_aadhar_no.dart';
import 'package:surakshakadi/data/model/home/dashboard/verify_documents/verify_gstin_no/req_gst_no.dart';
import 'package:surakshakadi/data/model/home/dashboard/verify_documents/verify_gstin_no/res_gst_no.dart';

import 'package:surakshakadi/data/model/home/dashboard/verify_documents/verify_pancard_no/req_pancard_no.dart';
import 'package:surakshakadi/data/model/home/dashboard/verify_documents/verify_pancard_no/res_pancard_no.dart';
import 'package:surakshakadi/data/model/home/dashboard/verify_documents/verify_vehicle_no/req_vehicle_no.dart';
import 'package:surakshakadi/data/model/home/dashboard/verify_documents/verify_vehicle_no/res_vehicle_no.dart';
import 'package:surakshakadi/data/model/result.dart' as yc;
import 'package:surakshakadi/utils/constants/api_end_points.dart';
import 'package:surakshakadi/utils/constants/preference_key_constant.dart';
import 'package:surakshakadi/utils/preference_utils.dart';

abstract class VerifyDocumentsRepository {
  Future<yc.Result<ResPancardNo>> getPanCard(ReqPancardNo data);

  Future<yc.Result<ResAadharNo>> getAadharNo(ReqAadharNo data);

  Future<yc.Result<ResAadharOtp>> getAadharOtp(ReqAadharOtp data);

  Future<yc.Result<ResBankAc>> getBankAC(ReqBankAc data);

  Future<yc.Result<ResVehicleNo>> getVehicleNo(ReqVehicleNo data);

  Future<yc.Result<ResGstNo>> getGSTNo(ReqGstNo data);

  Future<yc.Result<ResDigilockerAadharNo>> digilockerAadhar();
}

final verifyDocumentsRepositoryProvider =
    Provider((ref) => VerifyDocumentsRepositoryImpl(ref.read));

class VerifyDocumentsRepositoryImpl implements VerifyDocumentsRepository {
  VerifyDocumentsRepositoryImpl(this._reader);

  final Reader _reader;

  late final Dio dio = _reader(dioProvider);

  @override
  Future<yc.Result<ResPancardNo>> getPanCard(ReqPancardNo data) {
    return yc.Result.guardFuture(() async {
      return AppDio()
          .post(apiPanCard,
              data: data.toJson(),
              options: Options(
                  headers: {"clientId": clientId, "secretKey": secretKey}))
          .then((value) async {
        final data = ResPancardNo.fromJson(value.data);
        return data;
      });
    }).catchError((error) {
      throw error;
    });
  }

  @override
  Future<yc.Result<ResAadharNo>> getAadharNo(ReqAadharNo data) {
    return yc.Result.guardFuture(() async {
      return AppDio()
          .post(apiAadharNoVerify,
              data: data.toJson(),
              options: Options(
                  headers: {"clientId": clientId, "secretKey": secretKey}))
          .then((value) async {
        final data = ResAadharNo.fromJson(value.data);
        return data;
      });
    }).catchError((error) {
      throw error;
    });
  }

  @override
  Future<yc.Result<ResAadharOtp>> getAadharOtp(ReqAadharOtp data) {
    return yc.Result.guardFuture(() async {
      return AppDio()
          .post(apiAadharOtpVerify,
              data: data.toJson(),
              options: Options(
                  headers: {"clientId": clientId, "secretKey": secretKey}))
          .then((value) async {
        final data = ResAadharOtp.fromJson(value.data);
        return data;
      });
    }).catchError((error) {
      throw error;
    });
  }

  @override
  Future<yc.Result<ResBankAc>> getBankAC(ReqBankAc data) {
    return yc.Result.guardFuture(() async {
      return AppDio()
          .post(apiBankAC,
              data: data.toJson(),
              options: Options(
                  headers: {"clientId": clientId, "secretKey": secretKey}))
          .then((value) async {
        final data = ResBankAc.fromJson(value.data);
        return data;
      });
    }).catchError((error) {
      throw error;
    });
  }

  @override
  Future<yc.Result<ResVehicleNo>> getVehicleNo(ReqVehicleNo data) {
    return yc.Result.guardFuture(() async {
      return AppDio()
          .post(apiVehicleNo,
              data: data.toJson(),
              options: Options(
                  headers: {"clientId": clientId, "secretKey": secretKey}))
          .then((value) async {
        final data = ResVehicleNo.fromJson(value.data);
        return data;
      });
    }).catchError((error) {
      throw error;
    });
  }

  @override
  Future<yc.Result<ResGstNo>> getGSTNo(ReqGstNo data) {
    return yc.Result.guardFuture(() async {
      return AppDio()
          .post(apiGSTNo,
              data: data.toJson(),
              options: Options(
                  headers: {"clientId": clientId, "secretKey": secretKey}))
          .then((value) async {
        final data = ResGstNo.fromJson(value.data);
        return data;
      });
    }).catchError((error) {
      throw error;
    });
  }

  @override
  Future<yc.Result<ResDigilockerAadharNo>> digilockerAadhar() {
    return yc.Result.guardFuture(() async {
      print(
          "Aadhar Token  digilockerAadhar repository ${getString(prefAadharToken)}");

      return AppDio()
          .get(apiDigiLockerAadhar,
              options: Options(headers: {
                "clientId": clientId,
                "secretKey": secretKey,
                "token": getString(prefAadharToken).trim()
              }))
          .then((value) async {
        final data = ResDigilockerAadharNo.fromJson(value.data);
        return data;
      });
    }).catchError((error) {
      throw error;
    });
  }
}
