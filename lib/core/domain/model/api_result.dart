import 'package:equatable/equatable.dart';

class ApiResult<T> extends Equatable {
  const ApiResult();
  const factory ApiResult.success({required T data}) = Success<T>;
  const factory ApiResult.failure({
    required int? statusCode,
    required List<String> errors,
  }) = Failure<T>;

  @override
  List<Object> get props => [];

  T when({
    required T Function(T data) success,
    required T Function(int? statusCode, List<String> errors) failure,
  }) {
    final s = this;
    if (s is Success<T>) return success(s.props[0] as T);
    return failure((s as Failure<T>).statusCode, (s).errors);
  }
}

class Success<T> extends ApiResult<T> {
  final T data;

  const Success({required this.data});

  @override
  List<Object> get props => [data] as List<Object>;

  @override
  String toString() => 'Success { data: $data }';
}

class Failure<T> extends ApiResult<T> {
  final int? statusCode;
  final List<String> errors;

  const Failure({required this.statusCode, required this.errors});

  @override
  List<Object> get props => [statusCode, errors] as List<Object>;

  @override
  String toString() => 'Failure { statusCode: $statusCode, errors: $errors }';
}
