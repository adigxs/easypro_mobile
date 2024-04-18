import 'dart:io';

import 'package:dio/dio.dart';
import 'package:easy_pro/src/shared/services/preferences_service.dart';
import 'package:easy_pro/src/shared/services/secure_storage.dart';

class AuthInterceptor extends InterceptorsWrapper {
  final PreferencesService preferencesService;
  final SecureStorage secureStorage;

  AuthInterceptor({
    required this.preferencesService,
    required this.secureStorage,
  });

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    // final accessToken = await secureStorage.getAccessToken();
    // if (accessToken != null) {
    //   options.headers.putIfAbsent(
    //       authorizationHeader, () => 'Bearer ${accessToken.accessToken}');
    // }
    // options.headers.putIfAbsent(authorizationHeader,
    //     () => 'Bearer 3d991027120715ba13ddbc894f0182bc14781796');

    handler.next(options);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    if (err.response?.statusCode == HttpStatus.unauthorized) {}
    super.onError(err, handler);
  }

  static const String authorizationHeader = 'Authorization';
}
