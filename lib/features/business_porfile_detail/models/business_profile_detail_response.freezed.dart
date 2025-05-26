// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'business_profile_detail_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

BusinessProfileDetailResponse _$BusinessProfileDetailResponseFromJson(
    Map<String, dynamic> json) {
  return _BusinessProfileDetailResponse.fromJson(json);
}

/// @nodoc
mixin _$BusinessProfileDetailResponse {
  BusinessProfileDetail? get data => throw _privateConstructorUsedError;

  /// Serializes this BusinessProfileDetailResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BusinessProfileDetailResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BusinessProfileDetailResponseCopyWith<BusinessProfileDetailResponse>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BusinessProfileDetailResponseCopyWith<$Res> {
  factory $BusinessProfileDetailResponseCopyWith(
          BusinessProfileDetailResponse value,
          $Res Function(BusinessProfileDetailResponse) then) =
      _$BusinessProfileDetailResponseCopyWithImpl<$Res,
          BusinessProfileDetailResponse>;
  @useResult
  $Res call({BusinessProfileDetail? data});

  $BusinessProfileDetailCopyWith<$Res>? get data;
}

/// @nodoc
class _$BusinessProfileDetailResponseCopyWithImpl<$Res,
        $Val extends BusinessProfileDetailResponse>
    implements $BusinessProfileDetailResponseCopyWith<$Res> {
  _$BusinessProfileDetailResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BusinessProfileDetailResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_value.copyWith(
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as BusinessProfileDetail?,
    ) as $Val);
  }

  /// Create a copy of BusinessProfileDetailResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BusinessProfileDetailCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $BusinessProfileDetailCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$BusinessProfileDetailResponseImplCopyWith<$Res>
    implements $BusinessProfileDetailResponseCopyWith<$Res> {
  factory _$$BusinessProfileDetailResponseImplCopyWith(
          _$BusinessProfileDetailResponseImpl value,
          $Res Function(_$BusinessProfileDetailResponseImpl) then) =
      __$$BusinessProfileDetailResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({BusinessProfileDetail? data});

  @override
  $BusinessProfileDetailCopyWith<$Res>? get data;
}

/// @nodoc
class __$$BusinessProfileDetailResponseImplCopyWithImpl<$Res>
    extends _$BusinessProfileDetailResponseCopyWithImpl<$Res,
        _$BusinessProfileDetailResponseImpl>
    implements _$$BusinessProfileDetailResponseImplCopyWith<$Res> {
  __$$BusinessProfileDetailResponseImplCopyWithImpl(
      _$BusinessProfileDetailResponseImpl _value,
      $Res Function(_$BusinessProfileDetailResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of BusinessProfileDetailResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_$BusinessProfileDetailResponseImpl(
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as BusinessProfileDetail?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BusinessProfileDetailResponseImpl
    implements _BusinessProfileDetailResponse {
  const _$BusinessProfileDetailResponseImpl({this.data});

  factory _$BusinessProfileDetailResponseImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$BusinessProfileDetailResponseImplFromJson(json);

  @override
  final BusinessProfileDetail? data;

  @override
  String toString() {
    return 'BusinessProfileDetailResponse(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BusinessProfileDetailResponseImpl &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, data);

  /// Create a copy of BusinessProfileDetailResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BusinessProfileDetailResponseImplCopyWith<
          _$BusinessProfileDetailResponseImpl>
      get copyWith => __$$BusinessProfileDetailResponseImplCopyWithImpl<
          _$BusinessProfileDetailResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BusinessProfileDetailResponseImplToJson(
      this,
    );
  }
}

abstract class _BusinessProfileDetailResponse
    implements BusinessProfileDetailResponse {
  const factory _BusinessProfileDetailResponse(
          {final BusinessProfileDetail? data}) =
      _$BusinessProfileDetailResponseImpl;

  factory _BusinessProfileDetailResponse.fromJson(Map<String, dynamic> json) =
      _$BusinessProfileDetailResponseImpl.fromJson;

  @override
  BusinessProfileDetail? get data;

  /// Create a copy of BusinessProfileDetailResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BusinessProfileDetailResponseImplCopyWith<
          _$BusinessProfileDetailResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}

BusinessProfileDetail _$BusinessProfileDetailFromJson(
    Map<String, dynamic> json) {
  return _BusinessProfileDetail.fromJson(json);
}

/// @nodoc
mixin _$BusinessProfileDetail {
  @JsonKey(name: 'id')
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'brand')
  String? get brand => throw _privateConstructorUsedError;
  @JsonKey(name: 'logo')
  String? get logo => throw _privateConstructorUsedError;
  @JsonKey(name: 'image')
  String? get image => throw _privateConstructorUsedError;
  @JsonKey(name: 'description')
  String? get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'views')
  int? get views => throw _privateConstructorUsedError;
  @JsonKey(name: 'cover_media')
  String? get coverMedia => throw _privateConstructorUsedError;
  @JsonKey(name: 'phone_numbers')
  String? get phoneNumbers => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_vip')
  int? get isVip => throw _privateConstructorUsedError;
  @JsonKey(name: 'vip_days')
  String? get vipDays => throw _privateConstructorUsedError;
  @JsonKey(name: 'site')
  String? get site => throw _privateConstructorUsedError;
  @JsonKey(name: 'mail')
  String? get mail => throw _privateConstructorUsedError;
  @JsonKey(name: 'social_profiles')
  List<dynamic>? get socialProfiles => throw _privateConstructorUsedError;
  @JsonKey(name: 'location')
  Location? get location => throw _privateConstructorUsedError;
  @JsonKey(name: 'product_count')
  int? get productCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'products')
  List<Product>? get products => throw _privateConstructorUsedError;
  @JsonKey(name: 'product_categories')
  List<ProductCategory>? get productCategories =>
      throw _privateConstructorUsedError;

  /// Serializes this BusinessProfileDetail to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BusinessProfileDetail
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BusinessProfileDetailCopyWith<BusinessProfileDetail> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BusinessProfileDetailCopyWith<$Res> {
  factory $BusinessProfileDetailCopyWith(BusinessProfileDetail value,
          $Res Function(BusinessProfileDetail) then) =
      _$BusinessProfileDetailCopyWithImpl<$Res, BusinessProfileDetail>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'brand') String? brand,
      @JsonKey(name: 'logo') String? logo,
      @JsonKey(name: 'image') String? image,
      @JsonKey(name: 'description') String? description,
      @JsonKey(name: 'views') int? views,
      @JsonKey(name: 'cover_media') String? coverMedia,
      @JsonKey(name: 'phone_numbers') String? phoneNumbers,
      @JsonKey(name: 'is_vip') int? isVip,
      @JsonKey(name: 'vip_days') String? vipDays,
      @JsonKey(name: 'site') String? site,
      @JsonKey(name: 'mail') String? mail,
      @JsonKey(name: 'social_profiles') List<dynamic>? socialProfiles,
      @JsonKey(name: 'location') Location? location,
      @JsonKey(name: 'product_count') int? productCount,
      @JsonKey(name: 'products') List<Product>? products,
      @JsonKey(name: 'product_categories')
      List<ProductCategory>? productCategories});

  $LocationCopyWith<$Res>? get location;
}

/// @nodoc
class _$BusinessProfileDetailCopyWithImpl<$Res,
        $Val extends BusinessProfileDetail>
    implements $BusinessProfileDetailCopyWith<$Res> {
  _$BusinessProfileDetailCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BusinessProfileDetail
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? brand = freezed,
    Object? logo = freezed,
    Object? image = freezed,
    Object? description = freezed,
    Object? views = freezed,
    Object? coverMedia = freezed,
    Object? phoneNumbers = freezed,
    Object? isVip = freezed,
    Object? vipDays = freezed,
    Object? site = freezed,
    Object? mail = freezed,
    Object? socialProfiles = freezed,
    Object? location = freezed,
    Object? productCount = freezed,
    Object? products = freezed,
    Object? productCategories = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      brand: freezed == brand
          ? _value.brand
          : brand // ignore: cast_nullable_to_non_nullable
              as String?,
      logo: freezed == logo
          ? _value.logo
          : logo // ignore: cast_nullable_to_non_nullable
              as String?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      views: freezed == views
          ? _value.views
          : views // ignore: cast_nullable_to_non_nullable
              as int?,
      coverMedia: freezed == coverMedia
          ? _value.coverMedia
          : coverMedia // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNumbers: freezed == phoneNumbers
          ? _value.phoneNumbers
          : phoneNumbers // ignore: cast_nullable_to_non_nullable
              as String?,
      isVip: freezed == isVip
          ? _value.isVip
          : isVip // ignore: cast_nullable_to_non_nullable
              as int?,
      vipDays: freezed == vipDays
          ? _value.vipDays
          : vipDays // ignore: cast_nullable_to_non_nullable
              as String?,
      site: freezed == site
          ? _value.site
          : site // ignore: cast_nullable_to_non_nullable
              as String?,
      mail: freezed == mail
          ? _value.mail
          : mail // ignore: cast_nullable_to_non_nullable
              as String?,
      socialProfiles: freezed == socialProfiles
          ? _value.socialProfiles
          : socialProfiles // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as Location?,
      productCount: freezed == productCount
          ? _value.productCount
          : productCount // ignore: cast_nullable_to_non_nullable
              as int?,
      products: freezed == products
          ? _value.products
          : products // ignore: cast_nullable_to_non_nullable
              as List<Product>?,
      productCategories: freezed == productCategories
          ? _value.productCategories
          : productCategories // ignore: cast_nullable_to_non_nullable
              as List<ProductCategory>?,
    ) as $Val);
  }

  /// Create a copy of BusinessProfileDetail
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
abstract class _$$BusinessProfileDetailImplCopyWith<$Res>
    implements $BusinessProfileDetailCopyWith<$Res> {
  factory _$$BusinessProfileDetailImplCopyWith(
          _$BusinessProfileDetailImpl value,
          $Res Function(_$BusinessProfileDetailImpl) then) =
      __$$BusinessProfileDetailImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'brand') String? brand,
      @JsonKey(name: 'logo') String? logo,
      @JsonKey(name: 'image') String? image,
      @JsonKey(name: 'description') String? description,
      @JsonKey(name: 'views') int? views,
      @JsonKey(name: 'cover_media') String? coverMedia,
      @JsonKey(name: 'phone_numbers') String? phoneNumbers,
      @JsonKey(name: 'is_vip') int? isVip,
      @JsonKey(name: 'vip_days') String? vipDays,
      @JsonKey(name: 'site') String? site,
      @JsonKey(name: 'mail') String? mail,
      @JsonKey(name: 'social_profiles') List<dynamic>? socialProfiles,
      @JsonKey(name: 'location') Location? location,
      @JsonKey(name: 'product_count') int? productCount,
      @JsonKey(name: 'products') List<Product>? products,
      @JsonKey(name: 'product_categories')
      List<ProductCategory>? productCategories});

  @override
  $LocationCopyWith<$Res>? get location;
}

/// @nodoc
class __$$BusinessProfileDetailImplCopyWithImpl<$Res>
    extends _$BusinessProfileDetailCopyWithImpl<$Res,
        _$BusinessProfileDetailImpl>
    implements _$$BusinessProfileDetailImplCopyWith<$Res> {
  __$$BusinessProfileDetailImplCopyWithImpl(_$BusinessProfileDetailImpl _value,
      $Res Function(_$BusinessProfileDetailImpl) _then)
      : super(_value, _then);

  /// Create a copy of BusinessProfileDetail
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? brand = freezed,
    Object? logo = freezed,
    Object? image = freezed,
    Object? description = freezed,
    Object? views = freezed,
    Object? coverMedia = freezed,
    Object? phoneNumbers = freezed,
    Object? isVip = freezed,
    Object? vipDays = freezed,
    Object? site = freezed,
    Object? mail = freezed,
    Object? socialProfiles = freezed,
    Object? location = freezed,
    Object? productCount = freezed,
    Object? products = freezed,
    Object? productCategories = freezed,
  }) {
    return _then(_$BusinessProfileDetailImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      brand: freezed == brand
          ? _value.brand
          : brand // ignore: cast_nullable_to_non_nullable
              as String?,
      logo: freezed == logo
          ? _value.logo
          : logo // ignore: cast_nullable_to_non_nullable
              as String?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      views: freezed == views
          ? _value.views
          : views // ignore: cast_nullable_to_non_nullable
              as int?,
      coverMedia: freezed == coverMedia
          ? _value.coverMedia
          : coverMedia // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNumbers: freezed == phoneNumbers
          ? _value.phoneNumbers
          : phoneNumbers // ignore: cast_nullable_to_non_nullable
              as String?,
      isVip: freezed == isVip
          ? _value.isVip
          : isVip // ignore: cast_nullable_to_non_nullable
              as int?,
      vipDays: freezed == vipDays
          ? _value.vipDays
          : vipDays // ignore: cast_nullable_to_non_nullable
              as String?,
      site: freezed == site
          ? _value.site
          : site // ignore: cast_nullable_to_non_nullable
              as String?,
      mail: freezed == mail
          ? _value.mail
          : mail // ignore: cast_nullable_to_non_nullable
              as String?,
      socialProfiles: freezed == socialProfiles
          ? _value._socialProfiles
          : socialProfiles // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as Location?,
      productCount: freezed == productCount
          ? _value.productCount
          : productCount // ignore: cast_nullable_to_non_nullable
              as int?,
      products: freezed == products
          ? _value._products
          : products // ignore: cast_nullable_to_non_nullable
              as List<Product>?,
      productCategories: freezed == productCategories
          ? _value._productCategories
          : productCategories // ignore: cast_nullable_to_non_nullable
              as List<ProductCategory>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BusinessProfileDetailImpl implements _BusinessProfileDetail {
  const _$BusinessProfileDetailImpl(
      {@JsonKey(name: 'id') this.id,
      @JsonKey(name: 'brand') this.brand,
      @JsonKey(name: 'logo') this.logo,
      @JsonKey(name: 'image') this.image,
      @JsonKey(name: 'description') this.description,
      @JsonKey(name: 'views') this.views,
      @JsonKey(name: 'cover_media') this.coverMedia,
      @JsonKey(name: 'phone_numbers') this.phoneNumbers,
      @JsonKey(name: 'is_vip') this.isVip,
      @JsonKey(name: 'vip_days') this.vipDays,
      @JsonKey(name: 'site') this.site,
      @JsonKey(name: 'mail') this.mail,
      @JsonKey(name: 'social_profiles') final List<dynamic>? socialProfiles,
      @JsonKey(name: 'location') this.location,
      @JsonKey(name: 'product_count') this.productCount,
      @JsonKey(name: 'products') final List<Product>? products,
      @JsonKey(name: 'product_categories')
      final List<ProductCategory>? productCategories})
      : _socialProfiles = socialProfiles,
        _products = products,
        _productCategories = productCategories;

  factory _$BusinessProfileDetailImpl.fromJson(Map<String, dynamic> json) =>
      _$$BusinessProfileDetailImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int? id;
  @override
  @JsonKey(name: 'brand')
  final String? brand;
  @override
  @JsonKey(name: 'logo')
  final String? logo;
  @override
  @JsonKey(name: 'image')
  final String? image;
  @override
  @JsonKey(name: 'description')
  final String? description;
  @override
  @JsonKey(name: 'views')
  final int? views;
  @override
  @JsonKey(name: 'cover_media')
  final String? coverMedia;
  @override
  @JsonKey(name: 'phone_numbers')
  final String? phoneNumbers;
  @override
  @JsonKey(name: 'is_vip')
  final int? isVip;
  @override
  @JsonKey(name: 'vip_days')
  final String? vipDays;
  @override
  @JsonKey(name: 'site')
  final String? site;
  @override
  @JsonKey(name: 'mail')
  final String? mail;
  final List<dynamic>? _socialProfiles;
  @override
  @JsonKey(name: 'social_profiles')
  List<dynamic>? get socialProfiles {
    final value = _socialProfiles;
    if (value == null) return null;
    if (_socialProfiles is EqualUnmodifiableListView) return _socialProfiles;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'location')
  final Location? location;
  @override
  @JsonKey(name: 'product_count')
  final int? productCount;
  final List<Product>? _products;
  @override
  @JsonKey(name: 'products')
  List<Product>? get products {
    final value = _products;
    if (value == null) return null;
    if (_products is EqualUnmodifiableListView) return _products;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<ProductCategory>? _productCategories;
  @override
  @JsonKey(name: 'product_categories')
  List<ProductCategory>? get productCategories {
    final value = _productCategories;
    if (value == null) return null;
    if (_productCategories is EqualUnmodifiableListView)
      return _productCategories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'BusinessProfileDetail(id: $id, brand: $brand, logo: $logo, image: $image, description: $description, views: $views, coverMedia: $coverMedia, phoneNumbers: $phoneNumbers, isVip: $isVip, vipDays: $vipDays, site: $site, mail: $mail, socialProfiles: $socialProfiles, location: $location, productCount: $productCount, products: $products, productCategories: $productCategories)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BusinessProfileDetailImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.brand, brand) || other.brand == brand) &&
            (identical(other.logo, logo) || other.logo == logo) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.views, views) || other.views == views) &&
            (identical(other.coverMedia, coverMedia) ||
                other.coverMedia == coverMedia) &&
            (identical(other.phoneNumbers, phoneNumbers) ||
                other.phoneNumbers == phoneNumbers) &&
            (identical(other.isVip, isVip) || other.isVip == isVip) &&
            (identical(other.vipDays, vipDays) || other.vipDays == vipDays) &&
            (identical(other.site, site) || other.site == site) &&
            (identical(other.mail, mail) || other.mail == mail) &&
            const DeepCollectionEquality()
                .equals(other._socialProfiles, _socialProfiles) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.productCount, productCount) ||
                other.productCount == productCount) &&
            const DeepCollectionEquality().equals(other._products, _products) &&
            const DeepCollectionEquality()
                .equals(other._productCategories, _productCategories));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      brand,
      logo,
      image,
      description,
      views,
      coverMedia,
      phoneNumbers,
      isVip,
      vipDays,
      site,
      mail,
      const DeepCollectionEquality().hash(_socialProfiles),
      location,
      productCount,
      const DeepCollectionEquality().hash(_products),
      const DeepCollectionEquality().hash(_productCategories));

  /// Create a copy of BusinessProfileDetail
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BusinessProfileDetailImplCopyWith<_$BusinessProfileDetailImpl>
      get copyWith => __$$BusinessProfileDetailImplCopyWithImpl<
          _$BusinessProfileDetailImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BusinessProfileDetailImplToJson(
      this,
    );
  }
}

abstract class _BusinessProfileDetail implements BusinessProfileDetail {
  const factory _BusinessProfileDetail(
          {@JsonKey(name: 'id') final int? id,
          @JsonKey(name: 'brand') final String? brand,
          @JsonKey(name: 'logo') final String? logo,
          @JsonKey(name: 'image') final String? image,
          @JsonKey(name: 'description') final String? description,
          @JsonKey(name: 'views') final int? views,
          @JsonKey(name: 'cover_media') final String? coverMedia,
          @JsonKey(name: 'phone_numbers') final String? phoneNumbers,
          @JsonKey(name: 'is_vip') final int? isVip,
          @JsonKey(name: 'vip_days') final String? vipDays,
          @JsonKey(name: 'site') final String? site,
          @JsonKey(name: 'mail') final String? mail,
          @JsonKey(name: 'social_profiles') final List<dynamic>? socialProfiles,
          @JsonKey(name: 'location') final Location? location,
          @JsonKey(name: 'product_count') final int? productCount,
          @JsonKey(name: 'products') final List<Product>? products,
          @JsonKey(name: 'product_categories')
          final List<ProductCategory>? productCategories}) =
      _$BusinessProfileDetailImpl;

  factory _BusinessProfileDetail.fromJson(Map<String, dynamic> json) =
      _$BusinessProfileDetailImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  int? get id;
  @override
  @JsonKey(name: 'brand')
  String? get brand;
  @override
  @JsonKey(name: 'logo')
  String? get logo;
  @override
  @JsonKey(name: 'image')
  String? get image;
  @override
  @JsonKey(name: 'description')
  String? get description;
  @override
  @JsonKey(name: 'views')
  int? get views;
  @override
  @JsonKey(name: 'cover_media')
  String? get coverMedia;
  @override
  @JsonKey(name: 'phone_numbers')
  String? get phoneNumbers;
  @override
  @JsonKey(name: 'is_vip')
  int? get isVip;
  @override
  @JsonKey(name: 'vip_days')
  String? get vipDays;
  @override
  @JsonKey(name: 'site')
  String? get site;
  @override
  @JsonKey(name: 'mail')
  String? get mail;
  @override
  @JsonKey(name: 'social_profiles')
  List<dynamic>? get socialProfiles;
  @override
  @JsonKey(name: 'location')
  Location? get location;
  @override
  @JsonKey(name: 'product_count')
  int? get productCount;
  @override
  @JsonKey(name: 'products')
  List<Product>? get products;
  @override
  @JsonKey(name: 'product_categories')
  List<ProductCategory>? get productCategories;

  /// Create a copy of BusinessProfileDetail
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BusinessProfileDetailImplCopyWith<_$BusinessProfileDetailImpl>
      get copyWith => throw _privateConstructorUsedError;
}

Location _$LocationFromJson(Map<String, dynamic> json) {
  return _Location.fromJson(json);
}

/// @nodoc
mixin _$Location {
  @JsonKey(name: 'id')
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'parent_id')
  int? get parentId => throw _privateConstructorUsedError;
  @JsonKey(name: 'name')
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  String? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  String? get updatedAt => throw _privateConstructorUsedError;
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
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'parent_id') int? parentId,
      @JsonKey(name: 'name') String? name,
      @JsonKey(name: 'created_at') String? createdAt,
      @JsonKey(name: 'updated_at') String? updatedAt,
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
              as String?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
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
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'parent_id') int? parentId,
      @JsonKey(name: 'name') String? name,
      @JsonKey(name: 'created_at') String? createdAt,
      @JsonKey(name: 'updated_at') String? updatedAt,
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
              as String?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
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
      {@JsonKey(name: 'id') this.id,
      @JsonKey(name: 'parent_id') this.parentId,
      @JsonKey(name: 'name') this.name,
      @JsonKey(name: 'created_at') this.createdAt,
      @JsonKey(name: 'updated_at') this.updatedAt,
      @JsonKey(name: 'parent_name') this.parentName});

  factory _$LocationImpl.fromJson(Map<String, dynamic> json) =>
      _$$LocationImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int? id;
  @override
  @JsonKey(name: 'parent_id')
  final int? parentId;
  @override
  @JsonKey(name: 'name')
  final String? name;
  @override
  @JsonKey(name: 'created_at')
  final String? createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final String? updatedAt;
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
      {@JsonKey(name: 'id') final int? id,
      @JsonKey(name: 'parent_id') final int? parentId,
      @JsonKey(name: 'name') final String? name,
      @JsonKey(name: 'created_at') final String? createdAt,
      @JsonKey(name: 'updated_at') final String? updatedAt,
      @JsonKey(name: 'parent_name') final String? parentName}) = _$LocationImpl;

  factory _Location.fromJson(Map<String, dynamic> json) =
      _$LocationImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  int? get id;
  @override
  @JsonKey(name: 'parent_id')
  int? get parentId;
  @override
  @JsonKey(name: 'name')
  String? get name;
  @override
  @JsonKey(name: 'created_at')
  String? get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  String? get updatedAt;
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

Product _$ProductFromJson(Map<String, dynamic> json) {
  return _Product.fromJson(json);
}

/// @nodoc
mixin _$Product {
  @JsonKey(name: 'id')
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'name')
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_id')
  int? get userId => throw _privateConstructorUsedError;
  @JsonKey(name: 'shop_id')
  int? get shopId => throw _privateConstructorUsedError;
  @JsonKey(name: 'location_id')
  int? get locationId => throw _privateConstructorUsedError;
  @JsonKey(name: 'category_id')
  int? get categoryId => throw _privateConstructorUsedError;
  @JsonKey(name: 'price')
  double? get price => throw _privateConstructorUsedError;
  @JsonKey(name: 'status')
  String? get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'expire')
  String? get expire => throw _privateConstructorUsedError;
  @JsonKey(name: 'phone')
  String? get phone => throw _privateConstructorUsedError;
  @JsonKey(name: 'who')
  String? get who => throw _privateConstructorUsedError;
  @JsonKey(name: 'delivery')
  int? get delivery => throw _privateConstructorUsedError;
  @JsonKey(name: 'comment')
  int? get comment => throw _privateConstructorUsedError;
  @JsonKey(name: 'description')
  String? get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'brief_description')
  String? get briefDescription => throw _privateConstructorUsedError;
  @JsonKey(name: 'lover_price')
  double? get loverPrice => throw _privateConstructorUsedError;
  @JsonKey(name: 'vip')
  dynamic get vip => throw _privateConstructorUsedError;
  @JsonKey(name: 'exclusive')
  int? get exclusive => throw _privateConstructorUsedError;
  @JsonKey(name: 'hashtag')
  String? get hashtag => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  String? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  String? get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this Product to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Product
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProductCopyWith<Product> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductCopyWith<$Res> {
  factory $ProductCopyWith(Product value, $Res Function(Product) then) =
      _$ProductCopyWithImpl<$Res, Product>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'name') String? name,
      @JsonKey(name: 'user_id') int? userId,
      @JsonKey(name: 'shop_id') int? shopId,
      @JsonKey(name: 'location_id') int? locationId,
      @JsonKey(name: 'category_id') int? categoryId,
      @JsonKey(name: 'price') double? price,
      @JsonKey(name: 'status') String? status,
      @JsonKey(name: 'expire') String? expire,
      @JsonKey(name: 'phone') String? phone,
      @JsonKey(name: 'who') String? who,
      @JsonKey(name: 'delivery') int? delivery,
      @JsonKey(name: 'comment') int? comment,
      @JsonKey(name: 'description') String? description,
      @JsonKey(name: 'brief_description') String? briefDescription,
      @JsonKey(name: 'lover_price') double? loverPrice,
      @JsonKey(name: 'vip') dynamic vip,
      @JsonKey(name: 'exclusive') int? exclusive,
      @JsonKey(name: 'hashtag') String? hashtag,
      @JsonKey(name: 'created_at') String? createdAt,
      @JsonKey(name: 'updated_at') String? updatedAt});
}

/// @nodoc
class _$ProductCopyWithImpl<$Res, $Val extends Product>
    implements $ProductCopyWith<$Res> {
  _$ProductCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Product
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? userId = freezed,
    Object? shopId = freezed,
    Object? locationId = freezed,
    Object? categoryId = freezed,
    Object? price = freezed,
    Object? status = freezed,
    Object? expire = freezed,
    Object? phone = freezed,
    Object? who = freezed,
    Object? delivery = freezed,
    Object? comment = freezed,
    Object? description = freezed,
    Object? briefDescription = freezed,
    Object? loverPrice = freezed,
    Object? vip = freezed,
    Object? exclusive = freezed,
    Object? hashtag = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
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
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int?,
      shopId: freezed == shopId
          ? _value.shopId
          : shopId // ignore: cast_nullable_to_non_nullable
              as int?,
      locationId: freezed == locationId
          ? _value.locationId
          : locationId // ignore: cast_nullable_to_non_nullable
              as int?,
      categoryId: freezed == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as int?,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      expire: freezed == expire
          ? _value.expire
          : expire // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      who: freezed == who
          ? _value.who
          : who // ignore: cast_nullable_to_non_nullable
              as String?,
      delivery: freezed == delivery
          ? _value.delivery
          : delivery // ignore: cast_nullable_to_non_nullable
              as int?,
      comment: freezed == comment
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as int?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      briefDescription: freezed == briefDescription
          ? _value.briefDescription
          : briefDescription // ignore: cast_nullable_to_non_nullable
              as String?,
      loverPrice: freezed == loverPrice
          ? _value.loverPrice
          : loverPrice // ignore: cast_nullable_to_non_nullable
              as double?,
      vip: freezed == vip
          ? _value.vip
          : vip // ignore: cast_nullable_to_non_nullable
              as dynamic,
      exclusive: freezed == exclusive
          ? _value.exclusive
          : exclusive // ignore: cast_nullable_to_non_nullable
              as int?,
      hashtag: freezed == hashtag
          ? _value.hashtag
          : hashtag // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProductImplCopyWith<$Res> implements $ProductCopyWith<$Res> {
  factory _$$ProductImplCopyWith(
          _$ProductImpl value, $Res Function(_$ProductImpl) then) =
      __$$ProductImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'name') String? name,
      @JsonKey(name: 'user_id') int? userId,
      @JsonKey(name: 'shop_id') int? shopId,
      @JsonKey(name: 'location_id') int? locationId,
      @JsonKey(name: 'category_id') int? categoryId,
      @JsonKey(name: 'price') double? price,
      @JsonKey(name: 'status') String? status,
      @JsonKey(name: 'expire') String? expire,
      @JsonKey(name: 'phone') String? phone,
      @JsonKey(name: 'who') String? who,
      @JsonKey(name: 'delivery') int? delivery,
      @JsonKey(name: 'comment') int? comment,
      @JsonKey(name: 'description') String? description,
      @JsonKey(name: 'brief_description') String? briefDescription,
      @JsonKey(name: 'lover_price') double? loverPrice,
      @JsonKey(name: 'vip') dynamic vip,
      @JsonKey(name: 'exclusive') int? exclusive,
      @JsonKey(name: 'hashtag') String? hashtag,
      @JsonKey(name: 'created_at') String? createdAt,
      @JsonKey(name: 'updated_at') String? updatedAt});
}

/// @nodoc
class __$$ProductImplCopyWithImpl<$Res>
    extends _$ProductCopyWithImpl<$Res, _$ProductImpl>
    implements _$$ProductImplCopyWith<$Res> {
  __$$ProductImplCopyWithImpl(
      _$ProductImpl _value, $Res Function(_$ProductImpl) _then)
      : super(_value, _then);

  /// Create a copy of Product
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? userId = freezed,
    Object? shopId = freezed,
    Object? locationId = freezed,
    Object? categoryId = freezed,
    Object? price = freezed,
    Object? status = freezed,
    Object? expire = freezed,
    Object? phone = freezed,
    Object? who = freezed,
    Object? delivery = freezed,
    Object? comment = freezed,
    Object? description = freezed,
    Object? briefDescription = freezed,
    Object? loverPrice = freezed,
    Object? vip = freezed,
    Object? exclusive = freezed,
    Object? hashtag = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$ProductImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int?,
      shopId: freezed == shopId
          ? _value.shopId
          : shopId // ignore: cast_nullable_to_non_nullable
              as int?,
      locationId: freezed == locationId
          ? _value.locationId
          : locationId // ignore: cast_nullable_to_non_nullable
              as int?,
      categoryId: freezed == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as int?,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      expire: freezed == expire
          ? _value.expire
          : expire // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      who: freezed == who
          ? _value.who
          : who // ignore: cast_nullable_to_non_nullable
              as String?,
      delivery: freezed == delivery
          ? _value.delivery
          : delivery // ignore: cast_nullable_to_non_nullable
              as int?,
      comment: freezed == comment
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as int?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      briefDescription: freezed == briefDescription
          ? _value.briefDescription
          : briefDescription // ignore: cast_nullable_to_non_nullable
              as String?,
      loverPrice: freezed == loverPrice
          ? _value.loverPrice
          : loverPrice // ignore: cast_nullable_to_non_nullable
              as double?,
      vip: freezed == vip
          ? _value.vip
          : vip // ignore: cast_nullable_to_non_nullable
              as dynamic,
      exclusive: freezed == exclusive
          ? _value.exclusive
          : exclusive // ignore: cast_nullable_to_non_nullable
              as int?,
      hashtag: freezed == hashtag
          ? _value.hashtag
          : hashtag // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProductImpl implements _Product {
  const _$ProductImpl(
      {@JsonKey(name: 'id') this.id,
      @JsonKey(name: 'name') this.name,
      @JsonKey(name: 'user_id') this.userId,
      @JsonKey(name: 'shop_id') this.shopId,
      @JsonKey(name: 'location_id') this.locationId,
      @JsonKey(name: 'category_id') this.categoryId,
      @JsonKey(name: 'price') this.price,
      @JsonKey(name: 'status') this.status,
      @JsonKey(name: 'expire') this.expire,
      @JsonKey(name: 'phone') this.phone,
      @JsonKey(name: 'who') this.who,
      @JsonKey(name: 'delivery') this.delivery,
      @JsonKey(name: 'comment') this.comment,
      @JsonKey(name: 'description') this.description,
      @JsonKey(name: 'brief_description') this.briefDescription,
      @JsonKey(name: 'lover_price') this.loverPrice,
      @JsonKey(name: 'vip') this.vip,
      @JsonKey(name: 'exclusive') this.exclusive,
      @JsonKey(name: 'hashtag') this.hashtag,
      @JsonKey(name: 'created_at') this.createdAt,
      @JsonKey(name: 'updated_at') this.updatedAt});

  factory _$ProductImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProductImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int? id;
  @override
  @JsonKey(name: 'name')
  final String? name;
  @override
  @JsonKey(name: 'user_id')
  final int? userId;
  @override
  @JsonKey(name: 'shop_id')
  final int? shopId;
  @override
  @JsonKey(name: 'location_id')
  final int? locationId;
  @override
  @JsonKey(name: 'category_id')
  final int? categoryId;
  @override
  @JsonKey(name: 'price')
  final double? price;
  @override
  @JsonKey(name: 'status')
  final String? status;
  @override
  @JsonKey(name: 'expire')
  final String? expire;
  @override
  @JsonKey(name: 'phone')
  final String? phone;
  @override
  @JsonKey(name: 'who')
  final String? who;
  @override
  @JsonKey(name: 'delivery')
  final int? delivery;
  @override
  @JsonKey(name: 'comment')
  final int? comment;
  @override
  @JsonKey(name: 'description')
  final String? description;
  @override
  @JsonKey(name: 'brief_description')
  final String? briefDescription;
  @override
  @JsonKey(name: 'lover_price')
  final double? loverPrice;
  @override
  @JsonKey(name: 'vip')
  final dynamic vip;
  @override
  @JsonKey(name: 'exclusive')
  final int? exclusive;
  @override
  @JsonKey(name: 'hashtag')
  final String? hashtag;
  @override
  @JsonKey(name: 'created_at')
  final String? createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final String? updatedAt;

  @override
  String toString() {
    return 'Product(id: $id, name: $name, userId: $userId, shopId: $shopId, locationId: $locationId, categoryId: $categoryId, price: $price, status: $status, expire: $expire, phone: $phone, who: $who, delivery: $delivery, comment: $comment, description: $description, briefDescription: $briefDescription, loverPrice: $loverPrice, vip: $vip, exclusive: $exclusive, hashtag: $hashtag, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.shopId, shopId) || other.shopId == shopId) &&
            (identical(other.locationId, locationId) ||
                other.locationId == locationId) &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.expire, expire) || other.expire == expire) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.who, who) || other.who == who) &&
            (identical(other.delivery, delivery) ||
                other.delivery == delivery) &&
            (identical(other.comment, comment) || other.comment == comment) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.briefDescription, briefDescription) ||
                other.briefDescription == briefDescription) &&
            (identical(other.loverPrice, loverPrice) ||
                other.loverPrice == loverPrice) &&
            const DeepCollectionEquality().equals(other.vip, vip) &&
            (identical(other.exclusive, exclusive) ||
                other.exclusive == exclusive) &&
            (identical(other.hashtag, hashtag) || other.hashtag == hashtag) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        name,
        userId,
        shopId,
        locationId,
        categoryId,
        price,
        status,
        expire,
        phone,
        who,
        delivery,
        comment,
        description,
        briefDescription,
        loverPrice,
        const DeepCollectionEquality().hash(vip),
        exclusive,
        hashtag,
        createdAt,
        updatedAt
      ]);

  /// Create a copy of Product
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductImplCopyWith<_$ProductImpl> get copyWith =>
      __$$ProductImplCopyWithImpl<_$ProductImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductImplToJson(
      this,
    );
  }
}

abstract class _Product implements Product {
  const factory _Product(
      {@JsonKey(name: 'id') final int? id,
      @JsonKey(name: 'name') final String? name,
      @JsonKey(name: 'user_id') final int? userId,
      @JsonKey(name: 'shop_id') final int? shopId,
      @JsonKey(name: 'location_id') final int? locationId,
      @JsonKey(name: 'category_id') final int? categoryId,
      @JsonKey(name: 'price') final double? price,
      @JsonKey(name: 'status') final String? status,
      @JsonKey(name: 'expire') final String? expire,
      @JsonKey(name: 'phone') final String? phone,
      @JsonKey(name: 'who') final String? who,
      @JsonKey(name: 'delivery') final int? delivery,
      @JsonKey(name: 'comment') final int? comment,
      @JsonKey(name: 'description') final String? description,
      @JsonKey(name: 'brief_description') final String? briefDescription,
      @JsonKey(name: 'lover_price') final double? loverPrice,
      @JsonKey(name: 'vip') final dynamic vip,
      @JsonKey(name: 'exclusive') final int? exclusive,
      @JsonKey(name: 'hashtag') final String? hashtag,
      @JsonKey(name: 'created_at') final String? createdAt,
      @JsonKey(name: 'updated_at') final String? updatedAt}) = _$ProductImpl;

  factory _Product.fromJson(Map<String, dynamic> json) = _$ProductImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  int? get id;
  @override
  @JsonKey(name: 'name')
  String? get name;
  @override
  @JsonKey(name: 'user_id')
  int? get userId;
  @override
  @JsonKey(name: 'shop_id')
  int? get shopId;
  @override
  @JsonKey(name: 'location_id')
  int? get locationId;
  @override
  @JsonKey(name: 'category_id')
  int? get categoryId;
  @override
  @JsonKey(name: 'price')
  double? get price;
  @override
  @JsonKey(name: 'status')
  String? get status;
  @override
  @JsonKey(name: 'expire')
  String? get expire;
  @override
  @JsonKey(name: 'phone')
  String? get phone;
  @override
  @JsonKey(name: 'who')
  String? get who;
  @override
  @JsonKey(name: 'delivery')
  int? get delivery;
  @override
  @JsonKey(name: 'comment')
  int? get comment;
  @override
  @JsonKey(name: 'description')
  String? get description;
  @override
  @JsonKey(name: 'brief_description')
  String? get briefDescription;
  @override
  @JsonKey(name: 'lover_price')
  double? get loverPrice;
  @override
  @JsonKey(name: 'vip')
  dynamic get vip;
  @override
  @JsonKey(name: 'exclusive')
  int? get exclusive;
  @override
  @JsonKey(name: 'hashtag')
  String? get hashtag;
  @override
  @JsonKey(name: 'created_at')
  String? get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  String? get updatedAt;

  /// Create a copy of Product
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProductImplCopyWith<_$ProductImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ProductCategory _$ProductCategoryFromJson(Map<String, dynamic> json) {
  return _ProductCategory.fromJson(json);
}

/// @nodoc
mixin _$ProductCategory {
  @JsonKey(name: 'id')
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'title')
  String? get title => throw _privateConstructorUsedError;
  @JsonKey(name: 'image')
  String? get image => throw _privateConstructorUsedError;
  @JsonKey(name: 'parent')
  List<ParentCategory>? get parent => throw _privateConstructorUsedError;
  @JsonKey(name: 'description')
  String? get description => throw _privateConstructorUsedError;

  /// Serializes this ProductCategory to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ProductCategory
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProductCategoryCopyWith<ProductCategory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductCategoryCopyWith<$Res> {
  factory $ProductCategoryCopyWith(
          ProductCategory value, $Res Function(ProductCategory) then) =
      _$ProductCategoryCopyWithImpl<$Res, ProductCategory>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'title') String? title,
      @JsonKey(name: 'image') String? image,
      @JsonKey(name: 'parent') List<ParentCategory>? parent,
      @JsonKey(name: 'description') String? description});
}

/// @nodoc
class _$ProductCategoryCopyWithImpl<$Res, $Val extends ProductCategory>
    implements $ProductCategoryCopyWith<$Res> {
  _$ProductCategoryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProductCategory
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? image = freezed,
    Object? parent = freezed,
    Object? description = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      parent: freezed == parent
          ? _value.parent
          : parent // ignore: cast_nullable_to_non_nullable
              as List<ParentCategory>?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProductCategoryImplCopyWith<$Res>
    implements $ProductCategoryCopyWith<$Res> {
  factory _$$ProductCategoryImplCopyWith(_$ProductCategoryImpl value,
          $Res Function(_$ProductCategoryImpl) then) =
      __$$ProductCategoryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'title') String? title,
      @JsonKey(name: 'image') String? image,
      @JsonKey(name: 'parent') List<ParentCategory>? parent,
      @JsonKey(name: 'description') String? description});
}

/// @nodoc
class __$$ProductCategoryImplCopyWithImpl<$Res>
    extends _$ProductCategoryCopyWithImpl<$Res, _$ProductCategoryImpl>
    implements _$$ProductCategoryImplCopyWith<$Res> {
  __$$ProductCategoryImplCopyWithImpl(
      _$ProductCategoryImpl _value, $Res Function(_$ProductCategoryImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProductCategory
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? image = freezed,
    Object? parent = freezed,
    Object? description = freezed,
  }) {
    return _then(_$ProductCategoryImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      parent: freezed == parent
          ? _value._parent
          : parent // ignore: cast_nullable_to_non_nullable
              as List<ParentCategory>?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProductCategoryImpl implements _ProductCategory {
  const _$ProductCategoryImpl(
      {@JsonKey(name: 'id') this.id,
      @JsonKey(name: 'title') this.title,
      @JsonKey(name: 'image') this.image,
      @JsonKey(name: 'parent') final List<ParentCategory>? parent,
      @JsonKey(name: 'description') this.description})
      : _parent = parent;

  factory _$ProductCategoryImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProductCategoryImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int? id;
  @override
  @JsonKey(name: 'title')
  final String? title;
  @override
  @JsonKey(name: 'image')
  final String? image;
  final List<ParentCategory>? _parent;
  @override
  @JsonKey(name: 'parent')
  List<ParentCategory>? get parent {
    final value = _parent;
    if (value == null) return null;
    if (_parent is EqualUnmodifiableListView) return _parent;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'description')
  final String? description;

  @override
  String toString() {
    return 'ProductCategory(id: $id, title: $title, image: $image, parent: $parent, description: $description)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductCategoryImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.image, image) || other.image == image) &&
            const DeepCollectionEquality().equals(other._parent, _parent) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, title, image,
      const DeepCollectionEquality().hash(_parent), description);

  /// Create a copy of ProductCategory
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductCategoryImplCopyWith<_$ProductCategoryImpl> get copyWith =>
      __$$ProductCategoryImplCopyWithImpl<_$ProductCategoryImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductCategoryImplToJson(
      this,
    );
  }
}

abstract class _ProductCategory implements ProductCategory {
  const factory _ProductCategory(
          {@JsonKey(name: 'id') final int? id,
          @JsonKey(name: 'title') final String? title,
          @JsonKey(name: 'image') final String? image,
          @JsonKey(name: 'parent') final List<ParentCategory>? parent,
          @JsonKey(name: 'description') final String? description}) =
      _$ProductCategoryImpl;

  factory _ProductCategory.fromJson(Map<String, dynamic> json) =
      _$ProductCategoryImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  int? get id;
  @override
  @JsonKey(name: 'title')
  String? get title;
  @override
  @JsonKey(name: 'image')
  String? get image;
  @override
  @JsonKey(name: 'parent')
  List<ParentCategory>? get parent;
  @override
  @JsonKey(name: 'description')
  String? get description;

  /// Create a copy of ProductCategory
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProductCategoryImplCopyWith<_$ProductCategoryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ParentCategory _$ParentCategoryFromJson(Map<String, dynamic> json) {
  return _ParentCategory.fromJson(json);
}

/// @nodoc
mixin _$ParentCategory {
  @JsonKey(name: 'id')
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'title')
  String? get title => throw _privateConstructorUsedError;
  @JsonKey(name: 'image')
  String? get image => throw _privateConstructorUsedError;
  @JsonKey(name: 'parent')
  dynamic get parent => throw _privateConstructorUsedError;
  @JsonKey(name: 'description')
  String? get description => throw _privateConstructorUsedError;

  /// Serializes this ParentCategory to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ParentCategory
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ParentCategoryCopyWith<ParentCategory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ParentCategoryCopyWith<$Res> {
  factory $ParentCategoryCopyWith(
          ParentCategory value, $Res Function(ParentCategory) then) =
      _$ParentCategoryCopyWithImpl<$Res, ParentCategory>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'title') String? title,
      @JsonKey(name: 'image') String? image,
      @JsonKey(name: 'parent') dynamic parent,
      @JsonKey(name: 'description') String? description});
}

/// @nodoc
class _$ParentCategoryCopyWithImpl<$Res, $Val extends ParentCategory>
    implements $ParentCategoryCopyWith<$Res> {
  _$ParentCategoryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ParentCategory
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? image = freezed,
    Object? parent = freezed,
    Object? description = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      parent: freezed == parent
          ? _value.parent
          : parent // ignore: cast_nullable_to_non_nullable
              as dynamic,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ParentCategoryImplCopyWith<$Res>
    implements $ParentCategoryCopyWith<$Res> {
  factory _$$ParentCategoryImplCopyWith(_$ParentCategoryImpl value,
          $Res Function(_$ParentCategoryImpl) then) =
      __$$ParentCategoryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'title') String? title,
      @JsonKey(name: 'image') String? image,
      @JsonKey(name: 'parent') dynamic parent,
      @JsonKey(name: 'description') String? description});
}

/// @nodoc
class __$$ParentCategoryImplCopyWithImpl<$Res>
    extends _$ParentCategoryCopyWithImpl<$Res, _$ParentCategoryImpl>
    implements _$$ParentCategoryImplCopyWith<$Res> {
  __$$ParentCategoryImplCopyWithImpl(
      _$ParentCategoryImpl _value, $Res Function(_$ParentCategoryImpl) _then)
      : super(_value, _then);

  /// Create a copy of ParentCategory
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? image = freezed,
    Object? parent = freezed,
    Object? description = freezed,
  }) {
    return _then(_$ParentCategoryImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      parent: freezed == parent
          ? _value.parent
          : parent // ignore: cast_nullable_to_non_nullable
              as dynamic,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ParentCategoryImpl implements _ParentCategory {
  const _$ParentCategoryImpl(
      {@JsonKey(name: 'id') this.id,
      @JsonKey(name: 'title') this.title,
      @JsonKey(name: 'image') this.image,
      @JsonKey(name: 'parent') this.parent,
      @JsonKey(name: 'description') this.description});

  factory _$ParentCategoryImpl.fromJson(Map<String, dynamic> json) =>
      _$$ParentCategoryImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int? id;
  @override
  @JsonKey(name: 'title')
  final String? title;
  @override
  @JsonKey(name: 'image')
  final String? image;
  @override
  @JsonKey(name: 'parent')
  final dynamic parent;
  @override
  @JsonKey(name: 'description')
  final String? description;

  @override
  String toString() {
    return 'ParentCategory(id: $id, title: $title, image: $image, parent: $parent, description: $description)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ParentCategoryImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.image, image) || other.image == image) &&
            const DeepCollectionEquality().equals(other.parent, parent) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, title, image,
      const DeepCollectionEquality().hash(parent), description);

  /// Create a copy of ParentCategory
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ParentCategoryImplCopyWith<_$ParentCategoryImpl> get copyWith =>
      __$$ParentCategoryImplCopyWithImpl<_$ParentCategoryImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ParentCategoryImplToJson(
      this,
    );
  }
}

abstract class _ParentCategory implements ParentCategory {
  const factory _ParentCategory(
          {@JsonKey(name: 'id') final int? id,
          @JsonKey(name: 'title') final String? title,
          @JsonKey(name: 'image') final String? image,
          @JsonKey(name: 'parent') final dynamic parent,
          @JsonKey(name: 'description') final String? description}) =
      _$ParentCategoryImpl;

  factory _ParentCategory.fromJson(Map<String, dynamic> json) =
      _$ParentCategoryImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  int? get id;
  @override
  @JsonKey(name: 'title')
  String? get title;
  @override
  @JsonKey(name: 'image')
  String? get image;
  @override
  @JsonKey(name: 'parent')
  dynamic get parent;
  @override
  @JsonKey(name: 'description')
  String? get description;

  /// Create a copy of ParentCategory
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ParentCategoryImplCopyWith<_$ParentCategoryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
