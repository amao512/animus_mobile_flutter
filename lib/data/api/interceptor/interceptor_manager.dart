import 'package:chucker_flutter/chucker_flutter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class InterceptorManager {
  static Dio setupInterceptors() {
    final Dio dio = Dio();

    dio.interceptors.add(
      InterceptorsWrapper(onRequest: (RequestOptions options, handler) async {
        if (kDebugMode) {
          print("Headers: ${options.headers}");
          print("Url: ${options.baseUrl}${options.path}");
          print("QueryParams: ${options.queryParameters}");
        }

        handler.next(options);
      }),
    );

    if (kDebugMode) {
      dio.interceptors.add(ChuckerDioInterceptor());
    }

    return dio;
  }
}