import 'package:dio/dio.dart';

import '../../header.dart';
import '../../in_memory_token.dart';

class FavoriteService {
  FavoriteService()
      : _dio = Dio(
          BaseOptions(
            baseUrl: 'https://mekanly.com.tm',
            headers: AppHttpHeaders.commonHeaders,
          ),
        )..interceptors.addAll([
            InterceptorsWrapper(
              onRequest: (options, handler) {
                final token = InMemoryToken.instance.token;
                if (token != null) {
                  options.headers['Authorization'] = 'Bearer $token';
                }
                return handler.next(options);
              },
            ),
            LogInterceptor(),
          ]);

  final Dio _dio;

  /// Halanlaryma goşmak ýa-da aýyrmak
  Future<void> toggleFavorite({
    required int favoritableId,
    required String favoritableType,
  }) async {
    try {
      final response = await _dio.post(
        '/api/v2/user/favorites/toggle',
        data: {
          'favoritable_id': favoritableId,
          'favoritable_type': favoritableType,
        },
        options: Options(
          validateStatus: (status) => status != null && status < 500,
        ),
      );

      if (response.statusCode != 200) {
        final message =
            response.data['message']?.toString() ?? 'Ýalňyşlyk ýüze çykdy.';
        throw Exception(message);
      }
    } on DioException catch (e) {
      throw Exception('Toggle favorite failed: ${e.message}');
    }
  }

  Future<Map<String, dynamic>> getFavorites({
    required String type,
    required int limit,
    required int offset,
    int? categoryId,
  }) async {
    try {
      final queryParameters = {
        'type': type,
        'limit': limit.toString(),
        'offset': offset.toString(),
      };
      if (categoryId != null) {
        queryParameters['category_id'] = categoryId.toString();
      }

      final response = await _dio.get(
        '/api/v2/user/favorites',
        queryParameters: queryParameters,
        options: Options(
          validateStatus: (status) => status != null && status < 500,
        ),
      );

      if (response.statusCode == 200) {
        return response.data as Map<String, dynamic>;
      } else {
        final message =
            response.data['message']?.toString() ?? 'Favoriler getirilemedi.';
        throw Exception(message);
      }
    } on DioException catch (e) {
      throw Exception('Favori listesi alınamadı: ${e.message}');
    }
  }
}
