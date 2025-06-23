import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gen/gen.dart';

import '../../../core/components/small_icon_wrapper.dart';

part 'house_entity.freezed.dart';
part 'house_entity.g.dart';

@freezed
class HouseEntity with _$HouseEntity {
  const factory HouseEntity({
    int? id,
    @JsonKey(name: 'category_name') String? categoryName,
    LocationEntity? location,
    @JsonKey(name: 'user_id') int? userId,
    String? username,
    @JsonKey(name: 'user_phone') String? userPhone,
    String? name,
    String? description,
    String? price,
    @JsonKey(name: 'lover_percentage') String? loverPercentage,
    @JsonKey(name: 'lover_price') String? loverPrice,
    int? viewed,
    String? star,
    @JsonKey(name: 'comment_count') int? commentCount,
    @JsonKey(name: 'room_number') int? roomNumber,
    @JsonKey(name: 'floor_number') int? floorNumber,
    @JsonKey(name: 'property_type') PropertyTypeEntity? propertyType,
    @JsonKey(name: 'repair_type') RepairTypeEntity? repairType,
    String? status,
    bool? luxe,
    @JsonKey(name: 'luxe_status') bool? luxeStatus,
    @JsonKey(name: 'luxe_expire') String? luxeExpire,
    @JsonKey(name: 'vip_status') bool? vipStatus,
    @JsonKey(name: 'vip_expire') String? vipExpire,
    @JsonKey(name: 'bron_number') String? bronNumber,
    List<ImageEntity>? images,
    List<PossibilityEntity>? possibilities,
    int? comment,
    @JsonKey(name: 'is_comment') String? isComment,
    @JsonKey(name: 'write_comment') String? writeComment,
    String? who,
    int? area,
    int? exclusisive,
    String? hashtag,
    @JsonKey(name: 'level_number') int? levelNumber,
    bool? favorited,
    bool? liked,
    ShopEntity? shop,
    String? type,
    String? date,
    @JsonKey(name: 'updated_at') String? updatedAt,
    @JsonKey(name: 'created_at') String? createdAt,
    bool? contact,
  }) = _HouseEntity;

  factory HouseEntity.fromJson(Map<String, dynamic> json) =>
      _$HouseEntityFromJson(json);
}

@freezed
class LocationEntity with _$LocationEntity {
  const factory LocationEntity({
    int? id,
    @JsonKey(name: 'parent_id') int? parentId,
    String? name,
    @JsonKey(name: 'created_at') String? createdAt,
    @JsonKey(name: 'updated_at') String? updatedAt,
    @JsonKey(name: 'parent_name') String? parentName,
  }) = _LocationEntity;

  factory LocationEntity.fromJson(Map<String, dynamic> json) =>
      _$LocationEntityFromJson(json);
}

@freezed
class PropertyTypeEntity with _$PropertyTypeEntity {
  const factory PropertyTypeEntity({
    int? id,
    String? name,
    String? icon,
  }) = _PropertyTypeEntity;

  factory PropertyTypeEntity.fromJson(Map<String, dynamic> json) =>
      _$PropertyTypeEntityFromJson(json);
}

@freezed
class RepairTypeEntity with _$RepairTypeEntity {
  const factory RepairTypeEntity({
    int? id,
    String? name,
    String? icon,
  }) = _RepairTypeEntity;

  factory RepairTypeEntity.fromJson(Map<String, dynamic> json) =>
      _$RepairTypeEntityFromJson(json);
}

@freezed
class ImageEntity with _$ImageEntity {
  const factory ImageEntity({
    String? url,
    String? original,
    String? thumbnail,
    String? watermark,
  }) = _ImageEntity;

  factory ImageEntity.fromJson(Map<String, dynamic> json) =>
      _$ImageEntityFromJson(json);
}

@freezed
class ShopEntity with _$ShopEntity {
  const factory ShopEntity({
    int? id,
    String? brand,
    String? logo,
    String? image,
    String? status,
    String? description,
    @JsonKey(name: 'brief_description') String? briefDescription,
    @JsonKey(name: 'location_id') int? locationId,
    String? expire,
    int? views,
    @JsonKey(name: 'cover_media') String? coverMedia,
    int? rating,
    String? locations,
    @JsonKey(name: 'phone_numbers') String? phoneNumbers,
    @JsonKey(name: 'is_vip') int? isVip,
    @JsonKey(name: 'vip_days') String? vipDays,
    @JsonKey(name: 'vip_expire') String? vipExpire,
    String? site,
    String? messengers,
    String? mail,
    @JsonKey(name: 'created_at') String? createdAt,
    @JsonKey(name: 'updated_at') String? updatedAt,
  }) = _ShopEntity;

  factory ShopEntity.fromJson(Map<String, dynamic> json) =>
      _$ShopEntityFromJson(json);
}

@freezed
class PossibilityEntity with _$PossibilityEntity {
  const factory PossibilityEntity({
    int? id,
    String? name,
  }) = _PossibilityEntity;

  factory PossibilityEntity.fromJson(Map<String, dynamic> json) =>
      _$PossibilityEntityFromJson(json);
}

extension PossibilityIcon on PossibilityEntity {
  Widget buildIcon() {
    switch (name) {
      case 'wifi':
        return SmallIconWrapper(
          icon: Assets.icons.icConnection.svg(package: 'gen'),
        );
      case 'washer':
        return SmallIconWrapper(
          icon: Assets.icons.icWashingMachine.svg(package: 'gen'),
        );

      case 'tv':
        return SmallIconWrapper(
          icon: Assets.icons.icTv.svg(package: 'gen'),
        );
      case 'kitchen':
        return SmallIconWrapper(
          icon: Assets.icons.icDishes.svg(package: 'gen'),
        );
      case 'shower':
        return SmallIconWrapper(
          icon: Assets.icons.icShower.svg(package: 'gen'),
        );
      case 'fridge':
        return SmallIconWrapper(
          icon: Assets.icons.icRefrigerator.svg(package: 'gen'),
        );
      case 'conditioner':
      case 'wardrobe':
      case 'bed':
      case 'hot':
      default:
        return const SizedBox.shrink();
    }
  }
}
