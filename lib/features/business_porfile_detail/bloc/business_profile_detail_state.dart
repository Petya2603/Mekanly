part of 'business_profile_detail_bloc.dart';

@freezed
class BusinessProfileDetailState with _$BusinessProfileDetailState {
  const factory BusinessProfileDetailState({
    @Default(BaseStatus.initial()) BaseStatus status,
    BusinessProfileDetailResponse? response,
  }) = _BusinessProfileDetailState;

  const BusinessProfileDetailState._();
}
