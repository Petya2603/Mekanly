// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'houses_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$HousesEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() refresh,
    required TResult Function(List<HouseEntity>? houses) getFilter,
    required TResult Function(GlobalOptions filter) filter,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? refresh,
    TResult? Function(List<HouseEntity>? houses)? getFilter,
    TResult? Function(GlobalOptions filter)? filter,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? refresh,
    TResult Function(List<HouseEntity>? houses)? getFilter,
    TResult Function(GlobalOptions filter)? filter,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Refresh value) refresh,
    required TResult Function(_GetFilters value) getFilter,
    required TResult Function(_Filter value) filter,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Refresh value)? refresh,
    TResult? Function(_GetFilters value)? getFilter,
    TResult? Function(_Filter value)? filter,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Refresh value)? refresh,
    TResult Function(_GetFilters value)? getFilter,
    TResult Function(_Filter value)? filter,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HousesEventCopyWith<$Res> {
  factory $HousesEventCopyWith(
          HousesEvent value, $Res Function(HousesEvent) then) =
      _$HousesEventCopyWithImpl<$Res, HousesEvent>;
}

/// @nodoc
class _$HousesEventCopyWithImpl<$Res, $Val extends HousesEvent>
    implements $HousesEventCopyWith<$Res> {
  _$HousesEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HousesEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$RefreshImplCopyWith<$Res> {
  factory _$$RefreshImplCopyWith(
          _$RefreshImpl value, $Res Function(_$RefreshImpl) then) =
      __$$RefreshImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$RefreshImplCopyWithImpl<$Res>
    extends _$HousesEventCopyWithImpl<$Res, _$RefreshImpl>
    implements _$$RefreshImplCopyWith<$Res> {
  __$$RefreshImplCopyWithImpl(
      _$RefreshImpl _value, $Res Function(_$RefreshImpl) _then)
      : super(_value, _then);

  /// Create a copy of HousesEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$RefreshImpl implements _Refresh {
  const _$RefreshImpl();

  @override
  String toString() {
    return 'HousesEvent.refresh()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$RefreshImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() refresh,
    required TResult Function(List<HouseEntity>? houses) getFilter,
    required TResult Function(GlobalOptions filter) filter,
  }) {
    return refresh();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? refresh,
    TResult? Function(List<HouseEntity>? houses)? getFilter,
    TResult? Function(GlobalOptions filter)? filter,
  }) {
    return refresh?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? refresh,
    TResult Function(List<HouseEntity>? houses)? getFilter,
    TResult Function(GlobalOptions filter)? filter,
    required TResult orElse(),
  }) {
    if (refresh != null) {
      return refresh();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Refresh value) refresh,
    required TResult Function(_GetFilters value) getFilter,
    required TResult Function(_Filter value) filter,
  }) {
    return refresh(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Refresh value)? refresh,
    TResult? Function(_GetFilters value)? getFilter,
    TResult? Function(_Filter value)? filter,
  }) {
    return refresh?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Refresh value)? refresh,
    TResult Function(_GetFilters value)? getFilter,
    TResult Function(_Filter value)? filter,
    required TResult orElse(),
  }) {
    if (refresh != null) {
      return refresh(this);
    }
    return orElse();
  }
}

abstract class _Refresh implements HousesEvent {
  const factory _Refresh() = _$RefreshImpl;
}

/// @nodoc
abstract class _$$GetFiltersImplCopyWith<$Res> {
  factory _$$GetFiltersImplCopyWith(
          _$GetFiltersImpl value, $Res Function(_$GetFiltersImpl) then) =
      __$$GetFiltersImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<HouseEntity>? houses});
}

/// @nodoc
class __$$GetFiltersImplCopyWithImpl<$Res>
    extends _$HousesEventCopyWithImpl<$Res, _$GetFiltersImpl>
    implements _$$GetFiltersImplCopyWith<$Res> {
  __$$GetFiltersImplCopyWithImpl(
      _$GetFiltersImpl _value, $Res Function(_$GetFiltersImpl) _then)
      : super(_value, _then);

  /// Create a copy of HousesEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? houses = freezed,
  }) {
    return _then(_$GetFiltersImpl(
      freezed == houses
          ? _value._houses
          : houses // ignore: cast_nullable_to_non_nullable
              as List<HouseEntity>?,
    ));
  }
}

/// @nodoc

class _$GetFiltersImpl implements _GetFilters {
  const _$GetFiltersImpl(final List<HouseEntity>? houses) : _houses = houses;

  final List<HouseEntity>? _houses;
  @override
  List<HouseEntity>? get houses {
    final value = _houses;
    if (value == null) return null;
    if (_houses is EqualUnmodifiableListView) return _houses;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'HousesEvent.getFilter(houses: $houses)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetFiltersImpl &&
            const DeepCollectionEquality().equals(other._houses, _houses));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_houses));

  /// Create a copy of HousesEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GetFiltersImplCopyWith<_$GetFiltersImpl> get copyWith =>
      __$$GetFiltersImplCopyWithImpl<_$GetFiltersImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() refresh,
    required TResult Function(List<HouseEntity>? houses) getFilter,
    required TResult Function(GlobalOptions filter) filter,
  }) {
    return getFilter(houses);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? refresh,
    TResult? Function(List<HouseEntity>? houses)? getFilter,
    TResult? Function(GlobalOptions filter)? filter,
  }) {
    return getFilter?.call(houses);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? refresh,
    TResult Function(List<HouseEntity>? houses)? getFilter,
    TResult Function(GlobalOptions filter)? filter,
    required TResult orElse(),
  }) {
    if (getFilter != null) {
      return getFilter(houses);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Refresh value) refresh,
    required TResult Function(_GetFilters value) getFilter,
    required TResult Function(_Filter value) filter,
  }) {
    return getFilter(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Refresh value)? refresh,
    TResult? Function(_GetFilters value)? getFilter,
    TResult? Function(_Filter value)? filter,
  }) {
    return getFilter?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Refresh value)? refresh,
    TResult Function(_GetFilters value)? getFilter,
    TResult Function(_Filter value)? filter,
    required TResult orElse(),
  }) {
    if (getFilter != null) {
      return getFilter(this);
    }
    return orElse();
  }
}

abstract class _GetFilters implements HousesEvent {
  const factory _GetFilters(final List<HouseEntity>? houses) = _$GetFiltersImpl;

  List<HouseEntity>? get houses;

  /// Create a copy of HousesEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetFiltersImplCopyWith<_$GetFiltersImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FilterImplCopyWith<$Res> {
  factory _$$FilterImplCopyWith(
          _$FilterImpl value, $Res Function(_$FilterImpl) then) =
      __$$FilterImplCopyWithImpl<$Res>;
  @useResult
  $Res call({GlobalOptions filter});

  $GlobalOptionsCopyWith<$Res> get filter;
}

/// @nodoc
class __$$FilterImplCopyWithImpl<$Res>
    extends _$HousesEventCopyWithImpl<$Res, _$FilterImpl>
    implements _$$FilterImplCopyWith<$Res> {
  __$$FilterImplCopyWithImpl(
      _$FilterImpl _value, $Res Function(_$FilterImpl) _then)
      : super(_value, _then);

  /// Create a copy of HousesEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? filter = null,
  }) {
    return _then(_$FilterImpl(
      null == filter
          ? _value.filter
          : filter // ignore: cast_nullable_to_non_nullable
              as GlobalOptions,
    ));
  }

  /// Create a copy of HousesEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $GlobalOptionsCopyWith<$Res> get filter {
    return $GlobalOptionsCopyWith<$Res>(_value.filter, (value) {
      return _then(_value.copyWith(filter: value));
    });
  }
}

/// @nodoc

class _$FilterImpl implements _Filter {
  const _$FilterImpl(this.filter);

  @override
  final GlobalOptions filter;

  @override
  String toString() {
    return 'HousesEvent.filter(filter: $filter)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FilterImpl &&
            (identical(other.filter, filter) || other.filter == filter));
  }

  @override
  int get hashCode => Object.hash(runtimeType, filter);

  /// Create a copy of HousesEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FilterImplCopyWith<_$FilterImpl> get copyWith =>
      __$$FilterImplCopyWithImpl<_$FilterImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() refresh,
    required TResult Function(List<HouseEntity>? houses) getFilter,
    required TResult Function(GlobalOptions filter) filter,
  }) {
    return filter(this.filter);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? refresh,
    TResult? Function(List<HouseEntity>? houses)? getFilter,
    TResult? Function(GlobalOptions filter)? filter,
  }) {
    return filter?.call(this.filter);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? refresh,
    TResult Function(List<HouseEntity>? houses)? getFilter,
    TResult Function(GlobalOptions filter)? filter,
    required TResult orElse(),
  }) {
    if (filter != null) {
      return filter(this.filter);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Refresh value) refresh,
    required TResult Function(_GetFilters value) getFilter,
    required TResult Function(_Filter value) filter,
  }) {
    return filter(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Refresh value)? refresh,
    TResult? Function(_GetFilters value)? getFilter,
    TResult? Function(_Filter value)? filter,
  }) {
    return filter?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Refresh value)? refresh,
    TResult Function(_GetFilters value)? getFilter,
    TResult Function(_Filter value)? filter,
    required TResult orElse(),
  }) {
    if (filter != null) {
      return filter(this);
    }
    return orElse();
  }
}

abstract class _Filter implements HousesEvent {
  const factory _Filter(final GlobalOptions filter) = _$FilterImpl;

  GlobalOptions get filter;

  /// Create a copy of HousesEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FilterImplCopyWith<_$FilterImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$HousesState {
  BaseStatus<dynamic> get status => throw _privateConstructorUsedError;
  List<HouseEntity>? get houses => throw _privateConstructorUsedError;
  GlobalOptionsResponse? get globalOptions =>
      throw _privateConstructorUsedError;

  /// Create a copy of HousesState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HousesStateCopyWith<HousesState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HousesStateCopyWith<$Res> {
  factory $HousesStateCopyWith(
          HousesState value, $Res Function(HousesState) then) =
      _$HousesStateCopyWithImpl<$Res, HousesState>;
  @useResult
  $Res call(
      {BaseStatus<dynamic> status,
      List<HouseEntity>? houses,
      GlobalOptionsResponse? globalOptions});

  $BaseStatusCopyWith<dynamic, $Res> get status;
  $GlobalOptionsResponseCopyWith<$Res>? get globalOptions;
}

/// @nodoc
class _$HousesStateCopyWithImpl<$Res, $Val extends HousesState>
    implements $HousesStateCopyWith<$Res> {
  _$HousesStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HousesState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? houses = freezed,
    Object? globalOptions = freezed,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as BaseStatus<dynamic>,
      houses: freezed == houses
          ? _value.houses
          : houses // ignore: cast_nullable_to_non_nullable
              as List<HouseEntity>?,
      globalOptions: freezed == globalOptions
          ? _value.globalOptions
          : globalOptions // ignore: cast_nullable_to_non_nullable
              as GlobalOptionsResponse?,
    ) as $Val);
  }

  /// Create a copy of HousesState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BaseStatusCopyWith<dynamic, $Res> get status {
    return $BaseStatusCopyWith<dynamic, $Res>(_value.status, (value) {
      return _then(_value.copyWith(status: value) as $Val);
    });
  }

  /// Create a copy of HousesState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $GlobalOptionsResponseCopyWith<$Res>? get globalOptions {
    if (_value.globalOptions == null) {
      return null;
    }

    return $GlobalOptionsResponseCopyWith<$Res>(_value.globalOptions!, (value) {
      return _then(_value.copyWith(globalOptions: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$HousesStateImplCopyWith<$Res>
    implements $HousesStateCopyWith<$Res> {
  factory _$$HousesStateImplCopyWith(
          _$HousesStateImpl value, $Res Function(_$HousesStateImpl) then) =
      __$$HousesStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {BaseStatus<dynamic> status,
      List<HouseEntity>? houses,
      GlobalOptionsResponse? globalOptions});

  @override
  $BaseStatusCopyWith<dynamic, $Res> get status;
  @override
  $GlobalOptionsResponseCopyWith<$Res>? get globalOptions;
}

/// @nodoc
class __$$HousesStateImplCopyWithImpl<$Res>
    extends _$HousesStateCopyWithImpl<$Res, _$HousesStateImpl>
    implements _$$HousesStateImplCopyWith<$Res> {
  __$$HousesStateImplCopyWithImpl(
      _$HousesStateImpl _value, $Res Function(_$HousesStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of HousesState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? houses = freezed,
    Object? globalOptions = freezed,
  }) {
    return _then(_$HousesStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as BaseStatus<dynamic>,
      houses: freezed == houses
          ? _value._houses
          : houses // ignore: cast_nullable_to_non_nullable
              as List<HouseEntity>?,
      globalOptions: freezed == globalOptions
          ? _value.globalOptions
          : globalOptions // ignore: cast_nullable_to_non_nullable
              as GlobalOptionsResponse?,
    ));
  }
}

/// @nodoc

class _$HousesStateImpl extends _HousesState {
  const _$HousesStateImpl(
      {this.status = const BaseStatus.initial(),
      final List<HouseEntity>? houses,
      this.globalOptions})
      : _houses = houses,
        super._();

  @override
  @JsonKey()
  final BaseStatus<dynamic> status;
  final List<HouseEntity>? _houses;
  @override
  List<HouseEntity>? get houses {
    final value = _houses;
    if (value == null) return null;
    if (_houses is EqualUnmodifiableListView) return _houses;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final GlobalOptionsResponse? globalOptions;

  @override
  String toString() {
    return 'HousesState(status: $status, houses: $houses, globalOptions: $globalOptions)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HousesStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(other._houses, _houses) &&
            (identical(other.globalOptions, globalOptions) ||
                other.globalOptions == globalOptions));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status,
      const DeepCollectionEquality().hash(_houses), globalOptions);

  /// Create a copy of HousesState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HousesStateImplCopyWith<_$HousesStateImpl> get copyWith =>
      __$$HousesStateImplCopyWithImpl<_$HousesStateImpl>(this, _$identity);
}

abstract class _HousesState extends HousesState {
  const factory _HousesState(
      {final BaseStatus<dynamic> status,
      final List<HouseEntity>? houses,
      final GlobalOptionsResponse? globalOptions}) = _$HousesStateImpl;
  const _HousesState._() : super._();

  @override
  BaseStatus<dynamic> get status;
  @override
  List<HouseEntity>? get houses;
  @override
  GlobalOptionsResponse? get globalOptions;

  /// Create a copy of HousesState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HousesStateImplCopyWith<_$HousesStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
