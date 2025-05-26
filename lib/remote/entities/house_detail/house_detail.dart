import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gen/gen.dart';

import '../../../core/components/small_icon_wrapper.dart';

part 'house_detail.freezed.dart';
part 'house_detail.g.dart';

@freezed
class HouseDetailResponse with _$HouseDetailResponse {
  const factory HouseDetailResponse({
    required HouseDetail data,
  }) = _HouseDetailResponse;

  factory HouseDetailResponse.fromJson(Map<String, dynamic> json) =>
      _$HouseDetailResponseFromJson(json);
}

@freezed
class HouseDetail with _$HouseDetail {
  const factory HouseDetail({
    required int? id,
    @JsonKey(name: 'category_id') required int? categoryId,
    @JsonKey(name: 'category_name') required String? categoryName,
    required Location? location,
    required String? username,
    required String? name,
    required String? description,
    String? reason,
    required String? price,
    required int? viewed,
    String? star,
    @JsonKey(name: 'bron_number') required String? bronNumber,
    @JsonKey(name: 'room_number') required int? roomNumber,
    @JsonKey(name: 'floor_number') required int floorNumber,
    required String status,
    required int luxe,
    required List<HouseImage> images,
    required List<Possibility> possibilities,
    required int comment,
    required List<dynamic> comments,
    @JsonKey(name: 'is_comment') dynamic isComment,
    dynamic who,
    dynamic area,
    required int exclusisive,
    dynamic hashtag,
    dynamic level_number,
    @JsonKey(name: 'updated_at') required DateTime? updatedAt,
    @JsonKey(name: 'created_at') required DateTime? createdAt,
  }) = _HouseDetail;

  factory HouseDetail.fromJson(Map<String, dynamic> json) =>
      _$HouseDetailFromJson(json);
}

@freezed
class Location with _$Location {
  const factory Location({
    required int id,
    @JsonKey(name: 'parent_id') required int parentId,
    required String name,
    @JsonKey(name: 'created_at') required String createdAt,
    @JsonKey(name: 'updated_at') required String updatedAt,
    @JsonKey(name: 'parent_name') required String parentName,
  }) = _Location;

  factory Location.fromJson(Map<String, dynamic> json) =>
      _$LocationFromJson(json);
}

@freezed
class HouseImage with _$HouseImage {
  const factory HouseImage({
    required int id,
    required String url,
  }) = _HouseImage;

  factory HouseImage.fromJson(Map<String, dynamic> json) =>
      _$HouseImageFromJson(json);
}

@freezed
class Possibility with _$Possibility {
  const factory Possibility({
    required int id,
    required String name,
  }) = _Possibility;

  factory Possibility.fromJson(Map<String, dynamic> json) =>
      _$PossibilityFromJson(json);
}

extension PossibilityIcon on Possibility {
  Widget get buildIcon {
    switch (id) {
      case 1:
        return OptionPossibilityIconWrapper(
          icon: Assets.icons.icConnection.svg(package: 'gen'),
        );
      case 2:
        return OptionPossibilityIconWrapper(
          icon: Assets.icons.icWashingMachine.svg(package: 'gen'),
        );
      case 3:
        return OptionPossibilityIconWrapper(
          icon: Assets.icons.icTv.svg(package: 'gen'),
        );
      case 4:
        return OptionPossibilityIconWrapper(
          icon: Assets.icons.icFreez.svg(package: 'gen'),
        );
      case 5:
        return OptionPossibilityIconWrapper(
          icon: Assets.icons.icMebel.svg(package: 'gen'),
        );
      case 6:
        return OptionPossibilityIconWrapper(
          icon: Assets.icons.icSpalny.svg(package: 'gen'),
        );
      case 7:
        return OptionPossibilityIconWrapper(
          icon: Assets.icons.icHeating.svg(package: 'gen'),
        );
      case 8:
        return OptionPossibilityIconWrapper(
          icon: Assets.icons.icRefrigerator.svg(package: 'gen'),
        );
      case 9:
        return OptionPossibilityIconWrapper(
          icon: Assets.icons.icBath.svg(package: 'gen'),
        );
      case 10:
        return OptionPossibilityIconWrapper(
          icon: Assets.icons.icDishes.svg(package: 'gen'),
        );
      default:
        return const Text('No option icon available');
    }
  }
}

extension PossibilityTitle on Possibility {
  String get title {
    switch (id) {
      case 1:
        return 'Wi-Fi';
      case 2:
        return 'Kir maşyn';
      case 3:
        return 'Telewizor';
      case 4:
        return 'Kondisioner';
      case 5:
        return 'Mebel-şkaf';
      case 6:
        return 'Spalny';
      case 7:
        return 'Peç';
      case 8:
        return 'Sowadyjy';
      case 9:
        return 'Duş';
      case 10:
        return 'Aşhana';
      default:
        return 'No option icon available';
    }
  }
}
