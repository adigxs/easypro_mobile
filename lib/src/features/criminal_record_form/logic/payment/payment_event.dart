// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:easy_pro/src/datasource/models/payment_request.dart';

abstract class PaymentEvent {}

class OnChangePhonePayment extends PaymentEvent {
  final String phone;
  OnChangePhonePayment({required this.phone});
}

class OnChangePaymentMethode extends PaymentEvent {
  final PaymentMethode paymentMethod;
  OnChangePaymentMethode({
    required this.paymentMethod,
  });
}

class OnCheckoutPayment extends PaymentEvent {
  final String requestCode;
  final String phone;
  final String currencyCode;
  OnCheckoutPayment({
    required this.requestCode,
    required this.phone,
    required this.currencyCode,
  });
}
