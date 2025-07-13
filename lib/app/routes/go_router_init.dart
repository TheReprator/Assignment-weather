import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:weather/di/di.dart';
import 'package:weather/presentation/controller/weather_bloc.dart';
import 'package:weather/presentation/pages/weather_page.dart';
import 'package:weather/app/routes/routes.dart';

final GlobalKey<NavigatorState> _navigatorState = GlobalKey<NavigatorState>();

GoRouter routerinit = GoRouter(
  initialLocation: AppRoutes.ROUTE_PATH_WEATHER,
  navigatorKey: _navigatorState,
  routes: <RouteBase>[
    GoRoute(
      name: AppRoutes.ROUTE_NAME_WEATHER,
      path: AppRoutes.ROUTE_PATH_WEATHER,
      builder: (context, state) => BlocProvider<WeatherBloc>(
        create: (context) => getIt<WeatherBloc>(),
        child: WeatherPage(),
      ),
    ),
  ],
);
