import 'package:dio/dio.dart';
import 'package:flutter_learning/core/apis/dio_interceptors/logging_interceptor.dart';
import 'package:flutter_learning/core/apis/dio_interceptors/token_interceptor.dart';
import 'package:flutter_learning/core/utils/dot_env_util.dart';

class DioClient {
  late Dio dio;

  final baseUrl = DotEnvUtil.hostApi + DotEnvUtil.apiVesion;

  DioClient() {
    initDio();
  }

  void initDio() {
    dio = Dio();

    //! Cấu Hình Global
    //? Bạn có thể thiết lập các cấu hình global cho tất cả các yêu cầu sử dụng Dio,
    //? bao gồm timeout, base URL, headers, v.v.
    dio.options = BaseOptions(
      baseUrl: baseUrl,
      receiveTimeout: const Duration(seconds: 8),
      connectTimeout: const Duration(seconds: 3),
    );
    dio.interceptors.add(LoggingInterceptor());
    dio.interceptors.add(TokenInterceptor());
  }
}
