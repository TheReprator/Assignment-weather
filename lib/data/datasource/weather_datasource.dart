import 'package:weather/domain/model/weather_model.dart';
import 'package:weather/util/app_result_container.dart';
import 'package:weather/util/pair.dart';

abstract interface class WeatherDataSource {
  Future<AppResult<Pair<List<WeatherModel>>>> fetchWeatherFromLocal();
  Future<AppResult<List<WeatherModel>>> fetchWeather(String query);
  void updateDB(String query, List<WeatherModel> listWeather);
}
