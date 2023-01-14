import 'package:dio/dio.dart';
import 'package:flutter_cartelera/core/domain/model/http_methods.dart';

class ApiRequest {
  ApiRequest({
    required this.url,
    required this.method,
    this.query,
    this.headers,
    this.body,
    this.responseType,
    this.data,
  });

  final String url;
  final String method;
  final Map<String, dynamic>? query;
  final Map<String, dynamic>? headers;
  final ResponseType? responseType;
  final Object? body;
  final dynamic data;

  static ApiRequest get(
    String url, {
    Map<String, dynamic>? query,
    Map<String, dynamic>? headers,
    ResponseType? responseType,
    dynamic data,
  }) {
    return ApiRequest(
        url: url,
        method: HttpMethods.get,
        headers: headers,
        query: query,
        responseType: responseType,
        data: data);
  }

  static ApiRequest post(
    String url, {
    Map<String, dynamic>? query,
    Map<String, dynamic>? headers,
    Object? body,
    dynamic data,
  }) {
    return ApiRequest(
      url: url,
      method: HttpMethods.post,
      body: body,
      query: query,
      headers: headers,
      data: data,
    );
  }

  static ApiRequest put(
    String url, {
    Map<String, dynamic>? query,
    Map<String, dynamic>? headers,
    Object? body,
    dynamic data,
  }) {
    return ApiRequest(
      url: url,
      method: HttpMethods.put,
      body: body,
      query: query,
      headers: headers,
      data: data,
    );
  }

  static ApiRequest patch(
    String url, {
    Map<String, dynamic>? query,
    Map<String, dynamic>? headers,
    Object? body,
  }) {
    return ApiRequest(
      url: url,
      method: HttpMethods.patch,
      body: body,
      query: query,
      headers: headers,
    );
  }

  static ApiRequest delete(
    String url, {
    Map<String, dynamic>? query,
    Map<String, dynamic>? headers,
  }) {
    return ApiRequest(
      url: url,
      method: HttpMethods.delete,
      headers: headers,
      query: query,
    );
  }
}
