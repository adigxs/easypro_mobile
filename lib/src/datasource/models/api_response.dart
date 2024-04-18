class ApiResponse<R, E> {
  final R? successResponse;
  final E? errorResponse;

  ApiResponse.success(this.successResponse) : errorResponse = null;

  ApiResponse.error(this.errorResponse) : successResponse = null;
}

enum ApiErrorType {
  server,
  serialization,
  network,
  unknown,
}

class ApiError<T> {
  final ApiErrorType type;
  final String message;
  final T error;

  ApiError({
    required this.type,
    required this.message,
    required this.error,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ApiError<T> &&
        other.type == type &&
        other.message == message &&
        other.error == error;
  }

  @override
  int get hashCode => type.hashCode ^ message.hashCode ^ error.hashCode;
}
