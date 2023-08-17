import 'package:dio/dio.dart';

Dio httpClient = Dio(
  BaseOptions(
    baseUrl: 'https://api.github.com',
    connectTimeout: const Duration(seconds: 12),
    sendTimeout: const Duration(seconds: 12),
    headers: {
      "Authorization":
          "Bearer <your personal github's fina grained token here>",
    },
  ),
);
