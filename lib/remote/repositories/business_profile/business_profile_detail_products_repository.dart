import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../features/business_porfile_detail/models/business_profile_detail_products_response.dart';
import '../../../features/business_porfile_detail/models/business_profile_house_products_response.dart';
import '../../../utils/api_end_points.dart';
import '../../http_client/dio_http_client.dart';
import '../../response_error.dart';

@injectable
class BusinessProfileDetailProductsRepository {
  BusinessProfileDetailProductsRepository({required DioHttpClient client})
      : _client = client;

  final DioHttpClient _client;

  Future<Either<ResponseError<dynamic>, BusinessProfileHouseProductsResponse>>
      getHouseProducts({
    required int categoryId,
    required int shopId,
  }) async {
    return _client
        .get(
          ApiEndpoints.businessProfileHouses(
            categoryId: categoryId,
            shopId: shopId,
          ),
        )
        .then(_onResDetail)
        .catchError(_onErrorDetail);
  }

  Either<ResponseError<dynamic>, BusinessProfileHouseProductsResponse>
      _onResDetail(
    Response<dynamic>? res,
  ) {
    if (!(res?.isSuccessful ?? false)) {
      final err = res?.data as Map<String, dynamic>;
      return left(
        ResponseError.badRequest(err.toString()),
      );
    }

    final response = BusinessProfileHouseProductsResponse.fromJson(
      res?.data as Map<String, dynamic>,
    );

    return right(response);
  }

  Either<ResponseError<dynamic>, BusinessProfileHouseProductsResponse>
      _onErrorDetail(
    dynamic err,
  ) {
    return left(ResponseError.from(err is Object ? err : err.toString()));
  }

  /// [ Business Profile Products ]
  Future<Either<ResponseError<dynamic>, BusinessProfileDetailProductsResponse>>
      getProducts({
    required int shopId,
    required int categoryId,
  }) async {
    return _client
        .get(
          ApiEndpoints.businessProfileProducts(
            categoryId: categoryId,
            shopId: shopId,
          ),
        )
        .then(_onResProducts)
        .catchError(_onErrorProducts);
  }

  Either<ResponseError<dynamic>, BusinessProfileDetailProductsResponse>
      _onResProducts(
    Response<dynamic>? res,
  ) {
    if (!(res?.isSuccessful ?? false)) {
      final err = res?.data as Map<String, dynamic>;
      return left(
        ResponseError.badRequest(err.toString()),
      );
    }

    final response = BusinessProfileDetailProductsResponse.fromJson(
      res?.data as Map<String, dynamic>,
    );

    return right(response);
  }

  Either<ResponseError<dynamic>, BusinessProfileDetailProductsResponse>
      _onErrorProducts(
    dynamic err,
  ) {
    return left(ResponseError.from(err is Object ? err : err.toString()));
  }
}
