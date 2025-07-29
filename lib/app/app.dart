import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../features/auth/cubit/auth_cubit.dart';
import '../features/business_porfile/cubit/business_profile_cubit.dart';
import '../features/home/cubit/home_cubit.dart';
import '../features/houses/bloc/houses_bloc.dart';
import '../features/root/cubit/navigation_cubit.dart';
import '../features/splash/splash_view.dart';
import '../localization/localization_override.dart';
import '../localization/localization_service.dart';
import '../product/init/theme/theme.dart';
import '../product/injection/injector.dart';
import 'cubit/app_cubit.dart';

/// Init app
class MekanlyApp extends StatefulWidget {
  /// Init app
  const MekanlyApp({super.key});

  // final AppRouterConfig routerConfig;

  static Future<Widget> create() async {
    await injector.allReady();
    // final routerConfig = injector<AppRouterConfig>();
    final appBloc = injector<AppCubit>();
    await appBloc.init();
    final authBloc = injector<AuthCubit>();
    final homeBloc = injector<HomeCubit>();
    final housesBloc = injector<HousesBloc>();
    final businessProfileBloc = injector<BusinessProfileCubit>();

    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: appBloc),
        BlocProvider.value(value: authBloc),
        BlocProvider.value(value: homeBloc),
        BlocProvider.value(value: housesBloc),
        BlocProvider.value(value: businessProfileBloc),
      ],
      child: const MekanlyApp(),
    );
  }

  @override
  State<MekanlyApp> createState() => _MekanlyAppState();
}

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class _MekanlyAppState extends State<MekanlyApp> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) {
        return BlocBuilder<AppCubit, AppState>(
          builder: (_, state) {
            return MaterialApp(
              navigatorKey: navigatorKey,
              locale: const Locale('ru'),
              localeResolutionCallback: (locale, supportedLocales) {
                if (locale == null) return const Locale('ru');
                for (final supportedLocale in supportedLocales) {
                  if (supportedLocale.languageCode == locale.languageCode) {
                    return supportedLocale;
                  }
                }
                return const Locale('ru');
              },
              debugShowCheckedModeBanner: false,
              supportedLocales: LocalizationService.supportedLocales,
              localizationsDelegates: LocalizationService.delegates,
              theme: appTheme(),
              home: BlocListener<AuthCubit, AuthState>(
                listener: (context, authState) {
                  authState.maybeWhen(
                    unAuthenticated: () {
                      navigatorKey.currentState?.pushAndRemoveUntil(
                        MaterialPageRoute(
                            builder: (context) => const SplashView()),
                        (route) => false,
                      );
                    },
                    orElse: () {},
                  );
                },
                child: const SplashView(),
              ),
              darkTheme: appTheme(),
              builder: (context, child) => MediaQuery(
                ///Setting font does not change with system font size
                data: MediaQuery.of(context)
                    .copyWith(textScaler: TextScaler.noScaling),
                child: LocalizationOverride(
                  builder: (context) {
                    return child!;
                  },
                ),
              ),
            );
          },
        );
      },
    );
  }
}
