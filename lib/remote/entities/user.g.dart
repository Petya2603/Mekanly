// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserImpl _$$UserImplFromJson(Map<String, dynamic> json) => _$UserImpl(
      id: (json['id'] as num).toInt(),
      phone: json['phone'] as String?,
      username: json['username'] as String?,
      role: json['role'] as String?,
      token: json['token'] as String?,
      shopId: (json['shopId'] as num?)?.toInt(),
      vipExpire: json['vipExpire'] == null
          ? null
          : DateTime.parse(json['vipExpire'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
    );

Map<String, dynamic> _$$UserImplToJson(_$UserImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'phone': instance.phone,
      'username': instance.username,
      'role': instance.role,
      'token': instance.token,
      'shopId': instance.shopId,
      'vipExpire': instance.vipExpire?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'created_at': instance.createdAt?.toIso8601String(),
    };
