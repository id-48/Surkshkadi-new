import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:surakshakadi/data/datasource/app_dio.dart';

import 'package:surakshakadi/data/model/home/dashboard/will_document/req_will_documnet.dart';
import 'package:surakshakadi/data/model/home/dashboard/will_document/res_will_documnet.dart';
import 'package:surakshakadi/utils/constants/api_end_points.dart';

import '../data/model/result.dart';

abstract class WillDocumentRepository {
  Future<Result<ResWillDocument>> postWillDocument(ReqWillDocument data);
}

final willDocumentRepositoryProvider =
    Provider((ref) => WillDocumentRepositoryImpl(ref.read));

class WillDocumentRepositoryImpl implements WillDocumentRepository {
  WillDocumentRepositoryImpl(this._reader);

  final Reader _reader;

  late final Dio dio = _reader(dioProvider);

  @override
  Future<Result<ResWillDocument>> postWillDocument(ReqWillDocument data) {
    return Result.guardFuture(() async {
      return AppDio()
          .multipartPost(apiWillDocument, data: FormData.fromMap(data.toJson()))
          .then((value) async {
        final data = ResWillDocument.fromJson(value.data);
        return data;
      });
    }).catchError((error) {
      throw error;
    });
  }
}
