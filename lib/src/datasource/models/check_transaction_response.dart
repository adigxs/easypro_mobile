import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class CheckTransactionResponse {
  final String status;

  CheckTransactionResponse({required this.status});

  CheckTransactionResponse copyWith({
    String? status,
  }) {
    return CheckTransactionResponse(
      status: status ?? this.status,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'status': status,
    };
  }

  factory CheckTransactionResponse.fromMap(Map<String, dynamic> map) {
    return CheckTransactionResponse(
      status: map['status'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory CheckTransactionResponse.fromJson(String source) =>
      CheckTransactionResponse.fromMap(
          json.decode(source) as Map<String, dynamic>);
}
