import 'package:dio/dio.dart';

Dio httpClient = Dio(BaseOptions(
  baseUrl: 'myhost',
  connectTimeout: const Duration(seconds: 2),
  sendTimeout: const Duration(seconds: 12),
));
