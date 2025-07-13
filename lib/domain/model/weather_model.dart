import 'package:freezed_annotation/freezed_annotation.dart';

part 'weather_model.freezed.dart';

@freezed
abstract class WeatherModel with _$WeatherModel {
  const factory WeatherModel({
    required String date,
    required String temperature,
    required String weatherCondition,
  }) = _WeatherModel;
}
