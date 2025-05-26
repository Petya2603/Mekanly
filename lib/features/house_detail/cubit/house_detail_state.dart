part of 'house_detail_cubit.dart';

@freezed
class HouseDetailState with _$HouseDetailState {
  const factory HouseDetailState({
    @Default(BaseStatus.initial()) BaseStatus status,
    HouseDetailResponse? response,
  }) = _HouseDetailState;

  const HouseDetailState._();
}
