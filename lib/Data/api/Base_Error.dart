class BaseError{
  String? ErrorMessage;
  BaseError({this.ErrorMessage});
}
class ServerError extends BaseError{
  ServerError({required super.ErrorMessage});
}
class NetworkError extends BaseError{
  NetworkError({required super.ErrorMessage});
}