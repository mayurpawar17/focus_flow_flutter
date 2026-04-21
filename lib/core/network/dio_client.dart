import 'package:dio/dio.dart';
import 'package:focus_flow_flutter/core/constants/api_constants.dart';

class DioClient {
  late Dio dio;

  DioClient() {
    dio = Dio(
      BaseOptions(
        baseUrl: ApiConstants.baseUrl,
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
        headers: {"Content-Type": "application/json"},
      ),
    );

    dio.interceptors.add(LogInterceptor(requestBody: true, responseBody: true));

    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          // Add token
          // options.headers["Authorization"] = "Bearer token";
          return handler.next(options);
        },
        onError: (error, handler) {
          // Central error handling
          return handler.next(error);
        },
      ),
    );
  }
}
