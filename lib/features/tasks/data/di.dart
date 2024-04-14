import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:onboarding_clockify_app/core/data/clients/api_client.dart';

final _dioProvider = Provider.family<Dio, String>((ref, baseUrl) {
  final dio = Dio(
      // BaseOptions(baseUrl: baseUrl, headers: ),
      );
  // dio.interceptors.addAll([TokenInterceptor()]);
  return dio;
});

final apiClientProvider = Provider<ApiClient>(
  (ref) {
    return ApiClient(
      ref.watch(_dioProvider('https://api.clockify.me/api')),
    );
  },
);
