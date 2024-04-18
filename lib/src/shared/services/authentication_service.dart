import 'package:easy_pro/src/shared/services/secure_storage.dart';

class AuthenticationService {
  AuthenticationService({
    required this.secureStorage,
  });

  final SecureStorage secureStorage;

  // Future<bool> isConnected() async {
  //   final secrets = await secureStorage.getAccessToken();
  //   // final remember = await secureStorage.getRememberValue();

  //   return secrets != null /* && remember != null*/;
  // }
}
