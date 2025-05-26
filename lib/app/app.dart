import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../features/auth/cubit/auth_cubit.dart';
import '../features/business_porfile/cubit/business_profile_cubit.dart';
import '../features/home/cubit/home_cubit.dart';
import '../features/houses/bloc/houses_bloc.dart';
import '../localization/localization_override.dart';
import '../localization/localization_service.dart';
import '../product/init/theme/theme.dart';
import '../product/injection/injector.dart';
import 'cubit/app_cubit.dart';
import 'router_config.dart';

/// Init app
class MekanlyApp extends StatefulWidget {
  /// Init app
  const MekanlyApp({super.key, required this.routerConfig});

  final AppRouterConfig routerConfig;

  static Future<Widget> create() async {
    await injector.allReady();
    final routerConfig = injector<AppRouterConfig>();
    final appBloc = injector<AppCubit>();
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
      child: MekanlyApp(routerConfig: routerConfig),
    );
  }

  @override
  State<MekanlyApp> createState() => _MekanlyAppState();
}

class _MekanlyAppState extends State<MekanlyApp> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) {
        return BlocBuilder<AppCubit, AppState>(
          builder: (_, state) {
            return KeyedSubtree(
              key: state.key,
              child: MaterialApp.router(
                routeInformationProvider:
                    widget.routerConfig.goRouter.routeInformationProvider,
                routeInformationParser:
                    widget.routerConfig.goRouter.routeInformationParser,
                routerDelegate: widget.routerConfig.goRouter.routerDelegate,
                locale: const Locale('en'),
                debugShowCheckedModeBanner: false,
                supportedLocales: LocalizationService.supportedLocales,
                localizationsDelegates: LocalizationService.delegates,
                theme: appTheme(),
                darkTheme: appTheme(),
                builder: (context, child) => MediaQuery(
                  ///Setting font does not change with system font size
                  data: MediaQuery.of(context)
                      .copyWith(textScaler: const TextScaler.linear(1)),
                  child: LocalizationOverride(
                    builder: (context) {
                      return child!;
                    },
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
