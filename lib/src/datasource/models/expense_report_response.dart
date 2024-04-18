import 'dart:convert';

class ExpenseLine {
  final dynamic fee;
  final dynamic quantity;
  final dynamic total;

  ExpenseLine({
    required this.fee,
    required this.quantity,
    required this.total,
  });

  ExpenseLine copyWith({
    String? fee,
    String? total,
    int? quantity,
  }) {
    return ExpenseLine(
      fee: fee ?? this.fee,
      quantity: quantity ?? this.quantity,
      total: total ?? this.total,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'fee': fee,
      'quantity': quantity,
      'total': total,
    };
  }

  factory ExpenseLine.fromMap(Map<String, dynamic> map) {
    return ExpenseLine(
      fee: map['fee'],
      quantity: map['quantity'],
      total: map['total'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ExpenseLine.fromJson(String source) =>
      ExpenseLine.fromMap(json.decode(source) as Map<String, dynamic>);
}

class ExpenseReportResponse {
  final ExpenseLine stamp;
  final ExpenseLine disbursement;
  final ExpenseLine honorary;
  final String currencyCode;
  final String total;

  ExpenseReportResponse({
    required this.stamp,
    required this.disbursement,
    required this.honorary,
    required this.currencyCode,
    required this.total,
  });

  ExpenseReportResponse copyWith(
      {ExpenseLine? stamp,
      ExpenseLine? disbursement,
      ExpenseLine? honorary,
      String? total,
      String? currencyCode}) {
    return ExpenseReportResponse(
      stamp: stamp ?? this.stamp,
      disbursement: disbursement ?? this.disbursement,
      honorary: honorary ?? this.honorary,
      currencyCode: currencyCode ?? this.currencyCode,
      total: total ?? this.total,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'stamp': stamp.toMap(),
      'disbursement': disbursement.toMap(),
      'honorary': honorary,
      'currency_code': currencyCode,
      'total': total,
    };
  }

  factory ExpenseReportResponse.fromMap(Map<String, dynamic> map) {
    return ExpenseReportResponse(
      stamp: ExpenseLine.fromMap(map['stamp'] as Map<String, dynamic>),
      disbursement:
          ExpenseLine.fromMap(map['disbursement'] as Map<String, dynamic>),
      honorary: ExpenseLine.fromMap(map['honorary'] as Map<String, dynamic>),
      currencyCode: map['currency_code'] as String,
      total: map['total'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ExpenseReportResponse.fromJson(String source) =>
      ExpenseReportResponse.fromMap(
          json.decode(source) as Map<String, dynamic>);
}
