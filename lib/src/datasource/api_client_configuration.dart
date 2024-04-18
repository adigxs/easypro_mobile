import 'package:dio/dio.dart';
import 'package:easy_pro/src/core/environment.dart';

class ApiClientConfiguration {
  Dio createDio({List<Interceptor> interceptors = const []}) {
    final Dio dio = Dio(
      BaseOptions(
        baseUrl: Environment.apiBaseUrl,
        headers: {'Content-Type': 'application/json'},
      ),
    );

    dio.interceptors.addAll(interceptors);

    return dio;
  }
}
