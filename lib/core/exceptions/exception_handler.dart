import 'dart:io';
import 'package:dio/dio.dart';
import 'exceptions.dart';

/// [ExceptionHandler] is responsible for interpreting and converting
/// API and network errors into application-level exceptions.
class ExceptionHandler {
  // Private constructor to prevent instantiation.
  ExceptionHandler._();

  /// [handleErrorStatus] converts a Dio [Response] with an error HTTP status
  /// into a specific [AppException] based on the status code.
  ///
  /// Throws appropriate exceptions like [BadRequestException], [UnauthorizedException], etc.
  /// Returns a [ServerException] for generic server errors (2xx edge cases).
  static Exception handleErrorStatus(Response<dynamic> response) {
    final int? statusCode = response.statusCode;

    // Handle case when no status code is returned.
    if (statusCode == null) {
      throw const UnknownException(message:  "No status code returned");
    }

    // Map HTTP status codes to appropriate exceptions.
    switch (statusCode) {
      case 400:
        throw BadRequestException(message: "Bad request", statusCode: statusCode);
      case 401:
        throw UnauthorizedException(message: "Unauthorized access", statusCode: statusCode);
      case 403:
        throw ForbiddenException(message: "Forbidden", statusCode: statusCode);
      case 404:
        throw NotFoundException(message: "Resource not found", statusCode: statusCode);
      case 500:
      case 502:
      case 503:
        throw ServerException(message: "Server error", statusCode: statusCode);
      default:
        if (statusCode < 200 || statusCode >= 300) {
          throw UnknownException(message: "Unexpected error: $statusCode");
        } else {
          return ServerException(message: "Server Exception", statusCode: statusCode);
        }
    }
  }

  /// [handleDioError] analyzes a [DioException] and maps it to a custom [AppException].
  ///
  /// Handles:
  /// - Network and timeout errors as [NetworkException]
  /// - Dio responses with status codes as specific exceptions
  /// - Unknown or unhandled errors as [UnknownException]
  static Exception handleDioError(DioException error) {
    // Handle internet-related exceptions.
    if (error.error is SocketException ||
        error.type == DioExceptionType.connectionError) {
      return const NetworkException(message: "No internet connection");
    }

    // Handle timeout-related exceptions.
    if (error.type == DioExceptionType.connectionTimeout ||
        error.type == DioExceptionType.receiveTimeout ||
        error.type == DioExceptionType.sendTimeout) {
      return const NetworkException(message: "Connection timeout");
    }

    final Response<dynamic>? response = error.response;
    final int? statusCode = response?.statusCode;

    // Handle unknown server error when status code is absent.
    if (statusCode == null) {
      return const UnknownException(message: "Unknown server error with no status code");
    }

    // Map HTTP status codes to appropriate exceptions.
    switch (statusCode) {
      case 400:
        final String? message =
            (error.response?.data as Map<String, dynamic>?)?['message']
                as String?;
        throw BadRequestException(message: message ?? "Bad Request", statusCode: statusCode);
      case 401:
        final String? message =
            (error.response?.data as Map<String, dynamic>?)?['message']
                as String?;
        throw UnauthorizedException(
          message: message ?? "Unauthorized access",
          statusCode: statusCode,
        );
      case 403:
        final String? message =
            (error.response?.data as Map<String, dynamic>?)?['message']
                as String?;
        throw ForbiddenException(message: message ?? "Forbidden", statusCode: statusCode);
      case 404:
        final String? message =
            (error.response?.data as Map<String, dynamic>?)?['message']
                as String?;
        throw NotFoundException(
          message: message ?? "Resource not found",
          statusCode: statusCode,
        );
      case 409:
        final String? message =
            (error.response?.data as Map<String, dynamic>?)?['message']
                as String?;
        throw NotFoundException(message: message ?? "Conflict Error", statusCode: statusCode);
      case 500:
      case 502:
      case 503:
        return ServerException(message: "Server error occurred", statusCode: statusCode);
      default:
        if (statusCode < 200 || statusCode >= 300) {
          return UnknownException(message: "Unexpected status statusCode: $statusCode");
        }
        return ServerException(message: "Server error occurred", statusCode: statusCode);
    }
  }
  
}
