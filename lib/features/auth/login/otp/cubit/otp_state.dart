part of 'otp_cubit.dart';

@freezed
class OtpState with _$OtpState {
  const factory OtpState({
    @Default(BaseStatus.initial()) BaseStatus status,
    OtpSuccessEntity? response,
  }) = _OtpState;

  const OtpState._();
}
