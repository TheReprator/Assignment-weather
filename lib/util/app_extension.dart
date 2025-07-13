import 'package:flutter/widgets.dart';
import 'package:weather/i18n/app_localizations.dart';

extension LocalizedBuildContext on BuildContext {
  AppLocalizations get loc => AppLocalizations.of(this);
}
