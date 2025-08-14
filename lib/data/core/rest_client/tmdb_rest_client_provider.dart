import 'package:cinebox5000/config/env.dart';
import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'tmdb_rest_client_provider.g.dart';

@Riverpod(keepAlive: true)
Dio tmdbRestClient(Ref ref) {
  final dio = Dio(
    BaseOptions(
      baseUrl: Env.theMovieDbBaseUrl,
      connectTimeout: const Duration(seconds: 60),
      receiveTimeout: const Duration(seconds: 60),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${Env.theMovieDbApiKey}',
      },
    ),
  );

  dio.interceptors.addAll([
    LogInterceptor(
      request: true,
      requestBody: true,
      requestHeader: false,
      responseBody: true,
      responseHeader: false,
      error: true,
      logPrint: (object) {
        // ignore: avoid_print
        print(object);
      },
    ),
  ]);

  return dio;
}
