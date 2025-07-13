// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Hindi (`hi`).
class AppLocalizationsHi extends AppLocalizations {
  AppLocalizationsHi([String locale = 'hi']) : super(locale);

  @override
  String get title => 'मौसम ऐप';

  @override
  String get searchHint => 'स्थान दर्ज करें';

  @override
  String get retry => 'पुन: प्रयास करें';

  @override
  String get loading => 'Loading Weather';

  @override
  String get locationHint => 'Enter a location';
}
