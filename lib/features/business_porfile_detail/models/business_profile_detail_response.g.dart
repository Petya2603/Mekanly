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
              : BusinessProfileDetail.fromJson(
                  json['data'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$$BusinessProfileDetailResponseImplToJson(
        _$BusinessProfileDetailResponseImpl instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

_$BusinessProfileDetailImpl _$$BusinessProfileDetailImplFromJson(
        Map<String, dynamic> json) =>
    _$BusinessProfileDetailImpl(
      id: (json['id'] as num?)?.toInt(),
      brand: json['brand'] as String?,
      logo: json['logo'] as String?,
      image: json['image'] as String?,
      description: json['description'] as String?,
      views: (json['views'] as num?)?.toInt(),
      coverMedia: json['cover_media'] as String?,
      phoneNumbers: json['phone_numbers'] as String?,
      isVip: (json['is_vip'] as num?)?.toInt(),
      vipDays: json['vip_days'] as String?,
      site: json['site'] as String?,
      mail: json['mail'] as String?,
      socialProfiles: json['social_profiles'] as List<dynamic>?,
      location: json['location'] == null
          ? null
          : Location.fromJson(json['location'] as Map<String, dynamic>),
      productCount: (json['product_count'] as num?)?.toInt(),
      products: (json['products'] as List<dynamic>?)
          ?.map((e) => Product.fromJson(e as Map<String, dynamic>))
          .toList(),
      productCategories: (json['product_categories'] as List<dynamic>?)
          ?.map((e) => ProductCategory.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$BusinessProfileDetailImplToJson(
        _$BusinessProfileDetailImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'brand': instance.brand,
      'logo': instance.logo,
      'image': instance.image,
      'description': instance.description,
      'views': instance.views,
      'cover_media': instance.coverMedia,
      'phone_numbers': instance.phoneNumbers,
      'is_vip': instance.isVip,
      'vip_days': instance.vipDays,
      'site': instance.site,
      'mail': instance.mail,
      'social_profiles': instance.socialProfiles,
      'location': instance.location,
      'product_count': instance.productCount,
      'products': instance.products,
      'product_categories': instance.productCategories,
    };

_$LocationImpl _$$LocationImplFromJson(Map<String, dynamic> json) =>
    _$LocationImpl(
      id: (json['id'] as num?)?.toInt(),
      parentId: (json['parent_id'] as num?)?.toInt(),
      name: json['name'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      parentName: json['parent_name'] as String?,
    );

Map<String, dynamic> _$$LocationImplToJson(_$LocationImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'parent_id': instance.parentId,
      'name': instance.name,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'parent_name': instance.parentName,
    };

_$ProductImpl _$$ProductImplFromJson(Map<String, dynamic> json) =>
    _$ProductImpl(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      userId: (json['user_id'] as num?)?.toInt(),
      shopId: (json['shop_id'] as num?)?.toInt(),
      locationId: (json['location_id'] as num?)?.toInt(),
      categoryId: (json['category_id'] as num?)?.toInt(),
      price: (json['price'] as num?)?.toDouble(),
      status: json['status'] as String?,
      expire: json['expire'] as String?,
      phone: json['phone'] as String?,
      who: json['who'] as String?,
      delivery: (json['delivery'] as num?)?.toInt(),
      comment: (json['comment'] as num?)?.toInt(),
      description: json['description'] as String?,
      briefDescription: json['brief_description'] as String?,
      loverPrice: (json['lover_price'] as num?)?.toDouble(),
      vip: json['vip'],
      exclusive: (json['exclusive'] as num?)?.toInt(),
      hashtag: json['hashtag'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
    );

Map<String, dynamic> _$$ProductImplToJson(_$ProductImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'user_id': instance.userId,
      'shop_id': instance.shopId,
      'location_id': instance.locationId,
      'category_id': instance.categoryId,
      'price': instance.price,
      'status': instance.status,
      'expire': instance.expire,
      'phone': instance.phone,
      'who': instance.who,
      'delivery': instance.delivery,
      'comment': instance.comment,
      'description': instance.description,
      'brief_description': instance.briefDescription,
      'lover_price': instance.loverPrice,
      'vip': instance.vip,
      'exclusive': instance.exclusive,
      'hashtag': instance.hashtag,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };

_$ProductCategoryImpl _$$ProductCategoryImplFromJson(
        Map<String, dynamic> json) =>
    _$ProductCategoryImpl(
      id: (json['id'] as num?)?.toInt(),
      title: json['title'] as String?,
      image: json['image'] as String?,
      parent: (json['parent'] as List<dynamic>?)
          ?.map((e) => ParentCategory.fromJson(e as Map<String, dynamic>))
          .toList(),
      description: json['description'] as String?,
    );

Map<String, dynamic> _$$ProductCategoryImplToJson(
        _$ProductCategoryImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'image': instance.image,
      'parent': instance.parent,
      'description': instance.description,
    };

_$ParentCategoryImpl _$$ParentCategoryImplFromJson(Map<String, dynamic> json) =>
    _$ParentCategoryImpl(
      id: (json['id'] as num?)?.toInt(),
      title: json['title'] as String?,
      image: json['image'] as String?,
      parent: json['parent'],
      description: json['description'] as String?,
    );

Map<String, dynamic> _$$ParentCategoryImplToJson(
        _$ParentCategoryImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'image': instance.image,
      'parent': instance.parent,
      'description': instance.description,
    };
