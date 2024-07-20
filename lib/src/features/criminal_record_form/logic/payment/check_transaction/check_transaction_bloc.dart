import 'dart:async';

import 'package:easy_pro/src/datasource/models/api_response.dart';
import 'package:easy_pro/src/datasource/repositories/criminal_record_repository.dart';
import 'package:easy_pro/src/features/criminal_record_form/logic/payment/check_transaction/check_transaction_event.dart';
import 'package:easy_pro/src/features/criminal_record_form/logic/payment/check_transaction/check_transaction_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CheckTransactionBloc
    extends Bloc<CheckTransactionEvent, CheckTransactionState> {
  final CriminalRecordRepository criminalRecordRepository;

  CheckTransactionBloc({required this.criminalRecordRepository})
      : super(InitialCheckTransactionState(operationId: '')) {
    on<OnCheckStatusTransaction>((event, emit) async {
      await checkTransactionStatus(emit: emit, event: event);
    });

    on<OnChangeOperationId>((event, emit) {
      emit(InitialCheckTransactionState(operationId: event.operationId));
    });

    on<OnCheckOperatorStatus>((event, emit) async {
      await checkSucceedtransaction(emit: emit);
    });

    on<OnOtherPayment>((event, emit) async {
      await otherPayment(emit: emit, event: event);
    });
  }

  Future<void> checkTransactionStatus(
      {required Emitter<CheckTransactionState> emit,
      required OnCheckStatusTransaction event}) async {
    emit(LoadingCheckTransactionState(operationId: state.operationId));
    await Future.delayed(const Duration(seconds: 60), () async {
      final response = await criminalRecordRepository.checkTransactionStatus(
          request: event.transaction);

      if (response.successResponse != null) {
        emit(SuccessCheckTransactionState(operationId: state.operationId));
      } else {
        ApiError<dynamic> error = response.errorResponse!;
        emit(ErrorCheckTransactionState(
            operationId: state.operationId, errorMessage: error.message));
      }
    });
    try {} catch (e) {
      emit(ErrorCheckTransactionState(
        operationId: state.operationId,
        errorMessage: '$e',
      ));
    }
  }

  Future<void> checkSucceedtransaction(
      {required Emitter<CheckTransactionState> emit}) async {
    try {
      emit(LoadingSucceedTransactionState(operationId: state.operationId));
      final response = await criminalRecordRepository.checkSucceedtransaction(
          operationId: state.operationId);
      if (response.successResponse == true) {
        emit(SuccessCheckTransactionState(operationId: state.operationId));
      } else {
        ApiError<dynamic> error = response.errorResponse!;
        emit(ErrorSucceedTransactionState(
            operationId: state.operationId, errorMessage: error.message));
      }
    } catch (e) {
      emit(ErrorSucceedTransactionState(
        operationId: state.operationId,
        errorMessage: '$e',
      ));
    }
  }

  Future<void> otherPayment(
      {required Emitter<CheckTransactionState> emit,
      required OnOtherPayment event}) async {
    emit(LoadingOtherMethodState(operationId: state.operationId));
    final response = await criminalRecordRepository.otherPayment(request: {
      "receipt_url": event.receiptUrl,
      "payment_method": "western-union",
      "request_code": event.requestCode
    });

    if (response.successResponse != null) {
      emit(SuccessCheckTransactionState(operationId: state.operationId));
    } else {
      ApiError<dynamic> error = response.errorResponse!;
      emit(ErrorCheckTransactionState(
          operationId: state.operationId, errorMessage: error.message));
    }
    try {} catch (e) {
      emit(ErrorCheckTransactionState(
        operationId: state.operationId,
        errorMessage: '$e',
      ));
    }
  }
}
