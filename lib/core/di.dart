import 'package:dio/dio.dart';
import 'package:flutter_loggy_dio/flutter_loggy_dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:onboarding_clockify_app/core/data/clients/api_client.dart';

final _dioProvider = Provider.family<Dio, String>((ref, baseUrl) {
  final dio = Dio(
    BaseOptions(baseUrl: baseUrl, headers: {'x-api-key': 'N2FiZThlMWYtOTdjNi00Y2MwLWJmZDEtNGQxNTZjMTNhOGVk'}),
  )..interceptors.add(LoggyDioInterceptor(requestBody: true, requestHeader: true));
  // dio.interceptors.addAll([TokenInterceptor()]);
  return dio;
});

final apiClientProvider = Provider<ApiClient>(
  (ref) {
    return ApiClient(
      ref.watch(_dioProvider('https://api.clockify.me/api/v1/workspaces/6606d0807288ae7525947b02')),
    );
  },
);

final projectIdProvider = Provider<String>((ref) {
  return '660d73198fe56064c26a59aa';
});
