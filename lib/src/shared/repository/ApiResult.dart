/// Class that stores the result of a service call.
class ApiResult<T> {
  /// Timeout value for back requests.
  static const int TIMEOUT_SECONDS_VALUE = 10;

  /// Mapped response.
  T? responseObject;

  /// Error messages of the response.
  String? error;

  /// Error messages object.
  T? errorType;

  /// Class constructor.
  ApiResult({this.responseObject, this.error});
}
