import 'package:freezed_annotation/freezed_annotation.dart';

part 'weather_bloc_event.freezed.dart';

@freezed
sealed class WeatherEvent with _$WeatherEvent {
  const WeatherEvent._();

  const factory WeatherEvent.init() = WeatherEventInit;
  const factory WeatherEvent.retry(String query) = WeatherEventRetry;
  const factory WeatherEvent.locationSubmit(String query) =
      WeatherLocationQuery;
}
