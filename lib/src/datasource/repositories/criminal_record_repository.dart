import 'package:easy_pro/src/datasource/api_client.dart';
import 'package:easy_pro/src/datasource/models/api_response.dart';
import 'package:easy_pro/src/datasource/models/check_transaction_request.dart';
import 'package:easy_pro/src/datasource/models/check_transaction_response.dart';
import 'package:easy_pro/src/datasource/models/criminal_record_request.dart';
import 'package:easy_pro/src/datasource/models/file_upload.dart';
import 'package:easy_pro/src/datasource/models/payment_request.dart';

class CriminalRecordRepository {
  final ApiClient _apiClient;

  CriminalRecordRepository(this._apiClient);

  Future<ApiResponse<Map<String, Object?>, ApiError>> createRecord(
      {required CriminalRecordRequest request}) async {
    final response = await _apiClient
        .getCriminalRecordController()
        .createRecord(request: request);
    return response;
  }

  Future<ApiResponse<bool, ApiError>> uploadFile(
      {required FileUpload request, required int requestId}) async {
    final response = await _apiClient
        .getCriminalRecordController()
        .updateFileRecord(request: request, requestId: requestId);
    return response;
  }

  Future<ApiResponse<dynamic, ApiError>> paymentCheckout(
      {required PaymentRequest request}) async {
    final response = await _apiClient
        .getCriminalRecordController()
        .paymentCheckout(request: request);
    return response;
  }

  Future<ApiResponse<CheckTransactionResponse, ApiError>>
      checkTransactionStatus({required CheckTransactionRequest request}) async {
    final response = await _apiClient
        .getCriminalRecordController()
        .checkTransactionStatus(request: request);
    return response;
  }

  Future<ApiResponse<dynamic, ApiError>> checkSucceedtransaction(
      {required String operationId}) async {
    final response = await _apiClient
        .getCriminalRecordController()
        .checkSucceedtransaction(operationId: operationId);
    return response;
  }

  Future<ApiResponse<dynamic, ApiError>> downloadPdf(
      {required String requestId, required String requestCode}) async {
    final response = await _apiClient
        .getCriminalRecordController()
        .downloadPdf(requestCode: requestCode, requestId: requestId);
    return response;
  }
}
