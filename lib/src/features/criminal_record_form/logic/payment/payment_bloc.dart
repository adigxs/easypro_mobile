import 'dart:async';

import 'package:easy_pro/src/datasource/models/api_response.dart';
import 'package:easy_pro/src/datasource/models/payment_request.dart';
import 'package:easy_pro/src/datasource/repositories/criminal_record_repository.dart';
import 'package:easy_pro/src/features/criminal_record_form/logic/payment/payment_event.dart';
import 'package:easy_pro/src/features/criminal_record_form/logic/payment/payment_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PaymentBloc extends Bloc<PaymentEvent, PaymentState> {
  final CriminalRecordRepository criminalRecordRepository;
  late Timer timer;

  PaymentBloc({required this.criminalRecordRepository})
      : super(InitialPaymentState(
            paymentRequest: PaymentRequest(
                requestCode: '',
                phone: '',
                paymentMethod: PaymentMethode.orange,
                currencyCode: "XAF"))) {
    on<OnChangePaymentMethode>((event, emit) {
      emit(InitialPaymentState(
          paymentRequest: state.paymentRequest
              .copyWith(paymentMethod: event.paymentMethod)));
    });
    on<OnChangePhonePayment>((event, emit) {
      emit(InitialPaymentState(
          paymentRequest: state.paymentRequest.copyWith(phone: event.phone)));
    });
    on<OnCheckoutPayment>((event, emit) async {
      await paymentCheckout(emit: emit, event: event);
    });
  }

  Future<void> paymentCheckout(
      {required Emitter<PaymentState> emit,
      required OnCheckoutPayment event}) async {
    try {
      emit(LoadingPaymentState(paymentRequest: state.paymentRequest));
      final response = await criminalRecordRepository.paymentCheckout(
          request: state.paymentRequest.copyWith(
              requestCode: event.requestCode,
              currencyCode: event.currencyCode));
      if (response.successResponse == true) {
        emit(SuccessPaymentState(paymentRequest: state.paymentRequest));
      } else {
        ApiError<dynamic> error = response.errorResponse!;
        emit(ErrorPaymentState(
            errorMessage: error.message, paymentRequest: state.paymentRequest));
      }
    } catch (e) {
      emit(ErrorPaymentState(
          errorMessage: '$e', paymentRequest: state.paymentRequest));
    }
  }
}
