import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_cartelera/core/domain/model/api_result.dart';
import 'package:flutter_cartelera/core/domain/model/client.dart';
import 'package:flutter_cartelera/core/domain/model/request.dart';

Future<ApiResult<T>> request<T>(
  ApiRequest request,
  Function(dynamic) fromJson,
) async {
  try {
    final response = await Client.request(request);
    return ApiResult.success(data: fromJson(response.data));
  } on DioError catch (e) {
    List<String> errors = [];
    try {
      if (e.response?.data is Map &&
          (e.response?.data['errors'] is List ||
              e.response?.data['Errors'] is List)) {
        errors = e.response?.data?['errors']?.cast<String>() ??
            e.response?.data['Errors']?.cast<String>();
      }
      if (e.error is SocketException && e.error?.message != null) {
        errors.add(e.error?.message);
      }
    } on Exception catch (_) {
      errors = [];
    }
    return ApiResult.failure(
      errors: errors,
      statusCode: e.response?.statusCode ?? 500,
    );
  } on Exception catch (e) {
    return ApiResult.failure(
      errors: [e.toString()],
      statusCode: 500,
    );
  }
}
