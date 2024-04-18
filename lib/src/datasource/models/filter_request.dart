import 'dart:convert';

class FilterRequest {
  final String regionName;
  final String departmentName;
  final String courtName;
  FilterRequest({
    required this.regionName,
    required this.departmentName,
    required this.courtName,
  });

  FilterRequest copyWith({
    String? regionName,
    String? departmentName,
    String? courtName,
  }) {
    return FilterRequest(
      regionName: regionName ?? this.regionName,
      departmentName: departmentName ?? this.departmentName,
      courtName: courtName ?? this.courtName,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'region_name': regionName,
      'department_name': departmentName,
      'court_name': courtName,
    };
  }

  factory FilterRequest.fromMap(Map<String, dynamic> map) {
    return FilterRequest(
      regionName: map['regionName'] as String,
      departmentName: map['departmentName'] as String,
      courtName: map['courtName'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory FilterRequest.fromJson(String source) =>
      FilterRequest.fromMap(json.decode(source) as Map<String, dynamic>);
}
