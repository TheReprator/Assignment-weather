import 'package:weather/domain/model/weather_model.dart';
import 'package:weather/util/app_result_container.dart';

abstract interface class WeatherRepository {
  Future<AppResult<List<WeatherModel>>> fetchWeather(String query);
}
