import '../exceptions/exceptions.dart';
/// [ErrorMessage] organized the error message for display
class ErrorMessage {
  ErrorMessage._();
  static String errorMessage(dynamic e) {
    if (e is BadRequestException) {
      return e.message;
    } else if (e is UnauthorizedException) {
      return e.message;
    } else if (e is ForbiddenException) {
      return e.message;
    } else if (e is NotFoundException) {
      return e.message;
    } else if (e is ServerException) {
      return e.message;
    } else if (e is NetworkException) {
      return e.message;
    } else if (e is TypeException) {
      return e.message;
    } else if (e is UnknownException) {
      return e.message;
    } else {
      return "An unexpected error occurred";
    }
  }
}
