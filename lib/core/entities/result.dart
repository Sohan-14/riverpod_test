import '../exceptions/exceptions.dart';

class Result<T> {
  final T? data;
  final AppException? error;

  bool get isSuccess => error == null;
  bool get isFailure => error != null;

  Result.success(this.data) : error = null;
  Result.failure(this.error) : data = null;

  @override
  String toString() {
    return isSuccess ? 'Success($data)' : 'Failure($error)';
  }
}
