enum Environment { development, staging, production }

class Env {
  static const Environment currentEnv = Environment.development;

  static String get apiBaseUrl {
    switch (currentEnv) {
      case Environment.staging:
        return "https://staging.api.example.com/";
      case Environment.production:
        return "https://api.example.com/";
      default:
        return "https://dev.api.example.com/";
    }
  }

  static bool get isDebug => currentEnv == Environment.development;
}
