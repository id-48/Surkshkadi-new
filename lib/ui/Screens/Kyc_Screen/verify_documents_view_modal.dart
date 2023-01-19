import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
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

import 'package:surakshakadi/repository/verify_documents_repository.dart';
import 'package:surakshakadi/utils/constants/preference_key_constant.dart';
import 'package:surakshakadi/utils/preference_utils.dart';



final panCardNoProvider = StateNotifierProvider.autoDispose<PanCardNoViewModel,
    AsyncValue<ResPancardNo>>((ref) => PanCardNoViewModel((ref.read)));

class PanCardNoViewModel extends StateNotifier<AsyncValue<ResPancardNo>> {
  PanCardNoViewModel(this._reader) : super(const AsyncValue.loading());
  late final Reader _reader;

  late final VerifyDocumentsRepository repositery =
  _reader(verifyDocumentsRepositoryProvider);

  Future<ResPancardNo?> getPanCard({
    required BuildContext context, required ReqPancardNo data,}) async {
    final result = await repositery.getPanCard(data);
    return result.when(success: (result) async {

      return result;

    }, failure: (error) {
      throw error;
    });
  }

}



final aadharNoProvider = StateNotifierProvider.autoDispose<AadharNoViewModel,
    AsyncValue<ResAadharNo>>((ref) => AadharNoViewModel((ref.read)));

class AadharNoViewModel extends StateNotifier<AsyncValue<ResAadharNo>> {
  AadharNoViewModel(this._reader) : super(const AsyncValue.loading());
  late final Reader _reader;

  late final VerifyDocumentsRepository repositery =
  _reader(verifyDocumentsRepositoryProvider);

  Future<ResAadharNo?> getAadharNo({
    required BuildContext context, required ReqAadharNo data,}) async {
    final result = await repositery.getAadharNo(data);
    return result.when(success: (result) async {

      return result;

    }, failure: (error) {
      throw error;
    });
  }

}



final aadharOtpProvider = StateNotifierProvider.autoDispose<AadharOtpViewModel,
    AsyncValue<ResAadharOtp>>((ref) => AadharOtpViewModel((ref.read)));

class AadharOtpViewModel extends StateNotifier<AsyncValue<ResAadharOtp>> {
  AadharOtpViewModel(this._reader) : super(const AsyncValue.loading());
  late final Reader _reader;

  late final VerifyDocumentsRepository repositery =
  _reader(verifyDocumentsRepositoryProvider);

  Future<ResAadharOtp?> getAadharOtp({
    required BuildContext context, required ReqAadharOtp data,}) async {
    final result = await repositery.getAadharOtp(data);
    return result.when(success: (result) async {

      return result;

    }, failure: (error) {
      throw error;
    });
  }

}



final bankAcProvider = StateNotifierProvider.autoDispose<BankAcViewModel,
    AsyncValue<ResBankAc>>((ref) => BankAcViewModel((ref.read)));

class BankAcViewModel extends StateNotifier<AsyncValue<ResBankAc>> {
  BankAcViewModel(this._reader) : super(const AsyncValue.loading());
  late final Reader _reader;

  late final VerifyDocumentsRepository repositery =
  _reader(verifyDocumentsRepositoryProvider);

  Future<ResBankAc?> getBankAC({
    required BuildContext context, required ReqBankAc data,}) async {
    final result = await repositery.getBankAC(data);
    return result.when(success: (result) async {

      return result;

    }, failure: (error) {
      throw error;
    });
  }

}


final vehicleNoProvider = StateNotifierProvider.autoDispose<VehicleNoViewModel,
    AsyncValue<ResVehicleNo>>((ref) => VehicleNoViewModel((ref.read)));

class VehicleNoViewModel extends StateNotifier<AsyncValue<ResVehicleNo>> {
  VehicleNoViewModel(this._reader) : super(const AsyncValue.loading());
  late final Reader _reader;

  late final VerifyDocumentsRepository repositery =
  _reader(verifyDocumentsRepositoryProvider);

  Future<ResVehicleNo?> getVehicleNo({
    required BuildContext context, required ReqVehicleNo data,}) async {
    final result = await repositery.getVehicleNo(data);
    return result.when(success: (result) async {

      return result;

    }, failure: (error) {
      throw error;
    });
  }

}


final gstNoProvider = StateNotifierProvider.autoDispose<GSTNoViewModel,
    AsyncValue<ResGstNo>>((ref) => GSTNoViewModel((ref.read)));

class GSTNoViewModel extends StateNotifier<AsyncValue<ResGstNo>> {
  GSTNoViewModel(this._reader) : super(const AsyncValue.loading());
  late final Reader _reader;

  late final VerifyDocumentsRepository repositery =
  _reader(verifyDocumentsRepositoryProvider);

  Future<ResGstNo?> getGSTNo({
    required BuildContext context, required ReqGstNo data,}) async {
    final result = await repositery.getGSTNo(data);
    return result.when(success: (result) async {

      return result;

    }, failure: (error) {
      throw error;
    });
  }

}



final digilockerAadharProvider = StateNotifierProvider.autoDispose<DigiAadharViewModel,
    AsyncValue<ResDigilockerAadharNo>>((ref) => DigiAadharViewModel((ref.read)));

class DigiAadharViewModel extends StateNotifier<AsyncValue<ResDigilockerAadharNo>> {
  DigiAadharViewModel(this._reader) : super(const AsyncValue.loading());
  late final Reader _reader;

  late final VerifyDocumentsRepository repositery =
  _reader(verifyDocumentsRepositoryProvider);

  Future<ResDigilockerAadharNo?> digilockerAadhar({

  required BuildContext context}) async {
  print("Aadhar Token digilockerAadhar view model ${getString(prefAadharToken)}");
    final result = await repositery.digilockerAadhar();
    return result.when(success: (result) async {
      print("rrererer : ${result.toJson()}");
      // state = AsyncValue.data(result);
      return result;

    }, failure: (error) {
      throw error;
    });
  }

}


