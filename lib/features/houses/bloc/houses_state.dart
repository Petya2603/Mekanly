part of 'houses_bloc.dart';

@freezed
class HousesState with _$HousesState {
  const factory HousesState({
    @Default(BaseStatus.initial()) BaseStatus status,
    List<HouseEntity>? houses,
    GlobalOptionsResponse? globalOptions,
  }) = _HousesState;

  const HousesState._();
  bool get hasActiveFilters => globalOptions?.data?.hasActiveFilters ?? false;
}
