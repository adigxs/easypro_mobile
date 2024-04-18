import 'dart:convert';

class CheckTransactionRequest {
  final String requestCode;

  CheckTransactionRequest({required this.requestCode});

  CheckTransactionRequest copyWith({
    String? requestCode,
  }) {
    return CheckTransactionRequest(
      requestCode: requestCode ?? this.requestCode,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'request_code': requestCode,
    };
  }

  factory CheckTransactionRequest.fromMap(Map<String, dynamic> map) {
    return CheckTransactionRequest(
      requestCode: map['requestCode'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory CheckTransactionRequest.fromJson(String source) =>
      CheckTransactionRequest.fromMap(
          json.decode(source) as Map<String, dynamic>);
}
