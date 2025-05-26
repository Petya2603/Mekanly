import 'package:common/common.dart';

import '../remote/entities/global_options/filter_request.dart';
import '../remote/entities/global_options/global_options.dart';

final class ApiEndpoints {
  ApiEndpoints._();

  /// [ AUTH ENDpoints]
  static String baseUrl = 'https://mekanly.com.tm/api';
  static String login = '/login';
  static String otp = '/checkLogin';
  static String deviceinfo = '/v2/update-device-info';
  static String userProfile = '/v2/user/profile';

  static String banners = '/v2/banners';
  static String topAds = '/v2/top';
  static String globalOptions = '/v2/globalOptions';
  static String houseDetail(int id) => '/v2/house/$id';
  static String addHouse = '/v2/houses/add';
  static String userHouses({
    int limit = 10,
    int offset = 0,
    int? categoryId,
  }) =>
      categoryId == null
          ? '/v2/user/houses?limit=$limit&offset=$offset'
          : '/v2/user/houses?limit=$limit&offset=$offset&category_id=$categoryId';

  static String houses({
    int limit = 10,
    int page = 0,
  }) =>
      '/v2/gethouses/$page/$limit';
  static String filter({
    int limit = 10,
    int page = 0,
    required GlobalOptions filter,
  }) {
    final current = filter.toFilter;

    BaseLogger.info('Filter --> $current');

    if (current == null) {
      return '/v2/filter?offset=$page&limit=$limit';
    }

    return '/v2/filter?$current&offset=$page&limit=$limit';
  }

  static String businessCategories = '/v2/business/categories';
  static String businessProfile(int id) => '/v2/business/profile/$id';

  static String allBusinessProfiles({int limit = 10, int offset = 0}) =>
      '/v2/business/allProfiles/$offset/$limit';
  static String businessSubCategories(int id) => '/v2/business/categories/$id';
  static String businessCategoryProfiles(int id) =>
      '/v2/business/categories/$id/profiles';
}
