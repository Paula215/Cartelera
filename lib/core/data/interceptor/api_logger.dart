import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';

class ApiLoggerInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    ApiLogger.logRequest(
      options.method,
      options.path,
      query: options.queryParameters,
      body: options.data,
      headers: options.headers,
    );

    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    ApiLogger.logResponse(response);
    super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    ApiLogger.logError(err);
    super.onError(err, handler);
  }
}

class ApiLogger {
  static logResponse(res) {
    if (res is Response) {
      final req = res.requestOptions;
      final statusCode = res.statusCode;

      final query = createQuery(req.queryParameters);
      final method = req.method;
      final path = '${req.path}$query';

      final result = ResponseData(
              path: path,
              method: method,
              data: res.data,
              statusCode: statusCode)
          .toJson();

      log(encodeJson(result), name: 'Response');
    } else {
      log(encodeJson(res), name: 'Response');
    }
  }

  static logRequest(
    String method,
    String url, {
    Map<String, dynamic>? query,
    dynamic body,
    dynamic headers,
  }) {
    final queryString = createQuery(query);
    final path = '$url$queryString';

    final logData = RequestData(
      method: method,
      path: path,
      body: body,
      headers: headers,
    ).toJson();

    final result = encodeJson(logData);

    log(result, name: 'Request');
  }

  static logError(dynamic e) {
    if (e is DioError) {
      _handleDioError(e);
    } else {
      log('\x1B[31m${e.toString()}\x1B[0m', name: 'Error');
    }
  }

  static String encodeJson(dynamic data) {
    JsonEncoder encoder = const JsonEncoder.withIndent('  ');
    return encoder.convert(data);
  }

  static _handleDioError(DioError e) {
    final res = e.response;
    final req = e.requestOptions;

    final query = createQuery(req.queryParameters);
    final path = '${req.path}$query';
    final method = req.method.toUpperCase();

    if (res != null) {
      final error = RequestError(
        path: path,
        method: method,
        statusCode: res.statusCode,
        statusMessage: res.statusMessage,
        data: res.data,
      ).toJson();

      log('\x1B[31m${encodeJson(error)}\x1B[0m', name: 'RequestError');
    } else {
      log(e.message, name: 'Error');
    }
  }

  static String createQuery(Map<String, dynamic>? query) {
    if (query == null || query.keys.isEmpty) return '';

    final keys = query.keys.toList();
    var result = '';

    for (var i = 0; i < keys.length; i++) {
      final keyName = keys[i];
      final value = query[keyName];

      final tmp = '$keyName=$value';
      result = '$result$tmp';

      if (i != keys.length - 1) result = '$result,';
    }

    return '?$result';
  }
}

class RequestData {
  RequestData({
    required this.path,
    required this.method,
    this.body,
    this.headers,
  });

  final String path;
  final String method;
  final dynamic body;
  final dynamic headers;

  Map<String, dynamic> toJson() {
    if (method == 'GET') {
      return {
        'endpoint': path,
        'method': method,
        'timeStamp': DateTime.now().toIso8601String(),
        'headers': headers,
      };
    }

    if (body is FormData) {
      return {
        'endpoint': path,
        'method': method,
        'body': 'Encoded multipart file',
        'timeStamp': DateTime.now().toIso8601String(),
        'headers': headers,
      };
    }

    return {
      'endpoint': path,
      'method': method,
      'timeStamp': DateTime.now().toIso8601String(),
      'body': body,
      'headers': headers,
    };
  }
}

class RequestError {
  RequestError({
    this.path,
    this.data,
    this.statusCode,
    this.method,
    this.statusMessage,
  });

  final String? path;
  final dynamic data;
  final int? statusCode;
  final String? statusMessage;
  final String? method;

  Map<String, dynamic> toJson() {
    return {
      'path': path,
      'method': method,
      'statusCode': statusCode,
      'statusMessage': statusMessage,
      'timeStamp': DateTime.now().toIso8601String(),
      'data': data,
    };
  }
}

class ResponseData {
  ResponseData({
    required this.path,
    required this.method,
    required this.data,
    required this.statusCode,
  });

  final String path;
  final String method;
  final int? statusCode;
  final dynamic data;

  Map<String, dynamic> toJson() {
    return {
      'path': path,
      'method': method.toUpperCase(),
      'statusCode': statusCode,
      'timeStamp': DateTime.now().toIso8601String(),
      'data': data,
    };
  }
}
