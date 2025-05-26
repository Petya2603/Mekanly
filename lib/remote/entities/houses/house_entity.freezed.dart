// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'house_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

HouseEntity _$HouseEntityFromJson(Map<String, dynamic> json) {
  return _HouseEntity.fromJson(json);
}

/// @nodoc
mixin _$HouseEntity {
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'category_name')
  String? get categoryName => throw _privateConstructorUsedError;
  Location? get location => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_id')
  int? get userId => throw _privateConstructorUsedError;
  String? get username => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_phone')
  String? get userPhone => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get price => throw _privateConstructorUsedError;
  int? get viewed => throw _privateConstructorUsedError;
  int? get star => throw _privateConstructorUsedError;
  @JsonKey(name: 'comment_count')
  int? get commentCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'room_number')
  int? get roomNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'floor_number')
  int? get floorNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'property_type')
  PropertyType? get propertyType => throw _privateConstructorUsedError;
  @JsonKey(name: 'repair_type')
  RepairType? get repairType => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  bool? get luxe => throw _privateConstructorUsedError;
  @JsonKey(name: 'luxe_status')
  bool? get luxeStatus => throw _privateConstructorUsedError;
  @JsonKey(name: 'luxe_expire')
  DateTime? get luxeExpire => throw _privateConstructorUsedError;
  @JsonKey(name: 'vip_status')
  bool? get vipStatus => throw _privateConstructorUsedError;
  @JsonKey(name: 'vip_expire')
  DateTime? get vipExpire => throw _privateConstructorUsedError;
  @JsonKey(name: 'bron_number')
  String? get bronNumber => throw _privateConstructorUsedError;
  List<ImageUrl>? get images => throw _privateConstructorUsedError;
  List<Possibility>? get possibilities => throw _privateConstructorUsedError;
  int? get comment => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_comment')
  dynamic get isComment => throw _privateConstructorUsedError;
  String? get who => throw _privateConstructorUsedError;
  int? get area => throw _privateConstructorUsedError;
  int? get exclusisive => throw _privateConstructorUsedError;
  String? get hashtag => throw _privateConstructorUsedError;
  @JsonKey(name: 'level_number')
  int? get levelNumber => throw _privateConstructorUsedError;
  bool? get favorited => throw _privateConstructorUsedError;
  bool? get liked => throw _privateConstructorUsedError;
  dynamic get shop => throw _privateConstructorUsedError;
  String? get type => throw _privateConstructorUsedError;
  DateTime? get date => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime? get createdAt => throw _privateConstructorUsedError;

  /// Serializes this HouseEntity to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of HouseEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HouseEntityCopyWith<HouseEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HouseEntityCopyWith<$Res> {
  factory $HouseEntityCopyWith(
          HouseEntity value, $Res Function(HouseEntity) then) =
      _$HouseEntityCopyWithImpl<$Res, HouseEntity>;
  @useResult
  $Res call(
      {int? id,
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
      @JsonKey(name: 'created_at') DateTime? createdAt});

  $LocationCopyWith<$Res>? get location;
  $PropertyTypeCopyWith<$Res>? get propertyType;
  $RepairTypeCopyWith<$Res>? get repairType;
}

/// @nodoc
class _$HouseEntityCopyWithImpl<$Res, $Val extends HouseEntity>
    implements $HouseEntityCopyWith<$Res> {
  _$HouseEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HouseEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? categoryName = freezed,
    Object? location = freezed,
    Object? userId = freezed,
    Object? username = freezed,
    Object? userPhone = freezed,
    Object? name = freezed,
    Object? description = freezed,
    Object? price = freezed,
    Object? viewed = freezed,
    Object? star = freezed,
    Object? commentCount = freezed,
    Object? roomNumber = freezed,
    Object? floorNumber = freezed,
    Object? propertyType = freezed,
    Object? repairType = freezed,
    Object? status = freezed,
    Object? luxe = freezed,
    Object? luxeStatus = freezed,
    Object? luxeExpire = freezed,
    Object? vipStatus = freezed,
    Object? vipExpire = freezed,
    Object? bronNumber = freezed,
    Object? images = freezed,
    Object? possibilities = freezed,
    Object? comment = freezed,
    Object? isComment = freezed,
    Object? who = freezed,
    Object? area = freezed,
    Object? exclusisive = freezed,
    Object? hashtag = freezed,
    Object? levelNumber = freezed,
    Object? favorited = freezed,
    Object? liked = freezed,
    Object? shop = freezed,
    Object? type = freezed,
    Object? date = freezed,
    Object? updatedAt = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      categoryName: freezed == categoryName
          ? _value.categoryName
          : categoryName // ignore: cast_nullable_to_non_nullable
              as String?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as Location?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int?,
      username: freezed == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      userPhone: freezed == userPhone
          ? _value.userPhone
          : userPhone // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String?,
      viewed: freezed == viewed
          ? _value.viewed
          : viewed // ignore: cast_nullable_to_non_nullable
              as int?,
      star: freezed == star
          ? _value.star
          : star // ignore: cast_nullable_to_non_nullable
              as int?,
      commentCount: freezed == commentCount
          ? _value.commentCount
          : commentCount // ignore: cast_nullable_to_non_nullable
              as int?,
      roomNumber: freezed == roomNumber
          ? _value.roomNumber
          : roomNumber // ignore: cast_nullable_to_non_nullable
              as int?,
      floorNumber: freezed == floorNumber
          ? _value.floorNumber
          : floorNumber // ignore: cast_nullable_to_non_nullable
              as int?,
      propertyType: freezed == propertyType
          ? _value.propertyType
          : propertyType // ignore: cast_nullable_to_non_nullable
              as PropertyType?,
      repairType: freezed == repairType
          ? _value.repairType
          : repairType // ignore: cast_nullable_to_non_nullable
              as RepairType?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      luxe: freezed == luxe
          ? _value.luxe
          : luxe // ignore: cast_nullable_to_non_nullable
              as bool?,
      luxeStatus: freezed == luxeStatus
          ? _value.luxeStatus
          : luxeStatus // ignore: cast_nullable_to_non_nullable
              as bool?,
      luxeExpire: freezed == luxeExpire
          ? _value.luxeExpire
          : luxeExpire // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      vipStatus: freezed == vipStatus
          ? _value.vipStatus
          : vipStatus // ignore: cast_nullable_to_non_nullable
              as bool?,
      vipExpire: freezed == vipExpire
          ? _value.vipExpire
          : vipExpire // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      bronNumber: freezed == bronNumber
          ? _value.bronNumber
          : bronNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      images: freezed == images
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as List<ImageUrl>?,
      possibilities: freezed == possibilities
          ? _value.possibilities
          : possibilities // ignore: cast_nullable_to_non_nullable
              as List<Possibility>?,
      comment: freezed == comment
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as int?,
      isComment: freezed == isComment
          ? _value.isComment
          : isComment // ignore: cast_nullable_to_non_nullable
              as dynamic,
      who: freezed == who
          ? _value.who
          : who // ignore: cast_nullable_to_non_nullable
              as String?,
      area: freezed == area
          ? _value.area
          : area // ignore: cast_nullable_to_non_nullable
              as int?,
      exclusisive: freezed == exclusisive
          ? _value.exclusisive
          : exclusisive // ignore: cast_nullable_to_non_nullable
              as int?,
      hashtag: freezed == hashtag
          ? _value.hashtag
          : hashtag // ignore: cast_nullable_to_non_nullable
              as String?,
      levelNumber: freezed == levelNumber
          ? _value.levelNumber
          : levelNumber // ignore: cast_nullable_to_non_nullable
              as int?,
      favorited: freezed == favorited
          ? _value.favorited
          : favorited // ignore: cast_nullable_to_non_nullable
              as bool?,
      liked: freezed == liked
          ? _value.liked
          : liked // ignore: cast_nullable_to_non_nullable
              as bool?,
      shop: freezed == shop
          ? _value.shop
          : shop // ignore: cast_nullable_to_non_nullable
              as dynamic,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }

  /// Create a copy of HouseEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LocationCopyWith<$Res>? get location {
    if (_value.location == null) {
      return null;
    }

    return $LocationCopyWith<$Res>(_value.location!, (value) {
      return _then(_value.copyWith(location: value) as $Val);
    });
  }

  /// Create a copy of HouseEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PropertyTypeCopyWith<$Res>? get propertyType {
    if (_value.propertyType == null) {
      return null;
    }

    return $PropertyTypeCopyWith<$Res>(_value.propertyType!, (value) {
      return _then(_value.copyWith(propertyType: value) as $Val);
    });
  }

  /// Create a copy of HouseEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RepairTypeCopyWith<$Res>? get repairType {
    if (_value.repairType == null) {
      return null;
    }

    return $RepairTypeCopyWith<$Res>(_value.repairType!, (value) {
      return _then(_value.copyWith(repairType: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$HouseEntityImplCopyWith<$Res>
    implements $HouseEntityCopyWith<$Res> {
  factory _$$HouseEntityImplCopyWith(
          _$HouseEntityImpl value, $Res Function(_$HouseEntityImpl) then) =
      __$$HouseEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
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
      @JsonKey(name: 'created_at') DateTime? createdAt});

  @override
  $LocationCopyWith<$Res>? get location;
  @override
  $PropertyTypeCopyWith<$Res>? get propertyType;
  @override
  $RepairTypeCopyWith<$Res>? get repairType;
}

/// @nodoc
class __$$HouseEntityImplCopyWithImpl<$Res>
    extends _$HouseEntityCopyWithImpl<$Res, _$HouseEntityImpl>
    implements _$$HouseEntityImplCopyWith<$Res> {
  __$$HouseEntityImplCopyWithImpl(
      _$HouseEntityImpl _value, $Res Function(_$HouseEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of HouseEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? categoryName = freezed,
    Object? location = freezed,
    Object? userId = freezed,
    Object? username = freezed,
    Object? userPhone = freezed,
    Object? name = freezed,
    Object? description = freezed,
    Object? price = freezed,
    Object? viewed = freezed,
    Object? star = freezed,
    Object? commentCount = freezed,
    Object? roomNumber = freezed,
    Object? floorNumber = freezed,
    Object? propertyType = freezed,
    Object? repairType = freezed,
    Object? status = freezed,
    Object? luxe = freezed,
    Object? luxeStatus = freezed,
    Object? luxeExpire = freezed,
    Object? vipStatus = freezed,
    Object? vipExpire = freezed,
    Object? bronNumber = freezed,
    Object? images = freezed,
    Object? possibilities = freezed,
    Object? comment = freezed,
    Object? isComment = freezed,
    Object? who = freezed,
    Object? area = freezed,
    Object? exclusisive = freezed,
    Object? hashtag = freezed,
    Object? levelNumber = freezed,
    Object? favorited = freezed,
    Object? liked = freezed,
    Object? shop = freezed,
    Object? type = freezed,
    Object? date = freezed,
    Object? updatedAt = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_$HouseEntityImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      categoryName: freezed == categoryName
          ? _value.categoryName
          : categoryName // ignore: cast_nullable_to_non_nullable
              as String?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as Location?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int?,
      username: freezed == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      userPhone: freezed == userPhone
          ? _value.userPhone
          : userPhone // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String?,
      viewed: freezed == viewed
          ? _value.viewed
          : viewed // ignore: cast_nullable_to_non_nullable
              as int?,
      star: freezed == star
          ? _value.star
          : star // ignore: cast_nullable_to_non_nullable
              as int?,
      commentCount: freezed == commentCount
          ? _value.commentCount
          : commentCount // ignore: cast_nullable_to_non_nullable
              as int?,
      roomNumber: freezed == roomNumber
          ? _value.roomNumber
          : roomNumber // ignore: cast_nullable_to_non_nullable
              as int?,
      floorNumber: freezed == floorNumber
          ? _value.floorNumber
          : floorNumber // ignore: cast_nullable_to_non_nullable
              as int?,
      propertyType: freezed == propertyType
          ? _value.propertyType
          : propertyType // ignore: cast_nullable_to_non_nullable
              as PropertyType?,
      repairType: freezed == repairType
          ? _value.repairType
          : repairType // ignore: cast_nullable_to_non_nullable
              as RepairType?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      luxe: freezed == luxe
          ? _value.luxe
          : luxe // ignore: cast_nullable_to_non_nullable
              as bool?,
      luxeStatus: freezed == luxeStatus
          ? _value.luxeStatus
          : luxeStatus // ignore: cast_nullable_to_non_nullable
              as bool?,
      luxeExpire: freezed == luxeExpire
          ? _value.luxeExpire
          : luxeExpire // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      vipStatus: freezed == vipStatus
          ? _value.vipStatus
          : vipStatus // ignore: cast_nullable_to_non_nullable
              as bool?,
      vipExpire: freezed == vipExpire
          ? _value.vipExpire
          : vipExpire // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      bronNumber: freezed == bronNumber
          ? _value.bronNumber
          : bronNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      images: freezed == images
          ? _value._images
          : images // ignore: cast_nullable_to_non_nullable
              as List<ImageUrl>?,
      possibilities: freezed == possibilities
          ? _value._possibilities
          : possibilities // ignore: cast_nullable_to_non_nullable
              as List<Possibility>?,
      comment: freezed == comment
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as int?,
      isComment: freezed == isComment
          ? _value.isComment
          : isComment // ignore: cast_nullable_to_non_nullable
              as dynamic,
      who: freezed == who
          ? _value.who
          : who // ignore: cast_nullable_to_non_nullable
              as String?,
      area: freezed == area
          ? _value.area
          : area // ignore: cast_nullable_to_non_nullable
              as int?,
      exclusisive: freezed == exclusisive
          ? _value.exclusisive
          : exclusisive // ignore: cast_nullable_to_non_nullable
              as int?,
      hashtag: freezed == hashtag
          ? _value.hashtag
          : hashtag // ignore: cast_nullable_to_non_nullable
              as String?,
      levelNumber: freezed == levelNumber
          ? _value.levelNumber
          : levelNumber // ignore: cast_nullable_to_non_nullable
              as int?,
      favorited: freezed == favorited
          ? _value.favorited
          : favorited // ignore: cast_nullable_to_non_nullable
              as bool?,
      liked: freezed == liked
          ? _value.liked
          : liked // ignore: cast_nullable_to_non_nullable
              as bool?,
      shop: freezed == shop
          ? _value.shop
          : shop // ignore: cast_nullable_to_non_nullable
              as dynamic,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$HouseEntityImpl implements _HouseEntity {
  const _$HouseEntityImpl(
      {this.id,
      @JsonKey(name: 'category_name') this.categoryName,
      this.location,
      @JsonKey(name: 'user_id') this.userId,
      this.username,
      @JsonKey(name: 'user_phone') this.userPhone,
      this.name,
      this.description,
      this.price,
      this.viewed,
      this.star,
      @JsonKey(name: 'comment_count') this.commentCount,
      @JsonKey(name: 'room_number') this.roomNumber,
      @JsonKey(name: 'floor_number') this.floorNumber,
      @JsonKey(name: 'property_type') this.propertyType,
      @JsonKey(name: 'repair_type') this.repairType,
      this.status,
      this.luxe,
      @JsonKey(name: 'luxe_status') this.luxeStatus,
      @JsonKey(name: 'luxe_expire') this.luxeExpire,
      @JsonKey(name: 'vip_status') this.vipStatus,
      @JsonKey(name: 'vip_expire') this.vipExpire,
      @JsonKey(name: 'bron_number') this.bronNumber,
      final List<ImageUrl>? images,
      final List<Possibility>? possibilities,
      this.comment,
      @JsonKey(name: 'is_comment') this.isComment,
      this.who,
      this.area,
      this.exclusisive,
      this.hashtag,
      @JsonKey(name: 'level_number') this.levelNumber,
      this.favorited,
      this.liked,
      this.shop,
      this.type,
      this.date,
      @JsonKey(name: 'updated_at') this.updatedAt,
      @JsonKey(name: 'created_at') this.createdAt})
      : _images = images,
        _possibilities = possibilities;

  factory _$HouseEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$HouseEntityImplFromJson(json);

  @override
  final int? id;
  @override
  @JsonKey(name: 'category_name')
  final String? categoryName;
  @override
  final Location? location;
  @override
  @JsonKey(name: 'user_id')
  final int? userId;
  @override
  final String? username;
  @override
  @JsonKey(name: 'user_phone')
  final String? userPhone;
  @override
  final String? name;
  @override
  final String? description;
  @override
  final String? price;
  @override
  final int? viewed;
  @override
  final int? star;
  @override
  @JsonKey(name: 'comment_count')
  final int? commentCount;
  @override
  @JsonKey(name: 'room_number')
  final int? roomNumber;
  @override
  @JsonKey(name: 'floor_number')
  final int? floorNumber;
  @override
  @JsonKey(name: 'property_type')
  final PropertyType? propertyType;
  @override
  @JsonKey(name: 'repair_type')
  final RepairType? repairType;
  @override
  final String? status;
  @override
  final bool? luxe;
  @override
  @JsonKey(name: 'luxe_status')
  final bool? luxeStatus;
  @override
  @JsonKey(name: 'luxe_expire')
  final DateTime? luxeExpire;
  @override
  @JsonKey(name: 'vip_status')
  final bool? vipStatus;
  @override
  @JsonKey(name: 'vip_expire')
  final DateTime? vipExpire;
  @override
  @JsonKey(name: 'bron_number')
  final String? bronNumber;
  final List<ImageUrl>? _images;
  @override
  List<ImageUrl>? get images {
    final value = _images;
    if (value == null) return null;
    if (_images is EqualUnmodifiableListView) return _images;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<Possibility>? _possibilities;
  @override
  List<Possibility>? get possibilities {
    final value = _possibilities;
    if (value == null) return null;
    if (_possibilities is EqualUnmodifiableListView) return _possibilities;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final int? comment;
  @override
  @JsonKey(name: 'is_comment')
  final dynamic isComment;
  @override
  final String? who;
  @override
  final int? area;
  @override
  final int? exclusisive;
  @override
  final String? hashtag;
  @override
  @JsonKey(name: 'level_number')
  final int? levelNumber;
  @override
  final bool? favorited;
  @override
  final bool? liked;
  @override
  final dynamic shop;
  @override
  final String? type;
  @override
  final DateTime? date;
  @override
  @JsonKey(name: 'updated_at')
  final DateTime? updatedAt;
  @override
  @JsonKey(name: 'created_at')
  final DateTime? createdAt;

  @override
  String toString() {
    return 'HouseEntity(id: $id, categoryName: $categoryName, location: $location, userId: $userId, username: $username, userPhone: $userPhone, name: $name, description: $description, price: $price, viewed: $viewed, star: $star, commentCount: $commentCount, roomNumber: $roomNumber, floorNumber: $floorNumber, propertyType: $propertyType, repairType: $repairType, status: $status, luxe: $luxe, luxeStatus: $luxeStatus, luxeExpire: $luxeExpire, vipStatus: $vipStatus, vipExpire: $vipExpire, bronNumber: $bronNumber, images: $images, possibilities: $possibilities, comment: $comment, isComment: $isComment, who: $who, area: $area, exclusisive: $exclusisive, hashtag: $hashtag, levelNumber: $levelNumber, favorited: $favorited, liked: $liked, shop: $shop, type: $type, date: $date, updatedAt: $updatedAt, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HouseEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.categoryName, categoryName) ||
                other.categoryName == categoryName) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.userPhone, userPhone) ||
                other.userPhone == userPhone) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.viewed, viewed) || other.viewed == viewed) &&
            (identical(other.star, star) || other.star == star) &&
            (identical(other.commentCount, commentCount) ||
                other.commentCount == commentCount) &&
            (identical(other.roomNumber, roomNumber) ||
                other.roomNumber == roomNumber) &&
            (identical(other.floorNumber, floorNumber) ||
                other.floorNumber == floorNumber) &&
            (identical(other.propertyType, propertyType) ||
                other.propertyType == propertyType) &&
            (identical(other.repairType, repairType) ||
                other.repairType == repairType) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.luxe, luxe) || other.luxe == luxe) &&
            (identical(other.luxeStatus, luxeStatus) ||
                other.luxeStatus == luxeStatus) &&
            (identical(other.luxeExpire, luxeExpire) ||
                other.luxeExpire == luxeExpire) &&
            (identical(other.vipStatus, vipStatus) ||
                other.vipStatus == vipStatus) &&
            (identical(other.vipExpire, vipExpire) ||
                other.vipExpire == vipExpire) &&
            (identical(other.bronNumber, bronNumber) ||
                other.bronNumber == bronNumber) &&
            const DeepCollectionEquality().equals(other._images, _images) &&
            const DeepCollectionEquality()
                .equals(other._possibilities, _possibilities) &&
            (identical(other.comment, comment) || other.comment == comment) &&
            const DeepCollectionEquality().equals(other.isComment, isComment) &&
            (identical(other.who, who) || other.who == who) &&
            (identical(other.area, area) || other.area == area) &&
            (identical(other.exclusisive, exclusisive) ||
                other.exclusisive == exclusisive) &&
            (identical(other.hashtag, hashtag) || other.hashtag == hashtag) &&
            (identical(other.levelNumber, levelNumber) ||
                other.levelNumber == levelNumber) &&
            (identical(other.favorited, favorited) ||
                other.favorited == favorited) &&
            (identical(other.liked, liked) || other.liked == liked) &&
            const DeepCollectionEquality().equals(other.shop, shop) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        categoryName,
        location,
        userId,
        username,
        userPhone,
        name,
        description,
        price,
        viewed,
        star,
        commentCount,
        roomNumber,
        floorNumber,
        propertyType,
        repairType,
        status,
        luxe,
        luxeStatus,
        luxeExpire,
        vipStatus,
        vipExpire,
        bronNumber,
        const DeepCollectionEquality().hash(_images),
        const DeepCollectionEquality().hash(_possibilities),
        comment,
        const DeepCollectionEquality().hash(isComment),
        who,
        area,
        exclusisive,
        hashtag,
        levelNumber,
        favorited,
        liked,
        const DeepCollectionEquality().hash(shop),
        type,
        date,
        updatedAt,
        createdAt
      ]);

  /// Create a copy of HouseEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HouseEntityImplCopyWith<_$HouseEntityImpl> get copyWith =>
      __$$HouseEntityImplCopyWithImpl<_$HouseEntityImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HouseEntityImplToJson(
      this,
    );
  }
}

abstract class _HouseEntity implements HouseEntity {
  const factory _HouseEntity(
          {final int? id,
          @JsonKey(name: 'category_name') final String? categoryName,
          final Location? location,
          @JsonKey(name: 'user_id') final int? userId,
          final String? username,
          @JsonKey(name: 'user_phone') final String? userPhone,
          final String? name,
          final String? description,
          final String? price,
          final int? viewed,
          final int? star,
          @JsonKey(name: 'comment_count') final int? commentCount,
          @JsonKey(name: 'room_number') final int? roomNumber,
          @JsonKey(name: 'floor_number') final int? floorNumber,
          @JsonKey(name: 'property_type') final PropertyType? propertyType,
          @JsonKey(name: 'repair_type') final RepairType? repairType,
          final String? status,
          final bool? luxe,
          @JsonKey(name: 'luxe_status') final bool? luxeStatus,
          @JsonKey(name: 'luxe_expire') final DateTime? luxeExpire,
          @JsonKey(name: 'vip_status') final bool? vipStatus,
          @JsonKey(name: 'vip_expire') final DateTime? vipExpire,
          @JsonKey(name: 'bron_number') final String? bronNumber,
          final List<ImageUrl>? images,
          final List<Possibility>? possibilities,
          final int? comment,
          @JsonKey(name: 'is_comment') final dynamic isComment,
          final String? who,
          final int? area,
          final int? exclusisive,
          final String? hashtag,
          @JsonKey(name: 'level_number') final int? levelNumber,
          final bool? favorited,
          final bool? liked,
          final dynamic shop,
          final String? type,
          final DateTime? date,
          @JsonKey(name: 'updated_at') final DateTime? updatedAt,
          @JsonKey(name: 'created_at') final DateTime? createdAt}) =
      _$HouseEntityImpl;

  factory _HouseEntity.fromJson(Map<String, dynamic> json) =
      _$HouseEntityImpl.fromJson;

  @override
  int? get id;
  @override
  @JsonKey(name: 'category_name')
  String? get categoryName;
  @override
  Location? get location;
  @override
  @JsonKey(name: 'user_id')
  int? get userId;
  @override
  String? get username;
  @override
  @JsonKey(name: 'user_phone')
  String? get userPhone;
  @override
  String? get name;
  @override
  String? get description;
  @override
  String? get price;
  @override
  int? get viewed;
  @override
  int? get star;
  @override
  @JsonKey(name: 'comment_count')
  int? get commentCount;
  @override
  @JsonKey(name: 'room_number')
  int? get roomNumber;
  @override
  @JsonKey(name: 'floor_number')
  int? get floorNumber;
  @override
  @JsonKey(name: 'property_type')
  PropertyType? get propertyType;
  @override
  @JsonKey(name: 'repair_type')
  RepairType? get repairType;
  @override
  String? get status;
  @override
  bool? get luxe;
  @override
  @JsonKey(name: 'luxe_status')
  bool? get luxeStatus;
  @override
  @JsonKey(name: 'luxe_expire')
  DateTime? get luxeExpire;
  @override
  @JsonKey(name: 'vip_status')
  bool? get vipStatus;
  @override
  @JsonKey(name: 'vip_expire')
  DateTime? get vipExpire;
  @override
  @JsonKey(name: 'bron_number')
  String? get bronNumber;
  @override
  List<ImageUrl>? get images;
  @override
  List<Possibility>? get possibilities;
  @override
  int? get comment;
  @override
  @JsonKey(name: 'is_comment')
  dynamic get isComment;
  @override
  String? get who;
  @override
  int? get area;
  @override
  int? get exclusisive;
  @override
  String? get hashtag;
  @override
  @JsonKey(name: 'level_number')
  int? get levelNumber;
  @override
  bool? get favorited;
  @override
  bool? get liked;
  @override
  dynamic get shop;
  @override
  String? get type;
  @override
  DateTime? get date;
  @override
  @JsonKey(name: 'updated_at')
  DateTime? get updatedAt;
  @override
  @JsonKey(name: 'created_at')
  DateTime? get createdAt;

  /// Create a copy of HouseEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HouseEntityImplCopyWith<_$HouseEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Location _$LocationFromJson(Map<String, dynamic> json) {
  return _Location.fromJson(json);
}

/// @nodoc
mixin _$Location {
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'parent_id')
  int? get parentId => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'parent_name')
  String? get parentName => throw _privateConstructorUsedError;

  /// Serializes this Location to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Location
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LocationCopyWith<Location> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LocationCopyWith<$Res> {
  factory $LocationCopyWith(Location value, $Res Function(Location) then) =
      _$LocationCopyWithImpl<$Res, Location>;
  @useResult
  $Res call(
      {int? id,
      @JsonKey(name: 'parent_id') int? parentId,
      String? name,
      @JsonKey(name: 'created_at') DateTime? createdAt,
      @JsonKey(name: 'updated_at') DateTime? updatedAt,
      @JsonKey(name: 'parent_name') String? parentName});
}

/// @nodoc
class _$LocationCopyWithImpl<$Res, $Val extends Location>
    implements $LocationCopyWith<$Res> {
  _$LocationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Location
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? parentId = freezed,
    Object? name = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? parentName = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      parentId: freezed == parentId
          ? _value.parentId
          : parentId // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      parentName: freezed == parentName
          ? _value.parentName
          : parentName // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LocationImplCopyWith<$Res>
    implements $LocationCopyWith<$Res> {
  factory _$$LocationImplCopyWith(
          _$LocationImpl value, $Res Function(_$LocationImpl) then) =
      __$$LocationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      @JsonKey(name: 'parent_id') int? parentId,
      String? name,
      @JsonKey(name: 'created_at') DateTime? createdAt,
      @JsonKey(name: 'updated_at') DateTime? updatedAt,
      @JsonKey(name: 'parent_name') String? parentName});
}

/// @nodoc
class __$$LocationImplCopyWithImpl<$Res>
    extends _$LocationCopyWithImpl<$Res, _$LocationImpl>
    implements _$$LocationImplCopyWith<$Res> {
  __$$LocationImplCopyWithImpl(
      _$LocationImpl _value, $Res Function(_$LocationImpl) _then)
      : super(_value, _then);

  /// Create a copy of Location
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? parentId = freezed,
    Object? name = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? parentName = freezed,
  }) {
    return _then(_$LocationImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      parentId: freezed == parentId
          ? _value.parentId
          : parentId // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      parentName: freezed == parentName
          ? _value.parentName
          : parentName // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LocationImpl implements _Location {
  const _$LocationImpl(
      {this.id,
      @JsonKey(name: 'parent_id') this.parentId,
      this.name,
      @JsonKey(name: 'created_at') this.createdAt,
      @JsonKey(name: 'updated_at') this.updatedAt,
      @JsonKey(name: 'parent_name') this.parentName});

  factory _$LocationImpl.fromJson(Map<String, dynamic> json) =>
      _$$LocationImplFromJson(json);

  @override
  final int? id;
  @override
  @JsonKey(name: 'parent_id')
  final int? parentId;
  @override
  final String? name;
  @override
  @JsonKey(name: 'created_at')
  final DateTime? createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final DateTime? updatedAt;
  @override
  @JsonKey(name: 'parent_name')
  final String? parentName;

  @override
  String toString() {
    return 'Location(id: $id, parentId: $parentId, name: $name, createdAt: $createdAt, updatedAt: $updatedAt, parentName: $parentName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LocationImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.parentId, parentId) ||
                other.parentId == parentId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.parentName, parentName) ||
                other.parentName == parentName));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, parentId, name, createdAt, updatedAt, parentName);

  /// Create a copy of Location
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LocationImplCopyWith<_$LocationImpl> get copyWith =>
      __$$LocationImplCopyWithImpl<_$LocationImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LocationImplToJson(
      this,
    );
  }
}

abstract class _Location implements Location {
  const factory _Location(
      {final int? id,
      @JsonKey(name: 'parent_id') final int? parentId,
      final String? name,
      @JsonKey(name: 'created_at') final DateTime? createdAt,
      @JsonKey(name: 'updated_at') final DateTime? updatedAt,
      @JsonKey(name: 'parent_name') final String? parentName}) = _$LocationImpl;

  factory _Location.fromJson(Map<String, dynamic> json) =
      _$LocationImpl.fromJson;

  @override
  int? get id;
  @override
  @JsonKey(name: 'parent_id')
  int? get parentId;
  @override
  String? get name;
  @override
  @JsonKey(name: 'created_at')
  DateTime? get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  DateTime? get updatedAt;
  @override
  @JsonKey(name: 'parent_name')
  String? get parentName;

  /// Create a copy of Location
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LocationImplCopyWith<_$LocationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PropertyType _$PropertyTypeFromJson(Map<String, dynamic> json) {
  return _PropertyType.fromJson(json);
}

/// @nodoc
mixin _$PropertyType {
  int? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get icon => throw _privateConstructorUsedError;

  /// Serializes this PropertyType to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PropertyType
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PropertyTypeCopyWith<PropertyType> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PropertyTypeCopyWith<$Res> {
  factory $PropertyTypeCopyWith(
          PropertyType value, $Res Function(PropertyType) then) =
      _$PropertyTypeCopyWithImpl<$Res, PropertyType>;
  @useResult
  $Res call({int? id, String? name, String? icon});
}

/// @nodoc
class _$PropertyTypeCopyWithImpl<$Res, $Val extends PropertyType>
    implements $PropertyTypeCopyWith<$Res> {
  _$PropertyTypeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PropertyType
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? icon = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      icon: freezed == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PropertyTypeImplCopyWith<$Res>
    implements $PropertyTypeCopyWith<$Res> {
  factory _$$PropertyTypeImplCopyWith(
          _$PropertyTypeImpl value, $Res Function(_$PropertyTypeImpl) then) =
      __$$PropertyTypeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? id, String? name, String? icon});
}

/// @nodoc
class __$$PropertyTypeImplCopyWithImpl<$Res>
    extends _$PropertyTypeCopyWithImpl<$Res, _$PropertyTypeImpl>
    implements _$$PropertyTypeImplCopyWith<$Res> {
  __$$PropertyTypeImplCopyWithImpl(
      _$PropertyTypeImpl _value, $Res Function(_$PropertyTypeImpl) _then)
      : super(_value, _then);

  /// Create a copy of PropertyType
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? icon = freezed,
  }) {
    return _then(_$PropertyTypeImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      icon: freezed == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PropertyTypeImpl implements _PropertyType {
  const _$PropertyTypeImpl({this.id, this.name, this.icon});

  factory _$PropertyTypeImpl.fromJson(Map<String, dynamic> json) =>
      _$$PropertyTypeImplFromJson(json);

  @override
  final int? id;
  @override
  final String? name;
  @override
  final String? icon;

  @override
  String toString() {
    return 'PropertyType(id: $id, name: $name, icon: $icon)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PropertyTypeImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.icon, icon) || other.icon == icon));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, icon);

  /// Create a copy of PropertyType
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PropertyTypeImplCopyWith<_$PropertyTypeImpl> get copyWith =>
      __$$PropertyTypeImplCopyWithImpl<_$PropertyTypeImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PropertyTypeImplToJson(
      this,
    );
  }
}

abstract class _PropertyType implements PropertyType {
  const factory _PropertyType(
      {final int? id,
      final String? name,
      final String? icon}) = _$PropertyTypeImpl;

  factory _PropertyType.fromJson(Map<String, dynamic> json) =
      _$PropertyTypeImpl.fromJson;

  @override
  int? get id;
  @override
  String? get name;
  @override
  String? get icon;

  /// Create a copy of PropertyType
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PropertyTypeImplCopyWith<_$PropertyTypeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

RepairType _$RepairTypeFromJson(Map<String, dynamic> json) {
  return _RepairType.fromJson(json);
}

/// @nodoc
mixin _$RepairType {
  int? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get icon => throw _privateConstructorUsedError;

  /// Serializes this RepairType to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RepairType
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RepairTypeCopyWith<RepairType> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RepairTypeCopyWith<$Res> {
  factory $RepairTypeCopyWith(
          RepairType value, $Res Function(RepairType) then) =
      _$RepairTypeCopyWithImpl<$Res, RepairType>;
  @useResult
  $Res call({int? id, String? name, String? icon});
}

/// @nodoc
class _$RepairTypeCopyWithImpl<$Res, $Val extends RepairType>
    implements $RepairTypeCopyWith<$Res> {
  _$RepairTypeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RepairType
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? icon = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      icon: freezed == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RepairTypeImplCopyWith<$Res>
    implements $RepairTypeCopyWith<$Res> {
  factory _$$RepairTypeImplCopyWith(
          _$RepairTypeImpl value, $Res Function(_$RepairTypeImpl) then) =
      __$$RepairTypeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? id, String? name, String? icon});
}

/// @nodoc
class __$$RepairTypeImplCopyWithImpl<$Res>
    extends _$RepairTypeCopyWithImpl<$Res, _$RepairTypeImpl>
    implements _$$RepairTypeImplCopyWith<$Res> {
  __$$RepairTypeImplCopyWithImpl(
      _$RepairTypeImpl _value, $Res Function(_$RepairTypeImpl) _then)
      : super(_value, _then);

  /// Create a copy of RepairType
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? icon = freezed,
  }) {
    return _then(_$RepairTypeImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      icon: freezed == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RepairTypeImpl implements _RepairType {
  const _$RepairTypeImpl({this.id, this.name, this.icon});

  factory _$RepairTypeImpl.fromJson(Map<String, dynamic> json) =>
      _$$RepairTypeImplFromJson(json);

  @override
  final int? id;
  @override
  final String? name;
  @override
  final String? icon;

  @override
  String toString() {
    return 'RepairType(id: $id, name: $name, icon: $icon)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RepairTypeImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.icon, icon) || other.icon == icon));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, icon);

  /// Create a copy of RepairType
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RepairTypeImplCopyWith<_$RepairTypeImpl> get copyWith =>
      __$$RepairTypeImplCopyWithImpl<_$RepairTypeImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RepairTypeImplToJson(
      this,
    );
  }
}

abstract class _RepairType implements RepairType {
  const factory _RepairType(
      {final int? id,
      final String? name,
      final String? icon}) = _$RepairTypeImpl;

  factory _RepairType.fromJson(Map<String, dynamic> json) =
      _$RepairTypeImpl.fromJson;

  @override
  int? get id;
  @override
  String? get name;
  @override
  String? get icon;

  /// Create a copy of RepairType
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RepairTypeImplCopyWith<_$RepairTypeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ImageUrl _$ImageUrlFromJson(Map<String, dynamic> json) {
  return _ImageUrl.fromJson(json);
}

/// @nodoc
mixin _$ImageUrl {
  String? get url => throw _privateConstructorUsedError;

  /// Serializes this ImageUrl to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ImageUrl
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ImageUrlCopyWith<ImageUrl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ImageUrlCopyWith<$Res> {
  factory $ImageUrlCopyWith(ImageUrl value, $Res Function(ImageUrl) then) =
      _$ImageUrlCopyWithImpl<$Res, ImageUrl>;
  @useResult
  $Res call({String? url});
}

/// @nodoc
class _$ImageUrlCopyWithImpl<$Res, $Val extends ImageUrl>
    implements $ImageUrlCopyWith<$Res> {
  _$ImageUrlCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ImageUrl
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? url = freezed,
  }) {
    return _then(_value.copyWith(
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ImageUrlImplCopyWith<$Res>
    implements $ImageUrlCopyWith<$Res> {
  factory _$$ImageUrlImplCopyWith(
          _$ImageUrlImpl value, $Res Function(_$ImageUrlImpl) then) =
      __$$ImageUrlImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? url});
}

/// @nodoc
class __$$ImageUrlImplCopyWithImpl<$Res>
    extends _$ImageUrlCopyWithImpl<$Res, _$ImageUrlImpl>
    implements _$$ImageUrlImplCopyWith<$Res> {
  __$$ImageUrlImplCopyWithImpl(
      _$ImageUrlImpl _value, $Res Function(_$ImageUrlImpl) _then)
      : super(_value, _then);

  /// Create a copy of ImageUrl
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? url = freezed,
  }) {
    return _then(_$ImageUrlImpl(
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ImageUrlImpl implements _ImageUrl {
  const _$ImageUrlImpl({this.url});

  factory _$ImageUrlImpl.fromJson(Map<String, dynamic> json) =>
      _$$ImageUrlImplFromJson(json);

  @override
  final String? url;

  @override
  String toString() {
    return 'ImageUrl(url: $url)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ImageUrlImpl &&
            (identical(other.url, url) || other.url == url));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, url);

  /// Create a copy of ImageUrl
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ImageUrlImplCopyWith<_$ImageUrlImpl> get copyWith =>
      __$$ImageUrlImplCopyWithImpl<_$ImageUrlImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ImageUrlImplToJson(
      this,
    );
  }
}

abstract class _ImageUrl implements ImageUrl {
  const factory _ImageUrl({final String? url}) = _$ImageUrlImpl;

  factory _ImageUrl.fromJson(Map<String, dynamic> json) =
      _$ImageUrlImpl.fromJson;

  @override
  String? get url;

  /// Create a copy of ImageUrl
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ImageUrlImplCopyWith<_$ImageUrlImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Possibility _$PossibilityFromJson(Map<String, dynamic> json) {
  return _Possibility.fromJson(json);
}

/// @nodoc
mixin _$Possibility {
  int? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;

  /// Serializes this Possibility to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Possibility
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PossibilityCopyWith<Possibility> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PossibilityCopyWith<$Res> {
  factory $PossibilityCopyWith(
          Possibility value, $Res Function(Possibility) then) =
      _$PossibilityCopyWithImpl<$Res, Possibility>;
  @useResult
  $Res call({int? id, String? name});
}

/// @nodoc
class _$PossibilityCopyWithImpl<$Res, $Val extends Possibility>
    implements $PossibilityCopyWith<$Res> {
  _$PossibilityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Possibility
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PossibilityImplCopyWith<$Res>
    implements $PossibilityCopyWith<$Res> {
  factory _$$PossibilityImplCopyWith(
          _$PossibilityImpl value, $Res Function(_$PossibilityImpl) then) =
      __$$PossibilityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? id, String? name});
}

/// @nodoc
class __$$PossibilityImplCopyWithImpl<$Res>
    extends _$PossibilityCopyWithImpl<$Res, _$PossibilityImpl>
    implements _$$PossibilityImplCopyWith<$Res> {
  __$$PossibilityImplCopyWithImpl(
      _$PossibilityImpl _value, $Res Function(_$PossibilityImpl) _then)
      : super(_value, _then);

  /// Create a copy of Possibility
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
  }) {
    return _then(_$PossibilityImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PossibilityImpl implements _Possibility {
  const _$PossibilityImpl({this.id, this.name});

  factory _$PossibilityImpl.fromJson(Map<String, dynamic> json) =>
      _$$PossibilityImplFromJson(json);

  @override
  final int? id;
  @override
  final String? name;

  @override
  String toString() {
    return 'Possibility(id: $id, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PossibilityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name);

  /// Create a copy of Possibility
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PossibilityImplCopyWith<_$PossibilityImpl> get copyWith =>
      __$$PossibilityImplCopyWithImpl<_$PossibilityImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PossibilityImplToJson(
      this,
    );
  }
}

abstract class _Possibility implements Possibility {
  const factory _Possibility({final int? id, final String? name}) =
      _$PossibilityImpl;

  factory _Possibility.fromJson(Map<String, dynamic> json) =
      _$PossibilityImpl.fromJson;

  @override
  int? get id;
  @override
  String? get name;

  /// Create a copy of Possibility
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PossibilityImplCopyWith<_$PossibilityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
