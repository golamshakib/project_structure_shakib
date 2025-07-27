import 'package:freezed_annotation/freezed_annotation.dart';

part 'result.freezed.dart';

@Freezed(genericArgumentFactories: true)
class Result<T> with _$Result<T> {
  const factory Result.success(T data) = Success<T>;
  const factory Result.failure({
    required String message,
    required int statusCode,
    String? details,
  }) = Failure<T>;
}

extension ResultX<T> on Result<T> {
  bool get isSuccess => this is Success<T>;
  bool get isFailure => this is Failure<T>;

  T? get data => whenOrNull(success: (data) => data);
  String? get errorMessage =>
      whenOrNull(failure: (message, statusCode, details) => message);
  int? get errorStatusCode =>
      whenOrNull(failure: (message, statusCode, details) => statusCode);
}
