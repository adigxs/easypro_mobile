import 'package:easy_pro/src/datasource/models/api_response.dart';
import 'package:easy_pro/src/datasource/models/criminal_record_response.dart';
import 'package:easy_pro/src/datasource/models/expense_report_response.dart';
import 'package:easy_pro/src/datasource/repositories/criminal_record_repository.dart';
import 'package:easy_pro/src/features/criminal_record_form/logic/criminal_event.dart';
import 'package:easy_pro/src/features/criminal_record_form/logic/criminal_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CriminalBloc extends Bloc<CriminalEvent, CriminalState> {
  final CriminalRecordRepository criminalRecordRepository;

  CriminalBloc({required this.criminalRecordRepository})
      : super(InitialCriminalState(
            expenseResult: ExpenseReportResponse(
                stamp: ExpenseLine(fee: '', quantity: '', total: 'total'),
                disbursement: ExpenseLine(fee: '', quantity: '', total: ''),
                honorary: ExpenseLine(fee: '', quantity: '', total: ''),
                currencyCode: '',
                total: ''),
            criminalRecordResult: CriminalRecordResponse(
              id: 0,
              code: '',
            ))) {
    on<CreateCriminalRecord>((event, emit) async {
      await createRecord(emit: emit, event: event);
    });
    on<OnUploadFile>((event, emit) async {
      await uploadFile(emit: emit, event: event);
    });
    on<DownloadPdf>((event, emit) async {
      await downloadPdf(emit: emit, event: event);
    });
  }

  Future<void> createRecord(
      {required Emitter<CriminalState> emit,
      required CreateCriminalRecord event}) async {
    try {
      emit(LoadingCriminalState(
          expenseResult: state.expenseResult,
          criminalRecordResult: state.criminalRecordResult));
      final response = await criminalRecordRepository.createRecord(
          request: event.criminalRecordRequest);
      if (response.successResponse != null) {
        emit(SuccessCreateCriminalRecordState(
            expenseResult:
                response.successResponse!['expense'] as ExpenseReportResponse,
            criminalRecordResult: response.successResponse!['request']
                as CriminalRecordResponse));
      } else if (response.errorResponse != null) {
        ApiError<dynamic> error = response.errorResponse!;
        emit(ErrorCriminalState(
            expenseResult: state.expenseResult,
            errorMessage: error.message,
            criminalRecordResult: state.criminalRecordResult));
      }
    } catch (e) {
      emit(ErrorCriminalState(
          expenseResult: state.expenseResult,
          errorMessage: '$e',
          criminalRecordResult: state.criminalRecordResult));
    }
  }

  Future<void> uploadFile(
      {required Emitter<CriminalState> emit,
      required OnUploadFile event}) async {
    try {
      emit(LoadingCriminalState(
          expenseResult: state.expenseResult,
          criminalRecordResult: state.criminalRecordResult));
      final response = await criminalRecordRepository.uploadFile(
          request: event.fileUpload, requestId: state.criminalRecordResult.id);
      if (response.successResponse == true) {
        emit(SuccessUploadFileRecordState(
            expenseResult: state.expenseResult,
            criminalRecordResult: state.criminalRecordResult));
      } else if (response.errorResponse != null) {
        ApiError<dynamic> error = response.errorResponse!;
        emit(ErrorCriminalState(
            expenseResult: state.expenseResult,
            errorMessage: error.message,
            criminalRecordResult: state.criminalRecordResult));
      }
    } catch (e) {
      emit(ErrorCriminalState(
          expenseResult: state.expenseResult,
          errorMessage: '$e',
          criminalRecordResult: state.criminalRecordResult));
    }
  }

  Future<void> downloadPdf(
      {required Emitter<CriminalState> emit,
      required DownloadPdf event}) async {
    try {
      emit(LoadingCriminalState(
          expenseResult: state.expenseResult,
          criminalRecordResult: state.criminalRecordResult));
      final response = await criminalRecordRepository.downloadPdf(
          requestCode: state.criminalRecordResult.code,
          requestId: '${state.criminalRecordResult.id}');
      if (response.successResponse == true) {
        emit(SuccessDownloadPdfState(
            expenseResult: state.expenseResult,
            criminalRecordResult: state.criminalRecordResult));
      } else if (response.errorResponse != null) {
        ApiError<dynamic> error = response.errorResponse!;
        emit(ErrorCriminalState(
            expenseResult: state.expenseResult,
            errorMessage: error.message,
            criminalRecordResult: state.criminalRecordResult));
      }
    } catch (e) {
      emit(ErrorCriminalState(
          expenseResult: state.expenseResult,
          errorMessage: '$e',
          criminalRecordResult: state.criminalRecordResult));
    }
  }
}
