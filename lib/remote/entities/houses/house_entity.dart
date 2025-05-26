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
    Location? location,
    @JsonKey(name: 'user_id') int? userId,
    String? username,
    @JsonKey(name: 'user_phone') String? userPhone,
    String? name,
    String? description,
    String? price,
    int? viewed,
    int? star,
    @JsonKey(name: 'comment_count') int? commentCount,
    @JsonKey(name: 'room_number') int? roomNumber,
    @JsonKey(name: 'floor_number') int? floorNumber,
    @JsonKey(name: 'property_type') PropertyType? propertyType,
    @JsonKey(name: 'repair_type') RepairType? repairType,
    String? status,
    bool? luxe,
    @JsonKey(name: 'luxe_status') bool? luxeStatus,
    @JsonKey(name: 'luxe_expire') DateTime? luxeExpire,
    @JsonKey(name: 'vip_status') bool? vipStatus,
    @JsonKey(name: 'vip_expire') DateTime? vipExpire,
    @JsonKey(name: 'bron_number') String? bronNumber,
    List<ImageUrl>? images,
    List<Possibility>? possibilities,
    int? comment,
    @JsonKey(name: 'is_comment') dynamic isComment,
    String? who,
    int? area,
    int? exclusisive,
    String? hashtag,
    @JsonKey(name: 'level_number') int? levelNumber,
    bool? favorited,
    bool? liked,
    dynamic shop,
    String? type,
    DateTime? date,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
    @JsonKey(name: 'created_at') DateTime? createdAt,
  }) = _HouseEntity;

  factory HouseEntity.fromJson(Map<String, dynamic> json) =>
      _$HouseEntityFromJson(json);
}

@freezed
class Location with _$Location {
  const factory Location({
    int? id,
    @JsonKey(name: 'parent_id') int? parentId,
    String? name,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
    @JsonKey(name: 'parent_name') String? parentName,
  }) = _Location;

  factory Location.fromJson(Map<String, dynamic> json) =>
      _$LocationFromJson(json);
}

@freezed
class PropertyType with _$PropertyType {
  const factory PropertyType({
    int? id,
    String? name,
    String? icon,
  }) = _PropertyType;

  factory PropertyType.fromJson(Map<String, dynamic> json) =>
      _$PropertyTypeFromJson(json);
}

@freezed
class RepairType with _$RepairType {
  const factory RepairType({
    int? id,
    String? name,
    String? icon,
  }) = _RepairType;

  factory RepairType.fromJson(Map<String, dynamic> json) =>
      _$RepairTypeFromJson(json);
}

@freezed
class ImageUrl with _$ImageUrl {
  const factory ImageUrl({
    String? url,
  }) = _ImageUrl;

  factory ImageUrl.fromJson(Map<String, dynamic> json) =>
      _$ImageUrlFromJson(json);
}

@freezed
class Possibility with _$Possibility {
  const factory Possibility({
    int? id,
    String? name,
  }) = _Possibility;

  factory Possibility.fromJson(Map<String, dynamic> json) =>
      _$PossibilityFromJson(json);
}
extension PossibilityIcon on Possibility {
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
