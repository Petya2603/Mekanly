import 'package:freezed_annotation/freezed_annotation.dart';
part 'business_profile_detail_response.freezed.dart';
part 'business_profile_detail_response.g.dart';

@freezed
class BusinessProfileDetailResponse with _$BusinessProfileDetailResponse {
  const factory BusinessProfileDetailResponse({
    BusinessProfileDetail? data,
  }) = _BusinessProfileDetailResponse;

  factory BusinessProfileDetailResponse.fromJson(Map<String, dynamic> json) =>
      _$BusinessProfileDetailResponseFromJson(json);
}

@freezed
class BusinessProfileDetail with _$BusinessProfileDetail {
  const factory BusinessProfileDetail({
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'brand') String? brand,
    @JsonKey(name: 'logo') String? logo,
    @JsonKey(name: 'image') String? image,
    @JsonKey(name: 'description') String? description,
    @JsonKey(name: 'views') int? views,
    @JsonKey(name: 'cover_media') String? coverMedia,
    @JsonKey(name: 'phone_numbers') String? phoneNumbers,
    @JsonKey(name: 'is_vip') int? isVip,
    @JsonKey(name: 'vip_days') String? vipDays,
    @JsonKey(name: 'site') String? site,
    @JsonKey(name: 'mail') String? mail,
    @JsonKey(name: 'social_profiles') List<dynamic>? socialProfiles,
    @JsonKey(name: 'location') Location? location,
    @JsonKey(name: 'product_count') int? productCount,
    @JsonKey(name: 'products') List<Product>? products,
    @JsonKey(name: 'product_categories')
    List<ProductCategory>? productCategories,
  }) = _BusinessProfileDetail;

  factory BusinessProfileDetail.fromJson(Map<String, dynamic> json) =>
      _$BusinessProfileDetailFromJson(json);
}

@freezed
class Location with _$Location {
  const factory Location({
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'parent_id') int? parentId,
    @JsonKey(name: 'name') String? name,
    @JsonKey(name: 'created_at') String? createdAt,
    @JsonKey(name: 'updated_at') String? updatedAt,
    @JsonKey(name: 'parent_name') String? parentName,
  }) = _Location;

  factory Location.fromJson(Map<String, dynamic> json) =>
      _$LocationFromJson(json);
}

@freezed
class Product with _$Product {
  const factory Product({
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'name') String? name,
    @JsonKey(name: 'user_id') int? userId,
    @JsonKey(name: 'shop_id') int? shopId,
    @JsonKey(name: 'location_id') int? locationId,
    @JsonKey(name: 'category_id') int? categoryId,
    @JsonKey(name: 'price') double? price,
    @JsonKey(name: 'status') String? status,
    @JsonKey(name: 'expire') String? expire,
    @JsonKey(name: 'phone') String? phone,
    @JsonKey(name: 'who') String? who,
    @JsonKey(name: 'delivery') int? delivery,
    @JsonKey(name: 'comment') int? comment,
    @JsonKey(name: 'description') String? description,
    @JsonKey(name: 'brief_description') String? briefDescription,
    @JsonKey(name: 'lover_price') double? loverPrice,
    @JsonKey(name: 'vip') dynamic vip,
    @JsonKey(name: 'exclusive') int? exclusive,
    @JsonKey(name: 'hashtag') String? hashtag,
    @JsonKey(name: 'created_at') String? createdAt,
    @JsonKey(name: 'updated_at') String? updatedAt,
  }) = _Product;

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);
}

@freezed
class ProductCategory with _$ProductCategory {
  const factory ProductCategory({
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'title') String? title,
    @JsonKey(name: 'image') String? image,
    @JsonKey(name: 'parent') List<ParentCategory>? parent,
    @JsonKey(name: 'description') String? description,
  }) = _ProductCategory;

  factory ProductCategory.fromJson(Map<String, dynamic> json) =>
      _$ProductCategoryFromJson(json);
}

@freezed
class ParentCategory with _$ParentCategory {
  const factory ParentCategory({
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'title') String? title,
    @JsonKey(name: 'image') String? image,
    @JsonKey(name: 'parent') dynamic parent,
    @JsonKey(name: 'description') String? description,
  }) = _ParentCategory;

  factory ParentCategory.fromJson(Map<String, dynamic> json) =>
      _$ParentCategoryFromJson(json);
}
