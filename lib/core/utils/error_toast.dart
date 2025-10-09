import '../exceptions/exceptions.dart';
/// [ErrorToast] display toast with abstract error messages
class ErrorToast{
  static void toastErrorMessage(dynamic e) {
    if (e is BadRequestException) {
      // Toast.showError(e.message);
    } else if (e is UnauthorizedException) {
      // Toast.showError(e.message);
    } else if (e is ForbiddenException) {
      // Toast.showError(e.message);
    } else if (e is NotFoundException) {
      // Toast.showError(e.message);
    } else if (e is ServerException) {
      // Toast.showError(e.message);
    } else if (e is NetworkException) {
      // Toast.showError(e.message);
    } else if (e is TypeException) {
      // Toast.showError(e.message);
    } else if (e is UnknownException) {
      // Toast.showError(e.message);
    } else if (e is Exception) {
      // Toast.showError(e.toString());
    } else {
      // Toast.showError("An unexpected error occurred");
    }
  }
}