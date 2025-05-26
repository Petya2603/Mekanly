part of 'login_cubit.dart';

@freezed
class LoginState with _$LoginState {
  const factory LoginState({
    @Default(BaseStatus.initial()) BaseStatus status,
    LoginSuccessEntity? response,
  }) = _LoginState;

  const LoginState._();
}
