import 'package:equatable/equatable.dart';

class ApiError extends Equatable {
  final int? statusCode;
  final List<String>? errors;

  const ApiError({this.statusCode, this.errors = const []});

  const factory ApiError.fetchError(int? statusCode, List<String>? errors) =
      FetchError;
  const factory ApiError.submitError(int? statusCode, List<String>? errors) =
      SubmitError;
  const factory ApiError.onNullData(int? statusCode, List<String>? errors) =
      OnNullData;
  const factory ApiError.noCameraAvailable(
      int? statusCode, List<String>? errors) = NoCameraAvailable;

  @override
  List<Object?> get props => [statusCode, errors];
}

class FetchError extends ApiError {
  const FetchError(int? statusCode, List<String>? errors)
      : super(statusCode: statusCode, errors: errors);
}

class SubmitError extends ApiError {
  const SubmitError(int? statusCode, List<String>? errors)
      : super(statusCode: statusCode, errors: errors);
}

class OnNullData extends ApiError {
  const OnNullData(int? statusCode, List<String>? errors)
      : super(statusCode: statusCode, errors: errors);
}

class NoCameraAvailable extends ApiError {
  const NoCameraAvailable(int? statusCode, List<String>? errors)
      : super(statusCode: statusCode, errors: errors);
}
