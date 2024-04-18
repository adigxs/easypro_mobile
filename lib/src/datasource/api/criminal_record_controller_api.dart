import 'package:easy_pro/src/datasource/models/check_transaction_request.dart';
import 'package:easy_pro/src/datasource/models/check_transaction_response.dart';
import 'package:dio/dio.dart';
import 'package:easy_pro/src/datasource/models/api_response.dart';
import 'package:easy_pro/src/datasource/models/api_util.dart';
import 'package:easy_pro/src/datasource/models/criminal_record_request.dart';
import 'package:easy_pro/src/datasource/models/criminal_record_response.dart';
import 'package:easy_pro/src/datasource/models/expense_report_response.dart';
import 'package:easy_pro/src/datasource/models/file_upload.dart';
import 'package:easy_pro/src/datasource/models/payment_request.dart';
import 'package:path_provider/path_provider.dart';
import 'package:open_file/open_file.dart';

class CriminalRecordControllerApi {
  final Dio _dio;

  CriminalRecordControllerApi(this._dio);

  Future<ApiResponse<Map<String, dynamic>, ApiError>> createRecord(
      {required CriminalRecordRequest request}) async {
    try {
      final Response<Map<String, Object?>> response =
          await _dio.post('/requests/', data: request.toJson());
      return ApiResponse.success({
        "request": CriminalRecordResponse.fromMap(
            response.data!['request'] as Map<String, dynamic>),
        "expense": ExpenseReportResponse.fromMap(
            response.data!['expense_report'] as Map<String, dynamic>)
      });
    } on DioError catch (e) {
      return ApiResponse.error(createApiErrorFromDioError(e));
    } on Exception catch (e) {
      return ApiResponse.error(unknownError(e));
    }
  }

  Future<ApiResponse<bool, ApiError>> updateFileRecord(
      {required FileUpload request, required int requestId}) async {
    try {
      await _dio.patch('/requests/$requestId/', data: request.toJson());
      return ApiResponse.success(true);
    } on DioError catch (e) {
      return ApiResponse.error(createApiErrorFromDioError(e));
    } on Exception catch (e) {
      return ApiResponse.error(unknownError(e));
    }
  }

  Future<ApiResponse<dynamic, ApiError>> paymentCheckout(
      {required PaymentRequest request}) async {
    try {
      await _dio.post('/api/payment/checkout/', data: request.toJson());
      return ApiResponse.success(true);
    } on DioError catch (e) {
      return ApiResponse.error(createApiErrorFromDioError(e));
    } on Exception catch (e) {
      return ApiResponse.error(unknownError(e));
    }
  }

  Future<ApiResponse<bool, ApiError>> downloadPdf(
      {required String requestId, required String requestCode}) async {
    try {
      final String fileName = 'Bill N° $requestCode.pdf';
      final String savePath =
          '${(await getTemporaryDirectory()).path}/$fileName';
      await _dio.download('/api/payment/render_pdf_view/$requestId', savePath);
      await OpenFile.open(savePath);
      return ApiResponse.success(true);
    } on DioError catch (e) {
      return ApiResponse.error(createApiErrorFromDioError(e));
    } on Exception catch (e) {
      return ApiResponse.error(unknownError(e));
    }
  }

  Future<ApiResponse<CheckTransactionResponse, ApiError>>
      checkTransactionStatus({required CheckTransactionRequest request}) async {
    try {
      final Response<Map<String, Object?>> response = await _dio.request(
          '/api/payment/check_transaction_status',
          queryParameters: request.toMap(),
          options: Options(method: "GET"));
      return ApiResponse.success(CheckTransactionResponse.fromMap(
          response.data as Map<String, dynamic>));
    } on DioError catch (e) {
      return ApiResponse.error(createApiErrorFromDioError(e));
    } on Exception catch (e) {
      return ApiResponse.error(unknownError(e));
    }
  }

  Future<ApiResponse<dynamic, ApiError>> checkSucceedtransaction(
      {required String operationId}) async {
    try {
      await _dio.request('api/payment/check_succeeded_transaction_status',
          queryParameters: {"operator_tx_id": operationId},
          options: Options(method: "GET"));
      return ApiResponse.success(true);
    } on DioError catch (e) {
      return ApiResponse.error(createApiErrorFromDioError(e));
    } on Exception catch (e) {
      return ApiResponse.error(unknownError(e));
    }
  }
}
