/// Class that stores the result of a service call.
class ApiResult<T> {
  /// Timeout value for back requests.
  static const int TIMEOUT_SECONDS_VALUE = 10;

  /// Mapped response.
  T? responseObject;

  /// Messages of the response.
  String? message;

  /// Error object.
  T? error;

  /// Class constructor.
  ApiResult({this.responseObject, this.message});
}
