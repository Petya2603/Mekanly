import 'package:flutter/material.dart';

import 'localization_service.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


extension LocalizationTranslationExtension on BuildContext {
  AppLocalizations get translation {
    final trnsl = LocalizationService.translation(this);
    if (trnsl == null) {
      throw Exception('Unkown Localization');
    }
    return trnsl;
  }

  MaterialLocalizations get materialTranslation =>
      MaterialLocalizations.of(this);
}
