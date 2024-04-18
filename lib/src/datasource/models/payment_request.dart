import 'dart:convert';

enum PaymentMethode {
  orange('orange-money'),
  mtn('mtn-momo');

  final String payment;
  const PaymentMethode(this.payment);
}

class PaymentRequest {
  final String requestCode;
  final String phone;
  final PaymentMethode paymentMethod;
  final String currencyCode;
  PaymentRequest({
    required this.requestCode,
    required this.phone,
    required this.paymentMethod,
    required this.currencyCode,
  });

  PaymentRequest copyWith({
    String? requestCode,
    String? phone,
    PaymentMethode? paymentMethod,
    String? currencyCode,
  }) {
    return PaymentRequest(
      requestCode: requestCode ?? this.requestCode,
      phone: phone ?? this.phone,
      paymentMethod: paymentMethod ?? this.paymentMethod,
      currencyCode: currencyCode ?? this.currencyCode,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'request_code': requestCode,
      'phone': phone,
      'payment_method': paymentMethod.payment,
      'currency_code': currencyCode,
    };
  }

  String toJson() => json.encode(toMap());
}
