import 'dart:convert';

class CriminalRecordResponse {
  final int id;
  final String code;

  CriminalRecordResponse({
    required this.id,
    required this.code,
  });

  CriminalRecordResponse copyWith({
    int? id,
    String? code,
  }) {
    return CriminalRecordResponse(
      id: id ?? this.id,
      code: code ?? this.code,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'code': code,
    };
  }

  factory CriminalRecordResponse.fromMap(Map<String, dynamic> map) {
    return CriminalRecordResponse(
      id: map['id'] as int,
      code: map['code'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory CriminalRecordResponse.fromJson(String source) =>
      CriminalRecordResponse.fromMap(
          json.decode(source) as Map<String, dynamic>);
}
