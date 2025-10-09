import 'dart:io';
import 'package:dio/dio.dart';
import '../exceptions/exception_handler.dart';
import '../exceptions/exceptions.dart';
import '../constants/api_constants.dart';
import './interceptors/logging_interceptor.dart';
import './interceptors/auth_interceptor.dart';
part 'http_method.dart';
part 'api_request.dart';
part 'api_response.dart';

/// API client for making HTTP requests
class ApiClient {
  final Dio _dio;

  ApiClient({
    required Dio dio,
    required LoggingInterceptor loggingInterceptor,
    required AuthInterceptor authInterceptor,
  }) : _dio = dio {
    _dio.options = BaseOptions(
      baseUrl: ApiConstants.baseUrl,
      connectTimeout: const Duration(milliseconds: ApiConstants.connectTimeout),
      receiveTimeout: const Duration(milliseconds: ApiConstants.receiveTimeout),
      responseType: ResponseType.json,
      contentType: ApiConstants.contentType,
    );

    // Add interceptors
    _dio.interceptors.add(loggingInterceptor);
    _dio.interceptors.add(authInterceptor);
  }
  /// [handleRequest] Handles network requests that return a single object or primitive value.
  Future<T> handleRequest<T>({
    required HttpMethod httpMethod,
    required String endpoint,
    T Function(Map<String, dynamic>)? fromJson,
    Map<String, dynamic>? queryParameters,
    dynamic data,
    Map<String, List<File>>? fileFields,
  }) async {
    try {
      final Response<dynamic> response = await ApiRequest().sendRequest(
        dio: _dio,
        httpMethod: httpMethod,
        endpoint: endpoint,
        queryParameters: queryParameters,
        data: data,
        fileFields: fileFields,
      );
      return ApiResponse().parseResponse<T>(response: response, fromJson: fromJson);
    } on DioException catch (exception) {
      throw ExceptionHandler.handleDioError(exception);
    } catch (exception) {
      throw UnknownException(message: "Unexpected Error: ${exception.toString()}");
    }
  }

  /// [handleListRequest] network requests that return a list of objects.
  Future<List<T>> handleListRequest<T>({
    required HttpMethod httpMethod,
    required String endpoint,
    T Function(Map<String, dynamic>)? fromJson,
    Map<String, dynamic>? queryParameters,
    dynamic data,
    Map<String, List<File>>? fileFields,
  }) async {
    try {
      final Response<dynamic> response = await ApiRequest().sendRequest(
        dio: _dio,
        httpMethod: httpMethod,
        endpoint: endpoint,
        queryParameters: queryParameters,
        data: data,
        fileFields: fileFields,
      );
      return ApiResponse().parseListResponse<T>(response: response, fromJson: fromJson);
    } on DioException catch (exception) {
      throw ExceptionHandler.handleDioError(exception);
    } catch (exception) {
      throw UnknownException(message: "Unexpected Error: ${exception.toString()}");
    }
  }
}
