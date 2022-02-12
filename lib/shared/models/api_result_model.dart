class ApiResult<T> {
  ApiResult._();
  factory ApiResult.error(T error) = ErrorState<T>;
  factory ApiResult.success(T value) = SuccessState<T>;
}

class ErrorState<T> extends ApiResult<T> {
  ErrorState(this.error) : super._();
  final T error;
}

class SuccessState<T> extends ApiResult<T> {
  SuccessState(this.value) : super._();
  final T value;
}
