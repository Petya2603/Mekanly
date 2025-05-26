part of 'content_bloc.dart';

@freezed
class ContentState with _$ContentState {
   const factory ContentState({
    @Default(BaseStatus.initial()) BaseStatus status,
    GlobalOptions? globalOptions,
    List<UserHouse>? userHouses,
    List<UserProductCategory>? productCategories,
  }) = _ContentState;

  const ContentState._();
}
