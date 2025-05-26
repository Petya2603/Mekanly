// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'house_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$HouseEntityImpl _$$HouseEntityImplFromJson(Map<String, dynamic> json) =>
    _$HouseEntityImpl(
      id: (json['id'] as num?)?.toInt(),
      categoryName: json['category_name'] as String?,
      location: json['location'] == null
          ? null
          : Location.fromJson(json['location'] as Map<String, dynamic>),
      userId: (json['user_id'] as num?)?.toInt(),
      username: json['username'] as String?,
      userPhone: json['user_phone'] as String?,
      name: json['name'] as String?,
      description: json['description'] as String?,
      price: json['price'] as String?,
      viewed: (json['viewed'] as num?)?.toInt(),
      star: (json['star'] as num?)?.toInt(),
      commentCount: (json['comment_count'] as num?)?.toInt(),
      roomNumber: (json['room_number'] as num?)?.toInt(),
      floorNumber: (json['floor_number'] as num?)?.toInt(),
      propertyType: json['property_type'] == null
          ? null
          : PropertyType.fromJson(
              json['property_type'] as Map<String, dynamic>),
      repairType: json['repair_type'] == null
          ? null
          : RepairType.fromJson(json['repair_type'] as Map<String, dynamic>),
      status: json['status'] as String?,
      luxe: json['luxe'] as bool?,
      luxeStatus: json['luxe_status'] as bool?,
      luxeExpire: json['luxe_expire'] == null
          ? null
          : DateTime.parse(json['luxe_expire'] as String),
      vipStatus: json['vip_status'] as bool?,
      vipExpire: json['vip_expire'] == null
          ? null
          : DateTime.parse(json['vip_expire'] as String),
      bronNumber: json['bron_number'] as String?,
      images: (json['images'] as List<dynamic>?)
          ?.map((e) => ImageUrl.fromJson(e as Map<String, dynamic>))
          .toList(),
      possibilities: (json['possibilities'] as List<dynamic>?)
          ?.map((e) => Possibility.fromJson(e as Map<String, dynamic>))
          .toList(),
      comment: (json['comment'] as num?)?.toInt(),
      isComment: json['is_comment'],
      who: json['who'] as String?,
      area: (json['area'] as num?)?.toInt(),
      exclusisive: (json['exclusisive'] as num?)?.toInt(),
      hashtag: json['hashtag'] as String?,
      levelNumber: (json['level_number'] as num?)?.toInt(),
      favorited: json['favorited'] as bool?,
      liked: json['liked'] as bool?,
      shop: json['shop'],
      type: json['type'] as String?,
      date:
          json['date'] == null ? null : DateTime.parse(json['date'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
    );

Map<String, dynamic> _$$HouseEntityImplToJson(_$HouseEntityImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'category_name': instance.categoryName,
      'location': instance.location,
      'user_id': instance.userId,
      'username': instance.username,
      'user_phone': instance.userPhone,
      'name': instance.name,
      'description': instance.description,
      'price': instance.price,
      'viewed': instance.viewed,
      'star': instance.star,
      'comment_count': instance.commentCount,
      'room_number': instance.roomNumber,
      'floor_number': instance.floorNumber,
      'property_type': instance.propertyType,
      'repair_type': instance.repairType,
      'status': instance.status,
      'luxe': instance.luxe,
      'luxe_status': instance.luxeStatus,
      'luxe_expire': instance.luxeExpire?.toIso8601String(),
      'vip_status': instance.vipStatus,
      'vip_expire': instance.vipExpire?.toIso8601String(),
      'bron_number': instance.bronNumber,
      'images': instance.images,
      'possibilities': instance.possibilities,
      'comment': instance.comment,
      'is_comment': instance.isComment,
      'who': instance.who,
      'area': instance.area,
      'exclusisive': instance.exclusisive,
      'hashtag': instance.hashtag,
      'level_number': instance.levelNumber,
      'favorited': instance.favorited,
      'liked': instance.liked,
      'shop': instance.shop,
      'type': instance.type,
      'date': instance.date?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'created_at': instance.createdAt?.toIso8601String(),
    };

_$LocationImpl _$$LocationImplFromJson(Map<String, dynamic> json) =>
    _$LocationImpl(
      id: (json['id'] as num?)?.toInt(),
      parentId: (json['parent_id'] as num?)?.toInt(),
      name: json['name'] as String?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      parentName: json['parent_name'] as String?,
    );

Map<String, dynamic> _$$LocationImplToJson(_$LocationImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'parent_id': instance.parentId,
      'name': instance.name,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'parent_name': instance.parentName,
    };

_$PropertyTypeImpl _$$PropertyTypeImplFromJson(Map<String, dynamic> json) =>
    _$PropertyTypeImpl(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      icon: json['icon'] as String?,
    );

Map<String, dynamic> _$$PropertyTypeImplToJson(_$PropertyTypeImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'icon': instance.icon,
    };

_$RepairTypeImpl _$$RepairTypeImplFromJson(Map<String, dynamic> json) =>
    _$RepairTypeImpl(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      icon: json['icon'] as String?,
    );

Map<String, dynamic> _$$RepairTypeImplToJson(_$RepairTypeImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'icon': instance.icon,
    };

_$ImageUrlImpl _$$ImageUrlImplFromJson(Map<String, dynamic> json) =>
    _$ImageUrlImpl(
      url: json['url'] as String?,
    );

Map<String, dynamic> _$$ImageUrlImplToJson(_$ImageUrlImpl instance) =>
    <String, dynamic>{
      'url': instance.url,
    };

_$PossibilityImpl _$$PossibilityImplFromJson(Map<String, dynamic> json) =>
    _$PossibilityImpl(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
    );

Map<String, dynamic> _$$PossibilityImplToJson(_$PossibilityImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };
