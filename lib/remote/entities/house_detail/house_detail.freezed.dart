// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'house_detail.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

HouseDetailResponse _$HouseDetailResponseFromJson(Map<String, dynamic> json) {
  return _HouseDetailResponse.fromJson(json);
}

/// @nodoc
mixin _$HouseDetailResponse {
  HouseDetail get data => throw _privateConstructorUsedError;

  /// Serializes this HouseDetailResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of HouseDetailResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HouseDetailResponseCopyWith<HouseDetailResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HouseDetailResponseCopyWith<$Res> {
  factory $HouseDetailResponseCopyWith(
          HouseDetailResponse value, $Res Function(HouseDetailResponse) then) =
      _$HouseDetailResponseCopyWithImpl<$Res, HouseDetailResponse>;
  @useResult
  $Res call({HouseDetail data});

  $HouseDetailCopyWith<$Res> get data;
}

/// @nodoc
class _$HouseDetailResponseCopyWithImpl<$Res, $Val extends HouseDetailResponse>
    implements $HouseDetailResponseCopyWith<$Res> {
  _$HouseDetailResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HouseDetailResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_value.copyWith(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as HouseDetail,
    ) as $Val);
  }

  /// Create a copy of HouseDetailResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $HouseDetailCopyWith<$Res> get data {
    return $HouseDetailCopyWith<$Res>(_value.data, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$HouseDetailResponseImplCopyWith<$Res>
    implements $HouseDetailResponseCopyWith<$Res> {
  factory _$$HouseDetailResponseImplCopyWith(_$HouseDetailResponseImpl value,
          $Res Function(_$HouseDetailResponseImpl) then) =
      __$$HouseDetailResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({HouseDetail data});

  @override
  $HouseDetailCopyWith<$Res> get data;
}

/// @nodoc
class __$$HouseDetailResponseImplCopyWithImpl<$Res>
    extends _$HouseDetailResponseCopyWithImpl<$Res, _$HouseDetailResponseImpl>
    implements _$$HouseDetailResponseImplCopyWith<$Res> {
  __$$HouseDetailResponseImplCopyWithImpl(_$HouseDetailResponseImpl _value,
      $Res Function(_$HouseDetailResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of HouseDetailResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$HouseDetailResponseImpl(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as HouseDetail,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$HouseDetailResponseImpl implements _HouseDetailResponse {
  const _$HouseDetailResponseImpl({required this.data});

  factory _$HouseDetailResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$HouseDetailResponseImplFromJson(json);

  @override
  final HouseDetail data;

  @override
  String toString() {
    return 'HouseDetailResponse(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HouseDetailResponseImpl &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, data);

  /// Create a copy of HouseDetailResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HouseDetailResponseImplCopyWith<_$HouseDetailResponseImpl> get copyWith =>
      __$$HouseDetailResponseImplCopyWithImpl<_$HouseDetailResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HouseDetailResponseImplToJson(
      this,
    );
  }
}

abstract class _HouseDetailResponse implements HouseDetailResponse {
  const factory _HouseDetailResponse({required final HouseDetail data}) =
      _$HouseDetailResponseImpl;

  factory _HouseDetailResponse.fromJson(Map<String, dynamic> json) =
      _$HouseDetailResponseImpl.fromJson;

  @override
  HouseDetail get data;

  /// Create a copy of HouseDetailResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HouseDetailResponseImplCopyWith<_$HouseDetailResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

HouseDetail _$HouseDetailFromJson(Map<String, dynamic> json) {
  return _HouseDetail.fromJson(json);
}

/// @nodoc
mixin _$HouseDetail {
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'category_id')
  int? get categoryId => throw _privateConstructorUsedError;
  @JsonKey(name: 'category_name')
  String? get categoryName => throw _privateConstructorUsedError;
  Location? get location => throw _privateConstructorUsedError;
  String? get username => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get reason => throw _privateConstructorUsedError;
  String? get price => throw _privateConstructorUsedError;
  int? get viewed => throw _privateConstructorUsedError;
  String? get star => throw _privateConstructorUsedError;
  @JsonKey(name: 'bron_number')
  String? get bronNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'room_number')
  int? get roomNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'floor_number')
  int get floorNumber => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  int get luxe => throw _privateConstructorUsedError;
  List<HouseImage> get images => throw _privateConstructorUsedError;
  List<Possibility> get possibilities => throw _privateConstructorUsedError;
  int get comment => throw _privateConstructorUsedError;
  List<dynamic> get comments => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_comment')
  dynamic get isComment => throw _privateConstructorUsedError;
  dynamic get who => throw _privateConstructorUsedError;
  dynamic get area => throw _privateConstructorUsedError;
  int get exclusisive => throw _privateConstructorUsedError;
  dynamic get hashtag => throw _privateConstructorUsedError;
  dynamic get level_number => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime? get createdAt => throw _privateConstructorUsedError;

  /// Serializes this HouseDetail to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of HouseDetail
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HouseDetailCopyWith<HouseDetail> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HouseDetailCopyWith<$Res> {
  factory $HouseDetailCopyWith(
          HouseDetail value, $Res Function(HouseDetail) then) =
      _$HouseDetailCopyWithImpl<$Res, HouseDetail>;
  @useResult
  $Res call(
      {int? id,
      @JsonKey(name: 'category_id') int? categoryId,
      @JsonKey(name: 'category_name') String? categoryName,
      Location? location,
      String? username,
      String? name,
      String? description,
      String? reason,
      String? price,
      int? viewed,
      String? star,
      @JsonKey(name: 'bron_number') String? bronNumber,
      @JsonKey(name: 'room_number') int? roomNumber,
      @JsonKey(name: 'floor_number') int floorNumber,
      String status,
      int luxe,
      List<HouseImage> images,
      List<Possibility> possibilities,
      int comment,
      List<dynamic> comments,
      @JsonKey(name: 'is_comment') dynamic isComment,
      dynamic who,
      dynamic area,
      int exclusisive,
      dynamic hashtag,
      dynamic level_number,
      @JsonKey(name: 'updated_at') DateTime? updatedAt,
      @JsonKey(name: 'created_at') DateTime? createdAt});

  $LocationCopyWith<$Res>? get location;
}

/// @nodoc
class _$HouseDetailCopyWithImpl<$Res, $Val extends HouseDetail>
    implements $HouseDetailCopyWith<$Res> {
  _$HouseDetailCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HouseDetail
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? categoryId = freezed,
    Object? categoryName = freezed,
    Object? location = freezed,
    Object? username = freezed,
    Object? name = freezed,
    Object? description = freezed,
    Object? reason = freezed,
    Object? price = freezed,
    Object? viewed = freezed,
    Object? star = freezed,
    Object? bronNumber = freezed,
    Object? roomNumber = freezed,
    Object? floorNumber = null,
    Object? status = null,
    Object? luxe = null,
    Object? images = null,
    Object? possibilities = null,
    Object? comment = null,
    Object? comments = null,
    Object? isComment = freezed,
    Object? who = freezed,
    Object? area = freezed,
    Object? exclusisive = null,
    Object? hashtag = freezed,
    Object? level_number = freezed,
    Object? updatedAt = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      categoryId: freezed == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as int?,
      categoryName: freezed == categoryName
          ? _value.categoryName
          : categoryName // ignore: cast_nullable_to_non_nullable
              as String?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as Location?,
      username: freezed == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      reason: freezed == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
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
              as String?,
      bronNumber: freezed == bronNumber
          ? _value.bronNumber
          : bronNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      roomNumber: freezed == roomNumber
          ? _value.roomNumber
          : roomNumber // ignore: cast_nullable_to_non_nullable
              as int?,
      floorNumber: null == floorNumber
          ? _value.floorNumber
          : floorNumber // ignore: cast_nullable_to_non_nullable
              as int,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      luxe: null == luxe
          ? _value.luxe
          : luxe // ignore: cast_nullable_to_non_nullable
              as int,
      images: null == images
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as List<HouseImage>,
      possibilities: null == possibilities
          ? _value.possibilities
          : possibilities // ignore: cast_nullable_to_non_nullable
              as List<Possibility>,
      comment: null == comment
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as int,
      comments: null == comments
          ? _value.comments
          : comments // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      isComment: freezed == isComment
          ? _value.isComment
          : isComment // ignore: cast_nullable_to_non_nullable
              as dynamic,
      who: freezed == who
          ? _value.who
          : who // ignore: cast_nullable_to_non_nullable
              as dynamic,
      area: freezed == area
          ? _value.area
          : area // ignore: cast_nullable_to_non_nullable
              as dynamic,
      exclusisive: null == exclusisive
          ? _value.exclusisive
          : exclusisive // ignore: cast_nullable_to_non_nullable
              as int,
      hashtag: freezed == hashtag
          ? _value.hashtag
          : hashtag // ignore: cast_nullable_to_non_nullable
              as dynamic,
      level_number: freezed == level_number
          ? _value.level_number
          : level_number // ignore: cast_nullable_to_non_nullable
              as dynamic,
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

  /// Create a copy of HouseDetail
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
}

/// @nodoc
abstract class _$$HouseDetailImplCopyWith<$Res>
    implements $HouseDetailCopyWith<$Res> {
  factory _$$HouseDetailImplCopyWith(
          _$HouseDetailImpl value, $Res Function(_$HouseDetailImpl) then) =
      __$$HouseDetailImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      @JsonKey(name: 'category_id') int? categoryId,
      @JsonKey(name: 'category_name') String? categoryName,
      Location? location,
      String? username,
      String? name,
      String? description,
      String? reason,
      String? price,
      int? viewed,
      String? star,
      @JsonKey(name: 'bron_number') String? bronNumber,
      @JsonKey(name: 'room_number') int? roomNumber,
      @JsonKey(name: 'floor_number') int floorNumber,
      String status,
      int luxe,
      List<HouseImage> images,
      List<Possibility> possibilities,
      int comment,
      List<dynamic> comments,
      @JsonKey(name: 'is_comment') dynamic isComment,
      dynamic who,
      dynamic area,
      int exclusisive,
      dynamic hashtag,
      dynamic level_number,
      @JsonKey(name: 'updated_at') DateTime? updatedAt,
      @JsonKey(name: 'created_at') DateTime? createdAt});

  @override
  $LocationCopyWith<$Res>? get location;
}

/// @nodoc
class __$$HouseDetailImplCopyWithImpl<$Res>
    extends _$HouseDetailCopyWithImpl<$Res, _$HouseDetailImpl>
    implements _$$HouseDetailImplCopyWith<$Res> {
  __$$HouseDetailImplCopyWithImpl(
      _$HouseDetailImpl _value, $Res Function(_$HouseDetailImpl) _then)
      : super(_value, _then);

  /// Create a copy of HouseDetail
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? categoryId = freezed,
    Object? categoryName = freezed,
    Object? location = freezed,
    Object? username = freezed,
    Object? name = freezed,
    Object? description = freezed,
    Object? reason = freezed,
    Object? price = freezed,
    Object? viewed = freezed,
    Object? star = freezed,
    Object? bronNumber = freezed,
    Object? roomNumber = freezed,
    Object? floorNumber = null,
    Object? status = null,
    Object? luxe = null,
    Object? images = null,
    Object? possibilities = null,
    Object? comment = null,
    Object? comments = null,
    Object? isComment = freezed,
    Object? who = freezed,
    Object? area = freezed,
    Object? exclusisive = null,
    Object? hashtag = freezed,
    Object? level_number = freezed,
    Object? updatedAt = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_$HouseDetailImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      categoryId: freezed == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as int?,
      categoryName: freezed == categoryName
          ? _value.categoryName
          : categoryName // ignore: cast_nullable_to_non_nullable
              as String?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as Location?,
      username: freezed == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      reason: freezed == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
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
              as String?,
      bronNumber: freezed == bronNumber
          ? _value.bronNumber
          : bronNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      roomNumber: freezed == roomNumber
          ? _value.roomNumber
          : roomNumber // ignore: cast_nullable_to_non_nullable
              as int?,
      floorNumber: null == floorNumber
          ? _value.floorNumber
          : floorNumber // ignore: cast_nullable_to_non_nullable
              as int,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      luxe: null == luxe
          ? _value.luxe
          : luxe // ignore: cast_nullable_to_non_nullable
              as int,
      images: null == images
          ? _value._images
          : images // ignore: cast_nullable_to_non_nullable
              as List<HouseImage>,
      possibilities: null == possibilities
          ? _value._possibilities
          : possibilities // ignore: cast_nullable_to_non_nullable
              as List<Possibility>,
      comment: null == comment
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as int,
      comments: null == comments
          ? _value._comments
          : comments // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      isComment: freezed == isComment
          ? _value.isComment
          : isComment // ignore: cast_nullable_to_non_nullable
              as dynamic,
      who: freezed == who
          ? _value.who
          : who // ignore: cast_nullable_to_non_nullable
              as dynamic,
      area: freezed == area
          ? _value.area
          : area // ignore: cast_nullable_to_non_nullable
              as dynamic,
      exclusisive: null == exclusisive
          ? _value.exclusisive
          : exclusisive // ignore: cast_nullable_to_non_nullable
              as int,
      hashtag: freezed == hashtag
          ? _value.hashtag
          : hashtag // ignore: cast_nullable_to_non_nullable
              as dynamic,
      level_number: freezed == level_number
          ? _value.level_number
          : level_number // ignore: cast_nullable_to_non_nullable
              as dynamic,
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
class _$HouseDetailImpl implements _HouseDetail {
  const _$HouseDetailImpl(
      {required this.id,
      @JsonKey(name: 'category_id') required this.categoryId,
      @JsonKey(name: 'category_name') required this.categoryName,
      required this.location,
      required this.username,
      required this.name,
      required this.description,
      this.reason,
      required this.price,
      required this.viewed,
      this.star,
      @JsonKey(name: 'bron_number') required this.bronNumber,
      @JsonKey(name: 'room_number') required this.roomNumber,
      @JsonKey(name: 'floor_number') required this.floorNumber,
      required this.status,
      required this.luxe,
      required final List<HouseImage> images,
      required final List<Possibility> possibilities,
      required this.comment,
      required final List<dynamic> comments,
      @JsonKey(name: 'is_comment') this.isComment,
      this.who,
      this.area,
      required this.exclusisive,
      this.hashtag,
      this.level_number,
      @JsonKey(name: 'updated_at') required this.updatedAt,
      @JsonKey(name: 'created_at') required this.createdAt})
      : _images = images,
        _possibilities = possibilities,
        _comments = comments;

  factory _$HouseDetailImpl.fromJson(Map<String, dynamic> json) =>
      _$$HouseDetailImplFromJson(json);

  @override
  final int? id;
  @override
  @JsonKey(name: 'category_id')
  final int? categoryId;
  @override
  @JsonKey(name: 'category_name')
  final String? categoryName;
  @override
  final Location? location;
  @override
  final String? username;
  @override
  final String? name;
  @override
  final String? description;
  @override
  final String? reason;
  @override
  final String? price;
  @override
  final int? viewed;
  @override
  final String? star;
  @override
  @JsonKey(name: 'bron_number')
  final String? bronNumber;
  @override
  @JsonKey(name: 'room_number')
  final int? roomNumber;
  @override
  @JsonKey(name: 'floor_number')
  final int floorNumber;
  @override
  final String status;
  @override
  final int luxe;
  final List<HouseImage> _images;
  @override
  List<HouseImage> get images {
    if (_images is EqualUnmodifiableListView) return _images;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_images);
  }

  final List<Possibility> _possibilities;
  @override
  List<Possibility> get possibilities {
    if (_possibilities is EqualUnmodifiableListView) return _possibilities;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_possibilities);
  }

  @override
  final int comment;
  final List<dynamic> _comments;
  @override
  List<dynamic> get comments {
    if (_comments is EqualUnmodifiableListView) return _comments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_comments);
  }

  @override
  @JsonKey(name: 'is_comment')
  final dynamic isComment;
  @override
  final dynamic who;
  @override
  final dynamic area;
  @override
  final int exclusisive;
  @override
  final dynamic hashtag;
  @override
  final dynamic level_number;
  @override
  @JsonKey(name: 'updated_at')
  final DateTime? updatedAt;
  @override
  @JsonKey(name: 'created_at')
  final DateTime? createdAt;

  @override
  String toString() {
    return 'HouseDetail(id: $id, categoryId: $categoryId, categoryName: $categoryName, location: $location, username: $username, name: $name, description: $description, reason: $reason, price: $price, viewed: $viewed, star: $star, bronNumber: $bronNumber, roomNumber: $roomNumber, floorNumber: $floorNumber, status: $status, luxe: $luxe, images: $images, possibilities: $possibilities, comment: $comment, comments: $comments, isComment: $isComment, who: $who, area: $area, exclusisive: $exclusisive, hashtag: $hashtag, level_number: $level_number, updatedAt: $updatedAt, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HouseDetailImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.categoryName, categoryName) ||
                other.categoryName == categoryName) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.reason, reason) || other.reason == reason) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.viewed, viewed) || other.viewed == viewed) &&
            (identical(other.star, star) || other.star == star) &&
            (identical(other.bronNumber, bronNumber) ||
                other.bronNumber == bronNumber) &&
            (identical(other.roomNumber, roomNumber) ||
                other.roomNumber == roomNumber) &&
            (identical(other.floorNumber, floorNumber) ||
                other.floorNumber == floorNumber) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.luxe, luxe) || other.luxe == luxe) &&
            const DeepCollectionEquality().equals(other._images, _images) &&
            const DeepCollectionEquality()
                .equals(other._possibilities, _possibilities) &&
            (identical(other.comment, comment) || other.comment == comment) &&
            const DeepCollectionEquality().equals(other._comments, _comments) &&
            const DeepCollectionEquality().equals(other.isComment, isComment) &&
            const DeepCollectionEquality().equals(other.who, who) &&
            const DeepCollectionEquality().equals(other.area, area) &&
            (identical(other.exclusisive, exclusisive) ||
                other.exclusisive == exclusisive) &&
            const DeepCollectionEquality().equals(other.hashtag, hashtag) &&
            const DeepCollectionEquality()
                .equals(other.level_number, level_number) &&
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
        categoryId,
        categoryName,
        location,
        username,
        name,
        description,
        reason,
        price,
        viewed,
        star,
        bronNumber,
        roomNumber,
        floorNumber,
        status,
        luxe,
        const DeepCollectionEquality().hash(_images),
        const DeepCollectionEquality().hash(_possibilities),
        comment,
        const DeepCollectionEquality().hash(_comments),
        const DeepCollectionEquality().hash(isComment),
        const DeepCollectionEquality().hash(who),
        const DeepCollectionEquality().hash(area),
        exclusisive,
        const DeepCollectionEquality().hash(hashtag),
        const DeepCollectionEquality().hash(level_number),
        updatedAt,
        createdAt
      ]);

  /// Create a copy of HouseDetail
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HouseDetailImplCopyWith<_$HouseDetailImpl> get copyWith =>
      __$$HouseDetailImplCopyWithImpl<_$HouseDetailImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HouseDetailImplToJson(
      this,
    );
  }
}

abstract class _HouseDetail implements HouseDetail {
  const factory _HouseDetail(
          {required final int? id,
          @JsonKey(name: 'category_id') required final int? categoryId,
          @JsonKey(name: 'category_name') required final String? categoryName,
          required final Location? location,
          required final String? username,
          required final String? name,
          required final String? description,
          final String? reason,
          required final String? price,
          required final int? viewed,
          final String? star,
          @JsonKey(name: 'bron_number') required final String? bronNumber,
          @JsonKey(name: 'room_number') required final int? roomNumber,
          @JsonKey(name: 'floor_number') required final int floorNumber,
          required final String status,
          required final int luxe,
          required final List<HouseImage> images,
          required final List<Possibility> possibilities,
          required final int comment,
          required final List<dynamic> comments,
          @JsonKey(name: 'is_comment') final dynamic isComment,
          final dynamic who,
          final dynamic area,
          required final int exclusisive,
          final dynamic hashtag,
          final dynamic level_number,
          @JsonKey(name: 'updated_at') required final DateTime? updatedAt,
          @JsonKey(name: 'created_at') required final DateTime? createdAt}) =
      _$HouseDetailImpl;

  factory _HouseDetail.fromJson(Map<String, dynamic> json) =
      _$HouseDetailImpl.fromJson;

  @override
  int? get id;
  @override
  @JsonKey(name: 'category_id')
  int? get categoryId;
  @override
  @JsonKey(name: 'category_name')
  String? get categoryName;
  @override
  Location? get location;
  @override
  String? get username;
  @override
  String? get name;
  @override
  String? get description;
  @override
  String? get reason;
  @override
  String? get price;
  @override
  int? get viewed;
  @override
  String? get star;
  @override
  @JsonKey(name: 'bron_number')
  String? get bronNumber;
  @override
  @JsonKey(name: 'room_number')
  int? get roomNumber;
  @override
  @JsonKey(name: 'floor_number')
  int get floorNumber;
  @override
  String get status;
  @override
  int get luxe;
  @override
  List<HouseImage> get images;
  @override
  List<Possibility> get possibilities;
  @override
  int get comment;
  @override
  List<dynamic> get comments;
  @override
  @JsonKey(name: 'is_comment')
  dynamic get isComment;
  @override
  dynamic get who;
  @override
  dynamic get area;
  @override
  int get exclusisive;
  @override
  dynamic get hashtag;
  @override
  dynamic get level_number;
  @override
  @JsonKey(name: 'updated_at')
  DateTime? get updatedAt;
  @override
  @JsonKey(name: 'created_at')
  DateTime? get createdAt;

  /// Create a copy of HouseDetail
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HouseDetailImplCopyWith<_$HouseDetailImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Location _$LocationFromJson(Map<String, dynamic> json) {
  return _Location.fromJson(json);
}

/// @nodoc
mixin _$Location {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'parent_id')
  int get parentId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  String get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  String get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'parent_name')
  String get parentName => throw _privateConstructorUsedError;

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
      {int id,
      @JsonKey(name: 'parent_id') int parentId,
      String name,
      @JsonKey(name: 'created_at') String createdAt,
      @JsonKey(name: 'updated_at') String updatedAt,
      @JsonKey(name: 'parent_name') String parentName});
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
    Object? id = null,
    Object? parentId = null,
    Object? name = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? parentName = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      parentId: null == parentId
          ? _value.parentId
          : parentId // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
      parentName: null == parentName
          ? _value.parentName
          : parentName // ignore: cast_nullable_to_non_nullable
              as String,
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
      {int id,
      @JsonKey(name: 'parent_id') int parentId,
      String name,
      @JsonKey(name: 'created_at') String createdAt,
      @JsonKey(name: 'updated_at') String updatedAt,
      @JsonKey(name: 'parent_name') String parentName});
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
    Object? id = null,
    Object? parentId = null,
    Object? name = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? parentName = null,
  }) {
    return _then(_$LocationImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      parentId: null == parentId
          ? _value.parentId
          : parentId // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
      parentName: null == parentName
          ? _value.parentName
          : parentName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LocationImpl implements _Location {
  const _$LocationImpl(
      {required this.id,
      @JsonKey(name: 'parent_id') required this.parentId,
      required this.name,
      @JsonKey(name: 'created_at') required this.createdAt,
      @JsonKey(name: 'updated_at') required this.updatedAt,
      @JsonKey(name: 'parent_name') required this.parentName});

  factory _$LocationImpl.fromJson(Map<String, dynamic> json) =>
      _$$LocationImplFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: 'parent_id')
  final int parentId;
  @override
  final String name;
  @override
  @JsonKey(name: 'created_at')
  final String createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final String updatedAt;
  @override
  @JsonKey(name: 'parent_name')
  final String parentName;

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
          {required final int id,
          @JsonKey(name: 'parent_id') required final int parentId,
          required final String name,
          @JsonKey(name: 'created_at') required final String createdAt,
          @JsonKey(name: 'updated_at') required final String updatedAt,
          @JsonKey(name: 'parent_name') required final String parentName}) =
      _$LocationImpl;

  factory _Location.fromJson(Map<String, dynamic> json) =
      _$LocationImpl.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: 'parent_id')
  int get parentId;
  @override
  String get name;
  @override
  @JsonKey(name: 'created_at')
  String get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  String get updatedAt;
  @override
  @JsonKey(name: 'parent_name')
  String get parentName;

  /// Create a copy of Location
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LocationImplCopyWith<_$LocationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

HouseImage _$HouseImageFromJson(Map<String, dynamic> json) {
  return _HouseImage.fromJson(json);
}

/// @nodoc
mixin _$HouseImage {
  int get id => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;

  /// Serializes this HouseImage to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of HouseImage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HouseImageCopyWith<HouseImage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HouseImageCopyWith<$Res> {
  factory $HouseImageCopyWith(
          HouseImage value, $Res Function(HouseImage) then) =
      _$HouseImageCopyWithImpl<$Res, HouseImage>;
  @useResult
  $Res call({int id, String url});
}

/// @nodoc
class _$HouseImageCopyWithImpl<$Res, $Val extends HouseImage>
    implements $HouseImageCopyWith<$Res> {
  _$HouseImageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HouseImage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? url = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HouseImageImplCopyWith<$Res>
    implements $HouseImageCopyWith<$Res> {
  factory _$$HouseImageImplCopyWith(
          _$HouseImageImpl value, $Res Function(_$HouseImageImpl) then) =
      __$$HouseImageImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String url});
}

/// @nodoc
class __$$HouseImageImplCopyWithImpl<$Res>
    extends _$HouseImageCopyWithImpl<$Res, _$HouseImageImpl>
    implements _$$HouseImageImplCopyWith<$Res> {
  __$$HouseImageImplCopyWithImpl(
      _$HouseImageImpl _value, $Res Function(_$HouseImageImpl) _then)
      : super(_value, _then);

  /// Create a copy of HouseImage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? url = null,
  }) {
    return _then(_$HouseImageImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$HouseImageImpl implements _HouseImage {
  const _$HouseImageImpl({required this.id, required this.url});

  factory _$HouseImageImpl.fromJson(Map<String, dynamic> json) =>
      _$$HouseImageImplFromJson(json);

  @override
  final int id;
  @override
  final String url;

  @override
  String toString() {
    return 'HouseImage(id: $id, url: $url)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HouseImageImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.url, url) || other.url == url));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, url);

  /// Create a copy of HouseImage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HouseImageImplCopyWith<_$HouseImageImpl> get copyWith =>
      __$$HouseImageImplCopyWithImpl<_$HouseImageImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HouseImageImplToJson(
      this,
    );
  }
}

abstract class _HouseImage implements HouseImage {
  const factory _HouseImage(
      {required final int id, required final String url}) = _$HouseImageImpl;

  factory _HouseImage.fromJson(Map<String, dynamic> json) =
      _$HouseImageImpl.fromJson;

  @override
  int get id;
  @override
  String get url;

  /// Create a copy of HouseImage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HouseImageImplCopyWith<_$HouseImageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Possibility _$PossibilityFromJson(Map<String, dynamic> json) {
  return _Possibility.fromJson(json);
}

/// @nodoc
mixin _$Possibility {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;

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
  $Res call({int id, String name});
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
    Object? id = null,
    Object? name = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
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
  $Res call({int id, String name});
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
    Object? id = null,
    Object? name = null,
  }) {
    return _then(_$PossibilityImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PossibilityImpl implements _Possibility {
  const _$PossibilityImpl({required this.id, required this.name});

  factory _$PossibilityImpl.fromJson(Map<String, dynamic> json) =>
      _$$PossibilityImplFromJson(json);

  @override
  final int id;
  @override
  final String name;

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
  const factory _Possibility(
      {required final int id, required final String name}) = _$PossibilityImpl;

  factory _Possibility.fromJson(Map<String, dynamic> json) =
      _$PossibilityImpl.fromJson;

  @override
  int get id;
  @override
  String get name;

  /// Create a copy of Possibility
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PossibilityImplCopyWith<_$PossibilityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
