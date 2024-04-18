import 'package:dio/dio.dart';
import 'package:easy_pro/src/datasource/api/criminal_record_controller_api.dart';

class ApiClient {
  final Dio dio;

  ApiClient({
    required this.dio,
  });

  CriminalRecordControllerApi getCriminalRecordController() {
    return CriminalRecordControllerApi(dio);
  }
}
