part of 'add_house_cubit.dart';

@freezed
class AddHouseState with _$AddHouseState {
  const factory AddHouseState({
    @Default(BaseStatus.initial()) BaseStatus status,
    @Default(BaseStatus.initial()) BaseStatus pickImageStatus,
    @Default(BaseStatus.initial()) BaseStatus addHouseStatus,
    List<ImageItem>? pickedImages,
    GlobalOptions? options,
  }) = _AddHouseState;

  const AddHouseState._();
}
