class ApiConstants {
  // Prevent instantiation
  ApiConstants._();

  // Base URLs
  static const String baseUrl = 'http://192.168.2.160:8080/api/v1';
  static const String stagingUrl = 'https://staging-api.example.com/v1';

  // Endpoints
  static const String login = '/auth/login';
  static const String register = '/auth/register';
  static const String userProfile = '/user/profile';
  static const String products = '/products';
  static const String entries = '/entries';
  static const String getTodayEntries = '/entries/today';

  // Headers
  static const String contentType = 'application/json';
  static const String accept = 'application/json';

  // Timeouts (in milliseconds or seconds)
  static const int connectTimeout = 30000;
  static const int receiveTimeout = 30000;
}
