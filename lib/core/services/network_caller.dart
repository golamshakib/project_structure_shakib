import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:ps_shakib/core/models/api_response.dart';
import 'package:ps_shakib/core/models/result.dart';
import 'package:ps_shakib/core/services/local_storage_service.dart';

class NetworkCaller {
  final Dio _dio = Dio(
    BaseOptions(
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 40),
      headers: {'Content-Type': 'application/json'},
      validateStatus: (status) {
        return status! < 505;
      },
    ),
  );

  /// Generic GET request
  Future<Result<T>> getRequest<T>(
    String endpoint, {
    String? token,
    required T Function(Map<String, dynamic>) fromJsonT,
  }) async {
    return await _sendRequest<T>(
      endpoint,
      method: 'GET',
      token: token,
      fromJsonT: fromJsonT,
    );
  }

  Future<Result<T>> postRequest<T>(
    String endpoint, {
    Map<String, dynamic>? body,
    String? token,
    required T Function(Map<String, dynamic>) fromJsonT,
  }) async {
    return await _sendRequest<T>(
      endpoint,
      method: 'POST',
      body: body,
      token: token,
      fromJsonT: fromJsonT,
    );
  }

  /// Generic PUT request
  Future<Result<T>> putRequest<T>(
    String endpoint, {
    Map<String, dynamic>? body,
    String? token,
    required T Function(Map<String, dynamic>) fromJsonT,
  }) async {
    return await _sendRequest<T>(
      endpoint,
      method: 'PUT',
      body: body,
      token: token,
      fromJsonT: fromJsonT,
    );
  }

  /// Generic DELETE request
  Future<Result<T>> deleteRequest<T>(
    String endpoint, {
    String? token,
    required T Function(Map<String, dynamic>) fromJsonT,
  }) async {
    return await _sendRequest<T>(
      endpoint,
      method: 'DELETE',
      token: token,
      fromJsonT: fromJsonT,
    );
  }

  /// Generic PATCH request
  Future<Result<T>> patchRequest<T>(
    String endpoint, {
    Map<String, dynamic>? body,
    String? token,
    required T Function(Map<String, dynamic>) fromJsonT,
  }) async {
    return await _sendRequest<T>(
      endpoint,
      method: 'PATCH',
      body: body,
      token: token,
      fromJsonT: fromJsonT,
    );
  }

  /// Private method to handle all requests
  Future<Result<T>> _sendRequest<T>(
    String endpoint, {
    required String method,
    Map<String, dynamic>? body,
    String? token,
    required T Function(Map<String, dynamic>) fromJsonT,
  }) async {
    try {
      log('$method Request: $endpoint');
      if (body != null) log('Request Body: $body');

      final Response response = await _dio.request(
        endpoint,
        options: Options(
          method: method,
          headers: {'Authorization': token ?? ''},
        ),
        data: body,
      );

      return _handleResponse<T>(response, fromJsonT);
    } catch (e) {
      return _handleError<T>(e);
    }
  }

  /// Handle successful responses
  Result<T> _handleResponse<T>(
    Response response,
    T Function(Map<String, dynamic>) fromJsonT,
  ) {
    log('Response Status: ${response.statusCode}');
    log('Response Data: ${response.data}');

    final int statusCode = response.statusCode!;

    try {
      // Parse the API response structure
      final ApiResponse<Map<String, dynamic>> apiResponse =
          ApiResponse.fromJson(
            response.data,
            (json) => json as Map<String, dynamic>,
          );

      // Extract status code - prioritize response status code, then API response statusCode, then from err object
      final int finalStatusCode =
          apiResponse.statusCode ??
          _extractStatusCodeFromResponse(response.data) ??
          statusCode;

      if (statusCode >= 200 && statusCode < 300 && apiResponse.success) {
        // Success case - convert data to the desired type
        if (apiResponse.data != null) {
          final T data = fromJsonT(apiResponse.data!);
          return Result.success(data);
        } else {
          // Handle cases where there's no data but the request was successful
          return Result.failure(
            message:
                apiResponse.message?.isEmpty == true ||
                        apiResponse.message == null
                    ? 'No data received'
                    : apiResponse.message!,
            statusCode: finalStatusCode,
          );
        }
      } else {
        // Server returned error in the API response
        return Result.failure(
          message:
              apiResponse.message?.isEmpty == true ||
                      apiResponse.message == null
                  ? _getDefaultErrorMessage(finalStatusCode)
                  : apiResponse.message!,
          statusCode: finalStatusCode,
        );
      }
    } catch (e) {
      log('Error parsing response: $e');
      return Result.failure(
        message: 'Failed to parse server response',
        statusCode: statusCode,
        details: e.toString(),
      );
    }
  }

  /// Handle errors
  Result<T> _handleError<T>(dynamic error) {
    log('Request Error: $error');

    if (error is DioException) {
      switch (error.type) {
        case DioExceptionType.connectionTimeout:
        case DioExceptionType.receiveTimeout:
          return Result.failure(
            message: 'Request timed out. Check your connection.',
            statusCode: 408,
          );

        case DioExceptionType.badResponse:
          final int statusCode = error.response?.statusCode ?? 500;
          String errorMessage = _getDefaultErrorMessage(statusCode);

          // Try to extract message from server response
          try {
            if (error.response?.data != null) {
              final responseData = error.response!.data;
              if (responseData is Map<String, dynamic> &&
                  responseData['message'] != null) {
                errorMessage = responseData['message'];
              }
            }
          } catch (e) {
            log('Error parsing error response: $e');
          }

          // Handle 401 Unauthorized
          if (statusCode == 401) {
            log('401 Unauthorized - Token may be expired or invalid');
            Future.delayed(const Duration(milliseconds: 500), () {
              try {
                LocalStorageService.instance.logoutUser();
              } catch (e) {
                log('Logout failed during DioException: $e');
              }
            });
          }

          return Result.failure(message: errorMessage, statusCode: statusCode);

        case DioExceptionType.cancel:
          return Result.failure(
            message: 'Request was cancelled.',
            statusCode: 499,
          );

        case DioExceptionType.connectionError:
          return Result.failure(
            message: 'No internet connection.',
            statusCode: 0,
          );

        default:
          return Result.failure(
            message: 'Unexpected error occurred. Try again later.',
            statusCode: 500,
          );
      }
    }

    return Result.failure(
      message: 'Something went wrong. Please try again.',
      statusCode: 500,
      details: error.toString(),
    );
  }

  /// Extract status code from response data (handles nested err.statusCode)
  int? _extractStatusCodeFromResponse(dynamic responseData) {
    if (responseData is! Map<String, dynamic>) return null;

    // Check if err object exists and has statusCode
    if (responseData['err'] is Map<String, dynamic>) {
      final err = responseData['err'] as Map<String, dynamic>;
      if (err['statusCode'] is num) {
        return (err['statusCode'] as num).toInt();
      }
    }

    // Check for direct statusCode field
    if (responseData['statusCode'] is num) {
      return (responseData['statusCode'] as num).toInt();
    }

    return null;
  }

  /// Get default error messages
  String _getDefaultErrorMessage(int statusCode) {
    switch (statusCode) {
      case 400:
        return 'Bad request. Please check your input.';
      case 401:
        return 'Unauthorized. Please log in.';
      case 403:
        return 'Forbidden. You lack permission.';
      case 404:
        return 'Resource not found.';
      case 500:
        return 'Internal server error. Please try again later.';
      case 503:
        return 'Service unavailable. Please try again later.';
      default:
        return 'Unexpected error occurred. Try again.';
    }
  }
}
