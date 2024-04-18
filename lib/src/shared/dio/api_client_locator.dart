import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:easy_pro/src/datasource/api_client.dart';
import 'package:easy_pro/src/datasource/api_client_configuration.dart';
import 'package:easy_pro/src/network/interceptors/auth_interceptor.dart';
import 'package:easy_pro/src/shared/dio/locator.dart';
import 'package:easy_pro/src/shared/services/preferences_service.dart';
import 'package:easy_pro/src/shared/services/secure_storage.dart';
import 'package:get_it/get_it.dart';

final GetIt apiClientLocator = GetIt.asNewInstance()
  ..registerLazySingleton(() => ApiClientConfiguration())
  ..registerLazySingleton(() {
    return ApiClient(
      dio: apiClientLocator<ApiClientConfiguration>().createDio(
        interceptors: [
          AuthInterceptor(
            preferencesService: locator<PreferencesService>(),
            secureStorage: locator<SecureStorage>(),
          ),
          LogInterceptor(
            responseHeader: false,
            requestBody: true,
            responseBody: true,
            error: true,
            logPrint: (data) => log(data.toString()),
          ),
        ],
      ),
    );
  });
