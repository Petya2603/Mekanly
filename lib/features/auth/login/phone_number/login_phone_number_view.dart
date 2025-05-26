import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gen/gen.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/components/app_btn.dart';
import '../../../../core/components/app_text.dart';
import '../../../../core/components/check_box/titled_check_box.dart';
import '../../../../core/components/inputs/phone_filed.dart';
import '../../../../product/base/base_status/base_status.dart';
import '../../../../product/helpers/helpers.dart';
import '../../../../product/injection/injector.dart';
import '../../../../remote/payloads/otp_payload.dart';
import '../../../../remote/response_error.dart';
import '../../../../utils/extensions.dart';
import '../otp/otp_view.dart';
import '../widgets/base_login_view.dart';
import 'cubit/login_cubit.dart';

class LoginPhoneNumberView extends StatelessWidget {
  LoginPhoneNumberView({super.key});

  static const routePath = '/login-phone-number-view';
  static const routeName = 'login-phone-number-view';

  static Widget builder(BuildContext context, GoRouterState state) {
    final bloc = injector<LoginCubit>();

    return BlocProvider(
      create: (context) => bloc,
      child: LoginPhoneNumberView(),
    );
  }

  final TextEditingController _phoneController = TextEditingController();
  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BaseLoginView(
      appBarTitle: 'Ulgama girmek',
      content: SingleChildScrollView(
        child: Form(
          key: _key,
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
              56.boxH,
              AppText.s14w400BdM(
                'Uglagama girmek üçin telefon nomeriňizi ýazyň',
                fontWeight: FontWeight.w500,
              ),
              24.boxH,
              PhoneFiled(
                onTapOutside: () {
                  FocusScope.of(context).unfocus();
                },
                controller: _phoneController,
              ),
              20.boxH,
              TitledCheckBox(
                onTitleTap: () {},
                onSelect: (v) {},
                isSelected: false,
                title: 'Düzgünnamany okadym we kabul etdim',
              ),
              27.boxH,
              Row(
                children: [
                  Expanded(
                    child: BlocConsumer<LoginCubit, LoginState>(
                      listener: (context, state) {
                        state.status.maybeWhen(
                          success: () {
                            Helpers.showToastInfo(
                              context,
                              state.response?.message ?? '',
                            );
                            final data = OtpPayload(
                              phone: state.response?.user.phone ?? '',
                              token: state.response?.user.token ?? '',
                              code: '',
                            );
                            context.pushReplacement(
                              OtpView.routePath,
                              extra: data,
                            );
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
                            if (!(_key.currentState?.validate() ?? false)) {
                              return;
                            }

                            final phone =
                                '+993${_phoneController.text.trim().replaceAll(' ', '')}';
                            await context.read<LoginCubit>().login(phone);
                          },
                          text: 'Ulgama girmek',
                          txtColor: ColorName.white,
                        );
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
