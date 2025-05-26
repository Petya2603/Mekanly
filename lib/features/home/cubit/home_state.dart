part of 'home_cubit.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    @Default(BaseStatus.initial()) BaseStatus status,
    List<BannerEntity>? smallBanners,
    List<BannerEntity>? bigBanners,
    List<TopAdsEntity>? topAds,
  }) = _HomeState;

  const HomeState._();
}
