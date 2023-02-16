
import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:surakshakadi/data/datasource/app_dio.dart';
import 'package:surakshakadi/data/model/home/channelPartner/start_partners/Res_send_account_verification.dart';
import 'package:surakshakadi/data/model/home/channelPartner/start_partners/req_send_account_verification.dart';
import 'package:surakshakadi/data/model/home/dashboard/about_us/store_inquiry_details/req_store_inquiry_details.dart';
import 'package:surakshakadi/data/model/home/dashboard/about_us/store_inquiry_details/res_store_inquiry_details.dart';
import 'package:surakshakadi/data/model/home/dashboard/components/single_user_assets/req_single_user_assets.dart';
import 'package:surakshakadi/data/model/home/dashboard/components/single_user_assets/res_single_user_assets.dart';
import 'package:surakshakadi/data/model/home/dashboard/how_it_work/how_it_work.dart';

import 'package:surakshakadi/data/model/home/dashboard/res_dashboard.dart';
import 'package:surakshakadi/data/model/home/dashboard/security_content/req_security_content.dart';
import 'package:surakshakadi/data/model/home/dashboard/security_content/res_security_content.dart';
import 'package:surakshakadi/utils/constants/api_end_points.dart';

import '../data/model/result.dart';


abstract class StoreInquiryDetailsRepository {
  Future<Result<ResStoreInquiryDetails>> getStoreInquiryDetails(ReqStoreInquiryDetails data);

}

final storeInquiryDetailsRepositoryProvider =
Provider((ref) => StoreInquiryDetailsRepositoryImpl(ref.read));

class StoreInquiryDetailsRepositoryImpl implements StoreInquiryDetailsRepository {
  StoreInquiryDetailsRepositoryImpl(this._reader);

  final Reader _reader;

  late final Dio dio = _reader(dioProvider);



  @override
  Future<Result<ResStoreInquiryDetails>> getStoreInquiryDetails(ReqStoreInquiryDetails data) {
    return Result.guardFuture(() async {
      return AppDio()
          .multipartPost(apiStoreInquiryDetails, data:  FormData.fromMap(data.toJson()))
          .then((value) async {
        final data = ResStoreInquiryDetails.fromJson(value.data);
        return data;
      });
    }).catchError((error) {
      throw error;
    });
  }






}
