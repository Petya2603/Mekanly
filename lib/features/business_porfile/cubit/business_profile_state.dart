part of 'business_profile_cubit.dart';

@freezed
class BusinessProfileState with _$BusinessProfileState {
  const factory BusinessProfileState({
    @Default(BaseStatus.initial()) BaseStatus status,
    BusinessProfilesResponse? response,
    BusinessProfileCategoryResponse? categoryResponse,

  }) = _BusinessProfileState;

  const BusinessProfileState._();
}
