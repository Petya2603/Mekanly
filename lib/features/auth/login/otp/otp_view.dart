import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gen/gen.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/components/app_btn.dart';
import '../../../../core/components/app_text.dart';
import '../../../../core/components/inputs/otp_field.dart';
import '../../../../product/base/base_status/base_status.dart';
import '../../../../product/helpers/helpers.dart';
import '../../../../product/injection/injector.dart';
import '../../../../remote/payloads/otp_payload.dart';
import '../../../../remote/response_error.dart';
import '../../../../utils/extensions.dart';
import '../../../../utils/toast_service.dart';
import '../../../home/home_view.dart';
import '../../../root/view/root_view.dart';
import '../../cubit/auth_cubit.dart';
import '../widgets/base_login_view.dart';
import 'cubit/otp_cubit.dart';
import 'pin_put_widget.dart';
import 'widgets/count_down_widget.dart';

class OtpView extends StatefulWidget {
  const OtpView({super.key, required this.payload});

  static const routePath = '/otp-view';
  static const routeName = 'otp-view';

  static Widget builder(BuildContext context, GoRouterState state) {
    return BlocProvider(
      create: (context) => injector<OtpCubit>(),
      child: OtpView(
        payload: state.extra! as OtpPayload,
      ),
    );
  }

  final OtpPayload payload;

  @override
  State<OtpView> createState() => _OtpViewState();
}

class _OtpViewState extends State<OtpView> {
  final TextEditingController _controller = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  ValueNotifier<bool> canTryAgain = ValueNotifier(false);

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BaseLoginView(
      appBarTitle: 'Tassyklamak',
      content: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              80.boxH,
              Container(
                alignment: Alignment.center,
                child: Assets.icons.icLogoLogin.svg(
                  package: 'gen',
                  height: 50.w,
                ),
              ),
              35.boxH,
              AppText.s14w400BdM(
                'Telefon belgiňize gelen paroly ýazyň',
                textAlign: TextAlign.left,
              ),
              26.boxH,
              // OtpFiled(
              //   controller: _controller,
              //   onTapOutside: () {
              //     FocusScope.of(context).unfocus();
              //   },
              // ),
              PinPutWidget(
                controller: _controller,
                onCompleted: (value) {
                  if (_formKey.currentState?.validate() ?? false) {
                    FocusScope.of(context).unfocus();
                  }
                },
                onSubmitted: (value) {
                  if (_formKey.currentState?.validate() ?? false) {
                    FocusScope.of(context).unfocus();
                  }
                },
              ).toCenter(),
              27.boxH,
              CountDownWidget(
                callback: () {
                  canTryAgain.value = !canTryAgain.value;
                },
                secondsToAwait: 180,
                text: '',
              ).toCenter(),
              27.boxH,
              Row(
                children: [
                  Expanded(
                    child: BlocListener<AuthCubit, AuthState>(
                      listener: (context, state) {
                        state.maybeWhen(
                          orElse: () {},
                          authCheckingFailure: () {
                            Helpers.showToastInfo(
                              context,
                              'User is not logged in',
                            );
                          },
                          authCheckingDone: (a, b, c, user) {
                            if (user != null) {
                              Helpers.showToastInfo(
                                context,
                                'User is logged in',
                              );
                              context.pushReplacementNamed(
                                RootView.routeName,
                              );
                            }
                          },
                        );
                      },
                      child: BlocConsumer<OtpCubit, OtpState>(
                        listener: (context, state) {
                          state.status.maybeWhen(
                            success: () {
                              if (state.response?.user == null) return;

                              context.read<AuthCubit>().checkState();
                            },
                            failure: (error) {
                              Helpers.showToastInfo(
                                context,
                                error.getErrorMessage(context),
                              );
                            },
                            orElse: () {},
                          );
                        },
                        builder: (context, state) {
                          return GradientBtn(
                            isLoading: state.status.isLoading,
                            onTap: () async {
                              if (!(_formKey.currentState?.validate() ??
                                  false)) {
                                return;
                              }
                              final data = widget.payload.copyWith(
                                code: _controller.text.trim(),
                              );
                              await context.read<OtpCubit>().verify(data);
                            },
                            text: 'TASSYKLAMAK',
                            txtColor: ColorName.white,
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
              18.boxH,
              ValueListenableBuilder<bool>(
                valueListenable: canTryAgain,
                builder: (_, can, __) {
                  return TextBtn(
                    onTap: () {},
                    child: AppText.s14w400BdM(
                      'Täzeden synanyşmak',
                      color: !can
                          ? ColorName.addressDate.withOpacity(.5)
                          : ColorName.addressDate,
                      fontWeight: FontWeight.w500,
                    ),
                  ).toCenter();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
