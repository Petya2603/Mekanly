// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'house_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$HouseDetailResponseImpl _$$HouseDetailResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$HouseDetailResponseImpl(
      data: HouseDetail.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$HouseDetailResponseImplToJson(
        _$HouseDetailResponseImpl instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

_$HouseDetailImpl _$$HouseDetailImplFromJson(Map<String, dynamic> json) =>
    _$HouseDetailImpl(
      id: (json['id'] as num?)?.toInt(),
      categoryId: (json['category_id'] as num?)?.toInt(),
      categoryName: json['category_name'] as String?,
      location: json['location'] == null
          ? null
          : Location.fromJson(json['location'] as Map<String, dynamic>),
      username: json['username'] as String?,
      name: json['name'] as String?,
      description: json['description'] as String?,
      reason: json['reason'] as String?,
      price: json['price'] as String?,
      viewed: (json['viewed'] as num?)?.toInt(),
      star: json['star'] as String?,
      bronNumber: json['bron_number'] as String?,
      roomNumber: (json['room_number'] as num?)?.toInt(),
      floorNumber: (json['floor_number'] as num).toInt(),
      status: json['status'] as String,
      luxe: (json['luxe'] as num).toInt(),
      images: (json['images'] as List<dynamic>)
          .map((e) => HouseImage.fromJson(e as Map<String, dynamic>))
          .toList(),
      possibilities: (json['possibilities'] as List<dynamic>)
          .map((e) => Possibility.fromJson(e as Map<String, dynamic>))
          .toList(),
      comment: (json['comment'] as num).toInt(),
      comments: json['comments'] as List<dynamic>,
      isComment: json['is_comment'],
      who: json['who'],
      area: json['area'],
      exclusisive: (json['exclusisive'] as num).toInt(),
      hashtag: json['hashtag'],
      level_number: json['level_number'],
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
    );

Map<String, dynamic> _$$HouseDetailImplToJson(_$HouseDetailImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'category_id': instance.categoryId,
      'category_name': instance.categoryName,
      'location': instance.location,
      'username': instance.username,
      'name': instance.name,
      'description': instance.description,
      'reason': instance.reason,
      'price': instance.price,
      'viewed': instance.viewed,
      'star': instance.star,
      'bron_number': instance.bronNumber,
      'room_number': instance.roomNumber,
      'floor_number': instance.floorNumber,
      'status': instance.status,
      'luxe': instance.luxe,
      'images': instance.images,
      'possibilities': instance.possibilities,
      'comment': instance.comment,
      'comments': instance.comments,
      'is_comment': instance.isComment,
      'who': instance.who,
      'area': instance.area,
      'exclusisive': instance.exclusisive,
      'hashtag': instance.hashtag,
      'level_number': instance.level_number,
      'updated_at': instance.updatedAt?.toIso8601String(),
      'created_at': instance.createdAt?.toIso8601String(),
    };

_$LocationImpl _$$LocationImplFromJson(Map<String, dynamic> json) =>
    _$LocationImpl(
      id: (json['id'] as num).toInt(),
      parentId: (json['parent_id'] as num).toInt(),
      name: json['name'] as String,
      createdAt: json['created_at'] as String,
      updatedAt: json['updated_at'] as String,
      parentName: json['parent_name'] as String,
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

_$HouseImageImpl _$$HouseImageImplFromJson(Map<String, dynamic> json) =>
    _$HouseImageImpl(
      id: (json['id'] as num).toInt(),
      url: json['url'] as String,
    );

Map<String, dynamic> _$$HouseImageImplToJson(_$HouseImageImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'url': instance.url,
    };

_$PossibilityImpl _$$PossibilityImplFromJson(Map<String, dynamic> json) =>
    _$PossibilityImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
    );

Map<String, dynamic> _$$PossibilityImplToJson(_$PossibilityImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };
