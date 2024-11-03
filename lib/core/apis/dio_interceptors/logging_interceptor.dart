import 'package:dio/dio.dart';
import 'package:flutter_learning/core/services/logger_service.dart';

class LoggingInterceptor extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    // Xử lý lỗi
    printE('Request failed: ${err.message}');
    if (err.response != null) {
      printE(
          'Error [Http Status Code: ${err.response?.statusCode}] response data: ${err.response?.data}');
    }
    return handler.next(err); // tiếp tục thực thi lỗi
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    printI(
        "[REQUEST] Api: ${options.path} | Method: ${options.method} | \nQuery parameter: ${options.queryParameters} | Body request data: ${options.data}");
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    final statusCode = response.statusCode;
    final data = response.data;
    final requestOptions = response.requestOptions;
    printS(
      "[RESPONSE][Code: $statusCode] Api: ${requestOptions.path} | Method: ${requestOptions.method} | Query parameter: ${requestOptions.queryParameters} | Body request data: ${requestOptions.data} | Data response: $data",
    );
    return handler.next(response); // tiếp tục thực thi phản hồi
  }
}
