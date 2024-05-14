// import 'package:flutter/foundation.dart';

enum EnvironmentType {
  agent('agent'),
  user('user');

  final String envString;
  const EnvironmentType(this.envString);
}

class Environment {
  static final EnvironmentType environment = () {
    const env = String.fromEnvironment('environment');
    if (env == EnvironmentType.agent.envString) {
      return EnvironmentType.agent;
    }

    return EnvironmentType.user;
  }();

  // static bool get isDevEnvironment =>
  //     Environment.environment == EnvironmentType.user || kDebugMode;

  static const String apiBaseUrl = String.fromEnvironment('API_URL');
  static const String enterPoint = String.fromEnvironment('ENTER_POINT');
  static const String apiFile = String.fromEnvironment('API_FILE');
}
