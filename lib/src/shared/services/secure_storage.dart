import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  final FlutterSecureStorage storage;
  SecureStorage({
    required this.storage,
  });

  Future<void> saveLanguage(String value) async {
    await storage.write(key: languagePrefs, value: value);
  }

  Future<String?> getLanguageValue() async {
    final data = await storage.read(key: languagePrefs);
    return data;
  }

  static const String languagePrefs = 'language-prefs';

  // Future<void> saveAccessToken(UserSecrets secrets) async {
  //   await storage.write(key: accessToken, value: jsonEncode(secrets.toJson()));
  // }

  // Future<void> saveRemember(String value) async {
  //   await storage.write(key: isRememberMe, value: value);
  // }

  // Future<UserSecrets?> getAccessToken() async {
  //   final rawData = await storage.read(key: accessToken);
  //   if (rawData == null) {
  //     return null;
  //   }

  //   return UserSecrets.fromJson(jsonDecode(rawData));
  // }

  // Future<String?> getRememberValue() async {
  //   final data = await storage.read(key: isRememberMe);
  //   return data;
  // }

  // Future<void> removeAccessToken() async {
  //   await storage.delete(key: accessToken);
  // }

  // Future<void> removeRememberToken() async {
  //   await storage.delete(key: isRememberMe);
  // }

  // Future<void> setUserProfile(UserResponse profile) async {
  //   await storage.write(key: userProfileStorageKey, value: jsonEncode(profile));
  // }

  // Future<UserResponse?> getUserProfile() async {
  //   final rawData = await storage.read(key: userProfileStorageKey);
  //   if (rawData == null) {
  //     return null;
  //   }

  //   return UserResponse.fromJson(jsonDecode(rawData));
  // }

  // Future<void> removeUserProfile() async {
  //   await storage.delete(key: userProfileStorageKey);
  // }

  // static const String accessToken = 'access-token';
  // static const String isRememberMe = 'remember-me';
  // static const userProfileStorageKey = 'user-profile-key';
}
