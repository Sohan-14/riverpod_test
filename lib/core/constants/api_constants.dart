/// [ApiConstants] API related constants
class ApiConstants {
  ApiConstants._();
  static const String baseUrl = 'https://d7003.sobhoy.com/api/v1';
  static const String imageBaseUrl = 'https://d7003.sobhoy.com';
  static const int connectTimeout = 30000; // milliseconds
  static const int receiveTimeout = 30000; // milliseconds
  static const String contentType = 'application/json';
  static const String authHeaderKey = 'Authorization';
  static const String bearerPrefix = 'Bearer ';
}