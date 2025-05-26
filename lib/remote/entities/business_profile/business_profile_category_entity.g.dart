// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'business_profile_category_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BusinessProfileCategoryEntityImpl
    _$$BusinessProfileCategoryEntityImplFromJson(Map<String, dynamic> json) =>
        _$BusinessProfileCategoryEntityImpl(
          id: (json['id'] as num).toInt(),
          title: json['title'] as String?,
          image: json['image'] as String?,
          businessProfiles: (json['business_profiles'] as num?)?.toInt(),
        );

Map<String, dynamic> _$$BusinessProfileCategoryEntityImplToJson(
        _$BusinessProfileCategoryEntityImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'image': instance.image,
      'business_profiles': instance.businessProfiles,
    };
