import 'package:dio/dio.dart';
import 'package:easy_pro/src/core/environment.dart';
import 'package:easy_pro/src/datasource/models/api_util.dart';
import 'package:file_picker/file_picker.dart';
import 'package:easy_pro/src/datasource/models/api_response.dart';

Future<ApiResponse<String, ApiError>> uploadFile(PlatformFile file) async {
  Dio dio = Dio();
  String url = '${Environment.apiFile}/upload-file';

  FormData formData = FormData.fromMap({
    'file': await MultipartFile.fromFile(
      file.path!,
      filename: file.name,
    ),
  });

  try {
    Response response = await dio.post(url, data: formData);
    return ApiResponse.success(
        "${Environment.apiFile}/uploads/${response.data['data']}");
  } on DioError catch (e) {
    return ApiResponse.error(createApiErrorFromDioError(e));
  } on Exception catch (e) {
    return ApiResponse.error(unknownError(e));
  }
}