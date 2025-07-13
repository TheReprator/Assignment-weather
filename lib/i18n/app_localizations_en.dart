// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get title => 'Weather App';

  @override
  String get searchHint => 'Enter a location';

  @override
  String get retry => 'Retry';

  @override
  String get loading => 'Loading Weather';

  @override
  String get locationHint => 'Enter a location';
}
