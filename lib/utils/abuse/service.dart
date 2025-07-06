import 'package:dio/dio.dart';

import '../../remote/header.dart';
import '../../remote/in_memory_token.dart' show InMemoryToken;
import '../api_end_points.dart';
import 'model.dart';

class AbuseService {
  final Dio _dio;

  AbuseService()
      : _dio = Dio(BaseOptions(
          baseUrl: ApiEndpoints.baseUrl,
          headers: {
            ...AppHttpHeaders.commonHeaders,
            AppHttpHeaders.authorizationHeader:
                'Bearer ${InMemoryToken.instance.token ?? ''}',
          },
        ));

  Future<List<AbuseReason>> getReasons() async {
    final response = await _dio.get(ApiEndpoints.abuseList);
    if (response.statusCode == 200) {
      final data = response.data['data'] as List<dynamic>;
      return data
          .map((json) => AbuseReason.fromJson(json as Map<String, dynamic>))
          .toList();
    } else {
      throw Exception('Sebäpler getirilmeli başarısız');
    }
  }

  Future<void> sendReason({
    required int abuseListId,
    required int itemId,
    required String message,
    required String type,
  }) async {
    final response = await _dio.post(
      '/api/v2/user/abuse/message',
      queryParameters: {
        'abuse_list_id': abuseListId,
        'item_id': itemId,
        'message': message,
        'type': type,
      },
    );

    if (response.statusCode != 200) {
      throw Exception('Sebep gönderme başarısız');
    }
  }
}
