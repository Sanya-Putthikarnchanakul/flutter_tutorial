class AppConfig {
  static const bool useMitmProxy = bool.fromEnvironment(
    'useMitmProxy',
    defaultValue: false,
  );
  static const String proxyUrl = String.fromEnvironment(
    'proxyUrl',
    defaultValue: '10.0.0.2',
  );
  static const int proxyPort = int.fromEnvironment(
    'proxyPort',
    defaultValue: 8080,
  );
}
