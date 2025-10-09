/// [ApiConstants] API related constants
class ApiConstants {
  ApiConstants._();
  static const String baseUrl = 'https://api.example.com/api/v1';
  static const String imageBaseUrl = 'https://api.example.com';
  static const int connectTimeout = 30000; // milliseconds
  static const int receiveTimeout = 30000; // milliseconds
  static const String contentType = 'application/json';
  static const String authHeaderKey = 'Authorization';
  static const String bearerPrefix = 'Bearer ';
}