import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import '../../product/local/config_preference.dart';
import '../../utils/extensions.dart';
part 'app_cubit.freezed.dart';
part 'app_state.dart';

@injectable
class AppCubit extends Cubit<AppState> {
  AppCubit() : super(const AppState()) {
    init();
  }

  Future<void> init() async {
    final currentLang = ConfigPreference.loadLangCode();
    final current = AppState(locale: currentLang.getLocale);
    emit(current);
  }

  Future<void> onResetApp() async {
    // _appRouterConfig.goRouter.goNamed(LauncherView.routeName);
    emit(state.copyWith(key: UniqueKey()));
  }

  void changeLang(Locale locale) {
    ConfigPreference.setLangCode(locale.languageCode);

    emit(
      state.copyWith(
        locale: locale,
      ),
    );
  }
}
