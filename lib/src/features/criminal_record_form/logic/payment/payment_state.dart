import 'package:easy_pro/src/datasource/models/payment_request.dart';

abstract class PaymentState {
  final PaymentRequest paymentRequest;

  PaymentState({required this.paymentRequest});
}

class InitialPaymentState extends PaymentState {
  InitialPaymentState({
    required super.paymentRequest,
  });
}

class LoadingPaymentState extends PaymentState {
  LoadingPaymentState({
    required super.paymentRequest,
  });
}

class SuccessPaymentState extends PaymentState {
  SuccessPaymentState({
    required super.paymentRequest,
  });
}

class ErrorPaymentState extends PaymentState {
  final String errorMessage;

  ErrorPaymentState({
    required super.paymentRequest,
    required this.errorMessage,
  });
}
