import 'dart:async';

import 'package:flutter/material.dart';
import 'package:weather/app/routes/go_router_init.dart';
import 'package:weather/app/themes.dart';
import 'package:weather/di/di.dart';
import 'package:weather/i18n/app_localizations.dart';
import 'package:weather/util/logger.dart' as appLogger;

import 'package:logging/logging.dart';

Future<void> main() async {
  runZonedGuarded<Future<void>>(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      _setupLogging();
      configureDependencies();

      final logger = getIt.get<appLogger.Logger>();
      logger.runLogging(
        () => runZonedGuarded(() {}, logger.logZoneError),
        const appLogger.LogOptions(),
      );
      runApp(const MyApp());
    },
    (Object error, StackTrace stack) {
      debugPrint(error.toString());
    },
  );
}

void _setupLogging() {
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((rec) {
    print('${rec.level.name}: ${rec.time}: ${rec.message}');
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: AppThemes.themeData,
      routerConfig: routerinit,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      localeResolutionCallback: (locale, supportedLocales) {
        // 🛠 Custom fallback logic (optional)
        for (final supportedLocale in supportedLocales) {
          if (supportedLocale.languageCode == locale?.languageCode) {
            return supportedLocale;
          }
        }
        return supportedLocales.first;
      },
    );
  }
}
