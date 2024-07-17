import 'package:dio/dio.dart';
import 'package:easy_pro/src/datasource/models/api_util.dart';
import 'package:file_picker/file_picker.dart';
import 'package:easy_pro/src/datasource/models/api_response.dart';

Future<ApiResponse<String, ApiError>> uploadFile(PlatformFile file) async {
  Dio dio = Dio();
  String url = 'https://files.easyproonline.com/api/v1/upload-file';
  // String url = 'http://192.168.1.104:8003/api/v1/upload-file';
  FormData formData = FormData.fromMap({
    'file': await MultipartFile.fromFile(
      file.path!,
      filename: file.name,
    ),
  });
  print(url);

  try {
    Response response = await dio.post(url, data: formData);
    return ApiResponse.success(
        "https://files.easyproonline.com/uploads/${response.data['data']}");
  } on DioError catch (e) {
    return ApiResponse.error(createApiErrorFromDioError(e));
  } on Exception catch (e) {
    return ApiResponse.error(unknownError(e));
  }
}
