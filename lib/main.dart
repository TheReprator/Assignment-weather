import 'dart:async';

import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:weather/app/db/database.dart';
import 'package:weather/app/db/weather_db_handler.dart';
import 'package:weather/app/routes/go_router_init.dart';
import 'package:weather/app/themes.dart';
import 'package:weather/di/di.dart';
import 'package:weather/i18n/app_localizations.dart';
import 'package:weather/util/logger.dart' as appLogger;

Future<void> main() async {
  runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();

      _setupRootLogger();
      configureDependencies();

      final logger = getIt<appLogger.Logger>();
      final dbHandler = getIt<WeatherDbHandler>()..initLogger(logger);

      await _initializeApp(dbHandler);

      logger.runLogging(
        () => runApp(const MyApp()),
        const appLogger.LogOptions(),
      );
    },
    (error, stackTrace) {
      debugPrint("Uncaught error: $error");
    },
  );
}

Future<void> _initializeApp(WeatherDbHandler dbHandler) async {
  final DbInfo dbInfo = (
    dbName: 'weather',
    queryFileName: 'create_weather_table_queries',
    dbVersion: 1,
  );
  await dbHandler.initializeDb(dbInfo);
}

void _setupRootLogger() {
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((rec) {
    debugPrint('${rec.level.name}: ${rec.time}: ${rec.message}');
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
