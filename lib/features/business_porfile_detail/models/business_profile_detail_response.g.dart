// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'business_profile_detail_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BusinessProfileDetailResponseImpl
    _$$BusinessProfileDetailResponseImplFromJson(Map<String, dynamic> json) =>
        _$BusinessProfileDetailResponseImpl(
          data: json['data'] == null
              ? null
              : BusinessProfileData.fromJson(
                  json['data'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$$BusinessProfileDetailResponseImplToJson(
        _$BusinessProfileDetailResponseImpl instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

_$BusinessProfileDataImpl _$$BusinessProfileDataImplFromJson(
        Map<String, dynamic> json) =>
    _$BusinessProfileDataImpl(
      id: (json['id'] as num?)?.toInt(),
      brand: json['brand'] as String?,
      logo: json['logo'] as String?,
      image: json['image'] as String?,
      description: json['description'] as String?,
      briefDescription: json['brief_description'] as String?,
      views: (json['views'] as num?)?.toInt(),
      coverMedia: json['cover_media'] as String?,
      phoneNumbers: (json['phone_numbers'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      vipStatus: json['vip_status'] as bool?,
      site: json['site'] as String?,
      mail: json['mail'] as String?,
      socialProfiles: (json['social_profiles'] as List<dynamic>?)
          ?.map((e) => SocialProfile.fromJson(e as Map<String, dynamic>))
          .toList(),
      location: (json['location'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      productCount: (json['product_count'] as num?)?.toInt(),
      productCategories: (json['product_categories'] as List<dynamic>?)
          ?.map((e) => ProductCategory.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$BusinessProfileDataImplToJson(
        _$BusinessProfileDataImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'brand': instance.brand,
      'logo': instance.logo,
      'image': instance.image,
      'description': instance.description,
      'brief_description': instance.briefDescription,
      'views': instance.views,
      'cover_media': instance.coverMedia,
      'phone_numbers': instance.phoneNumbers,
      'vip_status': instance.vipStatus,
      'site': instance.site,
      'mail': instance.mail,
      'social_profiles': instance.socialProfiles,
      'location': instance.location,
      'product_count': instance.productCount,
      'product_categories': instance.productCategories,
    };

_$SocialProfileImpl _$$SocialProfileImplFromJson(Map<String, dynamic> json) =>
    _$SocialProfileImpl(
      sociableId: (json['sociable_id'] as num?)?.toInt(),
      platform: json['platform'] as String?,
      url: json['url'] as String?,
    );

Map<String, dynamic> _$$SocialProfileImplToJson(_$SocialProfileImpl instance) =>
    <String, dynamic>{
      'sociable_id': instance.sociableId,
      'platform': instance.platform,
      'url': instance.url,
    };

_$ProductCategoryImpl _$$ProductCategoryImplFromJson(
        Map<String, dynamic> json) =>
    _$ProductCategoryImpl(
      id: (json['id'] as num?)?.toInt(),
      title: json['title'] as String?,
      image: json['image'] as String?,
      parent: json['parent'] == null
          ? null
          : ProductCategoryParent.fromJson(
              json['parent'] as Map<String, dynamic>),
      description: json['description'] as String?,
      productsCount: (json['products_count'] as num?)?.toInt(),
      type: json['type'] as String?,
      parentId: (json['parent_id'] as num?)?.toInt(),
      name: json['name'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
    );

Map<String, dynamic> _$$ProductCategoryImplToJson(
        _$ProductCategoryImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'image': instance.image,
      'parent': instance.parent,
      'description': instance.description,
      'products_count': instance.productsCount,
      'type': instance.type,
      'parent_id': instance.parentId,
      'name': instance.name,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };

_$ProductCategoryParentImpl _$$ProductCategoryParentImplFromJson(
        Map<String, dynamic> json) =>
    _$ProductCategoryParentImpl(
      id: (json['id'] as num?)?.toInt(),
      title: json['title'] as String?,
      image: json['image'] as String?,
      parent: json['parent'] == null
          ? null
          : ProductCategoryParent.fromJson(
              json['parent'] as Map<String, dynamic>),
      description: json['description'] as String?,
    );

Map<String, dynamic> _$$ProductCategoryParentImplToJson(
        _$ProductCategoryParentImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'image': instance.image,
      'parent': instance.parent,
      'description': instance.description,
    };
