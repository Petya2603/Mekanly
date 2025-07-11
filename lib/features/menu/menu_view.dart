import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gen/gen.dart';
import '../../app/cubit/app_cubit.dart';
import '../../core/components/app_text.dart';
import '../../localization/extensions.dart';
import '../../product/constants/constants.dart';
import '../../utils/extensions.dart';
import '../comments/comments_view.dart';
import '../contact_us/contact_us_view.dart';
import '../content/content_view.dart';
import '../root/view/root_view.dart';
import 'duzgunname_view.dart';
import 'widgets/profile_main_tile.dart';
import 'widgets/user_business_profile_tile.dart';
import 'widgets/user_profile_tile.dart';
import 'widgets/web_view_screen.dart';

class MenuView extends StatefulWidget {
  const MenuView({super.key});

  static const routePath = '/menu-view';
  static const routeName = 'menu-view';

  @override
  State<MenuView> createState() => _MenuViewState();
}

class _MenuViewState extends State<MenuView> {
  late final AppCubit appCubit;

  @override
  void initState() {
    super.initState();
    appCubit = context.read<AppCubit>();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
        buildWhen: (previous, current) => previous.locale != current.locale,
        builder: (context, state) {
          return SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 18).w,
              child: Column(
                children: [
                  const UserProfileTile(),
                  4.boxH,
                  UserBusinessProfileTile(
                    onTap: () {},
                  ),
                  ProfileMainTile(
                    title: context.translation.add_house,
                    isAuthNeeded: true,
                    icon: Assets.icons.icAddHouse.svg(
                      package: 'gen',
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        // ignore: inference_failure_on_instance_creation
                        MaterialPageRoute(
                          builder: ContentView.builder,
                        ),
                      );
                    },
                  ),
                  ProfileMainTile(
                    title: context.translation.language,
                    isAuthNeeded: false,
                    icon: Assets.icons.icLang.svg(
                        package: 'gen',
                        color: const Color.fromARGB(255, 34, 34, 34)),
                    onTap: () {
                      chooseLang(context);
                    },
                    trailingWidget: BlocBuilder<AppCubit, AppState>(
                      builder: (context, state) {
                        final currentLang = state.locale?.languageCode ?? 'ru';
                        return Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            AppText.s14w400BdM(
                              currentLang == 'ru' ? 'Rus dili' : 'Türkmen dili',
                              fontWeight: FontWeight.w400,
                              fontFamily: StringConstants.manrope,
                              color: const Color.fromARGB(255, 106, 106, 106),
                            ),
                            8.boxW,
                            Icon(
                              Icons.chevron_right,
                              size: 20.w,
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                  ProfileMainTile(
                    isAuthNeeded: true,
                    title: context.translation.favorites,
                    icon: Assets.icons.icFavoriteNew.svg(
                        package: 'gen',
                        color: const Color.fromARGB(255, 34, 34, 34)),
                    onTap: () {
                      RootView.rootKey.currentState?.goToTab(3);
                    },
                  ),
                  ProfileMainTile(
                    isAuthNeeded: true,
                    title: context.translation.comments,
                    icon: Assets.icons.icChat.svg(
                      package: 'gen',
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const CommentsView(),
                        ),
                      );
                    },
                  ),
                  ProfileMainTile(
                    isAuthNeeded: false,
                    title: context.translation.rules,
                    icon: Assets.icons.icPrivacy.svg(
                      package: 'gen',
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        // ignore: inference_failure_on_instance_creation
                        MaterialPageRoute(
                          builder: (context) => const DuzgunnameView(),
                        ),
                      );
                    },
                  ),
                  ProfileMainTile(
                    isAuthNeeded: true,
                    title: context.translation.contact,
                    icon: Assets.icons.icContactUs.svg(
                        package: 'gen',
                        color: const Color.fromARGB(255, 34, 34, 34)),
                    onTap: () {
                      Navigator.push(
                        context,
                        // ignore: inference_failure_on_instance_creation
                        MaterialPageRoute(
                          builder: (context) => const ContactUsView(),
                        ),
                      );
                    },
                  ),
                  ProfileMainTile(
                    isAuthNeeded: false,
                    title: context.translation.about_us,
                    icon: Assets.icons.icHelp.svg(
                        package: 'gen',
                        color: const Color.fromARGB(255, 34, 34, 34)),
                    onTap: () {
                      Navigator.push(
                        context,
                        // ignore: inference_failure_on_instance_creation
                        MaterialPageRoute(
                          builder: (context) => WebViewScreen(
                            url:
                                'https://mekanly.com.tm/aboutus/${Localizations.localeOf(context).languageCode}',
                            title: context.translation.about_us,
                          ),
                        ),
                      );
                    },
                  ),
                  ProfileMainTile(
                    isLogOut: true,
                    isAuthNeeded: true,
                    title: context.translation.log_out,
                    icon: Assets.icons.icLogOut.svg(
                        package: 'gen',
                        color: const Color.fromARGB(255, 34, 34, 34)),
                    onTap: () {
                      // context.read<AuthCubit>().logOut();
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }
}

/// TODOS: Bayram ayyr beyle edilenok!!! -> ChooseLang.show() seyle, please
Future<void> chooseLang(BuildContext context) async {
  final appCubit = context.read<AppCubit>();
  var selectedLang = appCubit.state.locale?.languageCode ?? 'tk';

  await showDialog(
    context: context,
    builder: (BuildContext context) {
      return StatefulBuilder(
        builder: (context, setState) {
          return Dialog(
            alignment: Alignment.center,
            backgroundColor: Colors.white,
            child: ConstrainedBox(
              constraints: BoxConstraints(
                maxHeight: MediaQuery.of(context).size.height * 0.25,
                maxWidth: MediaQuery.of(context).size.width * 0.96,
              ),
              child: Container(
                padding: const EdgeInsets.fromLTRB(25, 15, 5, 15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color(0xFFFFFFFF),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: AppText.s14w400BdM(
                        context.translation.select_language,
                        fontSize: 14.sp,
                        fontFamily: StringConstants.roboto,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xFF252525),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        RadioListTile<String>(
                          dense: true,
                          visualDensity: VisualDensity.compact,
                          autofocus: selectedLang == 'tk',
                          activeColor: Colors.lightBlue,
                          controlAffinity: ListTileControlAffinity.trailing,
                          value: 'tk',
                          groupValue: selectedLang,
                          contentPadding: EdgeInsets.zero,
                          onChanged: (value) {
                            if (value == null) return;
                            setState(() {
                              selectedLang = value;
                            });
                            appCubit.changeLang(Locale(value));

                            Navigator.of(context).pop();
                            RootView.rootKey.currentState?.goToTab(0);
                          },
                          title: AppText.s14w400BdM(
                            'Türkmen dili',
                            color: const Color(0xFF252525),
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w500,
                            fontFamily: StringConstants.roboto,
                          ),
                        ),
                        RadioListTile<String>(
                          dense: true,
                          visualDensity: VisualDensity.compact,
                          autofocus: selectedLang == 'ru',
                          activeColor: Colors.lightBlue,
                          value: 'ru',
                          groupValue: selectedLang,
                          contentPadding: EdgeInsets.zero,
                          controlAffinity: ListTileControlAffinity.trailing,
                          onChanged: (value) {
                            if (value == null) return;
                            setState(() {
                              selectedLang = value;
                              appCubit.changeLang(Locale(value));
                            });

                            Navigator.of(context).pop();
                            RootView.rootKey.currentState?.goToTab(0);
                          },
                          title: AppText.s14w400BdM(
                            'Rus dili',
                            color: const Color(0xFF252525),
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w500,
                            fontFamily: StringConstants.roboto,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      );
    },
  );
}

// void notification(BuildContext context) {
//   // ignore: inference_failure_on_function_invocation
//   showDialog(
//     context: context,
//     builder: (BuildContext context) {
//       return Dialog(
//         backgroundColor: Colors.white,
//         alignment: Alignment.center,
//         child: Container(
//           height: MediaQuery.of(context).size.height * 0.25,
//           width: MediaQuery.of(context).size.width * 0.96,
//           padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 15),
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(10),
//             color: const Color(0xFFFFFFFF),
//           ),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Align(
//                 alignment: Alignment.topLeft,
//                 child: AppText.s14w400BdM(
//                   context.translation.notification,
//                   color: const Color(0xFF252525),
//                   fontSize: 15.sp,
//                   fontWeight: FontWeight.w400,
//                   fontFamily: StringConstants.roboto,
//                 ),
//               ),
//               10.boxH,
//               AppText.s14w400BdM(
//                 context.translation.not_logged_in_push,
//                 color: const Color(0xFF252525),
//                 fontSize: 14.sp,
//                 fontWeight: FontWeight.w400,
//                 fontFamily: StringConstants.roboto,
//                 softWrap: true,
//               ),
//               8.boxH,
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.end,
//                 children: [
//                   TextButton(
//                     onPressed: () {
//                       Navigator.pop(context);
//                     },
//                     child: AppText.s14w400BdM(
//                       context.translation.cancel,
//                       color: const Color(0xFF252525),
//                       fontSize: 13.sp,
//                       fontWeight: FontWeight.w400,
//                       fontFamily: StringConstants.roboto,
//                     ),
//                   ),
//                   8.boxH,
//                   TextButton(
//                     onPressed: () {},
//                     child: AppText.s14w400BdM(
//                       context.translation.log_in,
//                       color: const Color(0xFF252525),
//                       fontSize: 13.sp,
//                       fontWeight: FontWeight.w400,
//                       fontFamily: StringConstants.roboto,
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       );
//     },
//   );
// }
