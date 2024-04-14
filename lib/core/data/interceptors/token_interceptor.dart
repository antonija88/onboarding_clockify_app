import 'package:dio/dio.dart';

class TokenInterceptor extends QueuedInterceptor {
  static const _apiKey = 'N2FiZThlMWYtOTdjNi00Y2MwLWJmZDEtNGQxNTZjMTNhOGVk';
  TokenInterceptor();

  @override
  Future onRequest(
      RequestOptions options,
      RequestInterceptorHandler handler,
      ) async {
    options.headers.addEntries(
      [],
    );
    options.queryParameters.addEntries([
      const MapEntry<String, String>('appid', _apiKey),
    ]);
    super.onRequest(options, handler);
  }
}
