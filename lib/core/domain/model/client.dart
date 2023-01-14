library api;

import 'package:dio/dio.dart';
import 'package:flutter_cartelera/core/data/interceptor/api_logger.dart';
import 'package:flutter_cartelera/core/domain/model/request.dart';

class Client {
  Client._privateConstructor();
  static final Client _instance = Client._privateConstructor();
  static Client get instance => _instance;

  late Dio dio;

  void init({
    required String baseUrl,
    required Map<String, Object> headers,
    bool enableLogging = false,
  }) async {
    dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        headers: headers,
      ),
    );
    dio.interceptors.add(
      ApiLoggerInterceptor(),
    );
  }

  static Future<Response> request(ApiRequest request) async {
    return await _instance.dio.request(
      request.url,
      data: request.body,
      queryParameters: request.query,
      options: Options(
        method: request.method,
        headers: request.headers,
        responseType: request.responseType,
      ),
    );
  }
}
