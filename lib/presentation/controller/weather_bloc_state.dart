import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:weather/domain/model/weather_model.dart';

part 'weather_bloc_state.freezed.dart';

@freezed
sealed class WeatherState with _$WeatherState {
  const WeatherState._();

  const factory WeatherState.init() = WeatherStateInit;
  const factory WeatherState.previousSessionState({
    required List<WeatherModel> data,
    required String query,
  }) = WeatherPreviousSession;
  const factory WeatherState.loading() = WeatherStateLoading;
  const factory WeatherState.error(String exception) = WeatherStateError;

  const factory WeatherState.content({required List<WeatherModel> data}) =
      WeatherStateContent;
}
