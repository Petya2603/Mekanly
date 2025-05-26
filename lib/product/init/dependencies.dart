import 'package:dio/dio.dart';

import '../../remote/http_client/dio_http_client.dart';
import '../../remote/http_client/dio_http_client_builder.dart';
import '../../remote/interceptors/http_header_interceptor.dart';
import '../../utils/api_end_points.dart';
import '../../utils/constants.dart';
import '../injection/injector.dart';

class DependencyManager {
  static Future<void> inject() async {
    final dioBuilder = DioHttpClientBuilder()
      ..baseUrl = ApiEndpoints.baseUrl
      ..connectTimeout = AppConstants.connectTimeout
      ..sendTimeout = AppConstants.connectTimeout
      ..receiveTimeout = AppConstants.receiveTimeout;

    final dioClient = dioBuilder.build();

    dioClient.dio.interceptors.addAll(
      [
        LoggerInterceptor(),
        HttpHeaderInterceptor(),
      ],
    );

    injector
      ..registerFactory<DioHttpClient>(() => dioClient)
      ..registerFactory<Dio>(() => dioClient.dio);

    await configureDependencies();
  }
}
