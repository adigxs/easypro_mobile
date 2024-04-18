// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:easy_pro/src/datasource/models/criminal_record_response.dart';
import 'package:easy_pro/src/datasource/models/expense_report_response.dart';

abstract class CriminalState {
  final CriminalRecordResponse criminalRecordResult;
  final ExpenseReportResponse expenseResult;

  CriminalState(
      {required this.expenseResult, required this.criminalRecordResult});
}

class InitialCriminalState extends CriminalState {
  InitialCriminalState({
    required super.expenseResult,
    required super.criminalRecordResult,
  });
}

class LoadingCriminalState extends CriminalState {
  LoadingCriminalState({
    required super.expenseResult,
    required super.criminalRecordResult,
  });
}

class SuccessCreateCriminalRecordState extends CriminalState {
  SuccessCreateCriminalRecordState({
    required super.expenseResult,
    required super.criminalRecordResult,
  });
}

class SuccessUploadFileRecordState extends CriminalState {
  SuccessUploadFileRecordState({
    required super.expenseResult,
    required super.criminalRecordResult,
  });
}

class SuccessDownloadPdfState extends CriminalState {
  SuccessDownloadPdfState({
    required super.expenseResult,
    required super.criminalRecordResult,
  });
}

class ErrorCriminalState extends CriminalState {
  final String errorMessage;

  ErrorCriminalState({
    required super.expenseResult,
    required super.criminalRecordResult,
    required this.errorMessage,
  });
}
