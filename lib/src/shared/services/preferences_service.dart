import 'package:shared_preferences/shared_preferences.dart';

class PreferencesService {
  late final SharedPreferences preferences;

  Future<void> init() async {
    preferences = await SharedPreferences.getInstance();
  }

  // void setUserProfile(UserResponse profile) {
  //   preferences.setString(userProfileStorageKey, jsonEncode(profile));
  // }

  // UserResponse getUserProfile() {
  //   return UserResponse.fromJson(
  //       jsonDecode(preferences.getString(userProfileStorageKey)!));
  // }

  // void removeUserProfile() {
  //   preferences.remove(userProfileStorageKey);
  // }

  // UserResponse getWenddingProfile() {
  //   return UserResponse.fromJson(
  //       jsonDecode(preferences.getString(wenddingStorageKey)!));
  // }

  // static const userProfileStorageKey = 'user-profile-key';
}
