import 'package:easy_pro/src/datasource/api_client.dart';
import 'package:easy_pro/src/datasource/repositories/criminal_record_repository.dart';
import 'package:easy_pro/src/shared/dio/api_client_locator.dart';
import 'package:easy_pro/src/shared/services/authentication_service.dart';
import 'package:easy_pro/src/shared/services/preferences_service.dart';
import 'package:easy_pro/src/shared/services/secure_storage.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:get_it/get_it.dart';

final GetIt locator = GetIt.asNewInstance()
  ..registerLazySingleton<PreferencesService>(() => PreferencesService())
  ..registerLazySingleton(
      () => AuthenticationService(secureStorage: locator<SecureStorage>()))
  ..registerLazySingleton(
    () => SecureStorage(
      storage: FlutterSecureStorage(
        aOptions: AndroidOptions.defaultOptions.copyWith(
          encryptedSharedPreferences: true,
        ),
      ),
    ),
  )
  ..registerLazySingleton(
      () => CriminalRecordRepository(apiClientLocator<ApiClient>()));

  // ..registerLazySingleton(
  //     () => PartnerRepository(apiClientLocator<ApiClient>())
  //     );