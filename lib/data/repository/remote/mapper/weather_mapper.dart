import 'package:injectable/injectable.dart';
import 'package:weather/data/repository/remote/entity/weather.dart';
import 'package:weather/domain/model/weather_model.dart';
import 'package:weather/util/mapper_result.dart';

@named
@Injectable(as: MapperResult)
class WeatherMapper extends MapperResult<EntityDaily, List<WeatherModel>> {
  @override
  List<WeatherModel> mapTo(EntityDaily? from) {
    if (null == from) {
      return List.empty();
    }

    if (null == from.temperatureMax) {
      return List.empty();
    }

    List<WeatherModel> modelWeatherList = <WeatherModel>[];
    for (int i = 0; i < from.temperatureMin!.length; i++) {
      final model = WeatherModel(
        weatherDate: from.time![i] ?? '',
        temperature:
            'Temp.: ${from.temperatureMin![i]} °C - ${from.temperatureMax![i]}°C',
        condition: _weatherType(from.weatherCode![i] ?? 203),
      );
      modelWeatherList.add(model);
    }

    return modelWeatherList;
  }

  String _weatherType(int weatherCode) {
    String weatherType;
    if (0 == weatherCode) {
      weatherType = '☀️ Clear sky';
    } else if (1 == weatherCode) {
      weatherType = 'Mainly clear';
    } else if (2 == weatherCode) {
      weatherType = 'Partly cloudy';
    } else if (3 == weatherCode) {
      weatherType = 'Overcast';
    } else if (45 <= weatherCode && 48 >= weatherCode) {
      weatherType = 'Fog and depositing rime fog';
    } else if (51 <= weatherCode && 55 >= weatherCode) {
      weatherType = 'Drizzle: Light, moderate, and dense intensity';
    } else if (56 <= weatherCode && 57 >= weatherCode) {
      weatherType = 'Freezing Drizzle: Light and dense intensity';
    } else if (61 <= weatherCode && 65 >= weatherCode) {
      weatherType = 'Rain: Slight, moderate and heavy intensity';
    } else if (66 <= weatherCode && 67 >= weatherCode) {
      weatherType = 'Freezing Rain: Light and heavy intensity';
    } else if (71 <= weatherCode && 75 >= weatherCode) {
      weatherType = 'Snow fall: Slight, moderate, and heavy intensity';
    } else if (77 == weatherCode) {
      weatherType = 'Snow grains';
    } else if (80 <= weatherCode && 82 >= weatherCode) {
      weatherType = 'Rain showers: Slight, moderate, and violent';
    } else if (85 <= weatherCode && 86 >= weatherCode) {
      weatherType = 'Snow showers slight and heavy';
    } else if (95 == weatherCode) {
      weatherType = 'Thunderstorm: Slight or moderate';
    } else if (96 <= weatherCode && 96 >= weatherCode) {
      weatherType = 'Thunderstorm with slight and heavy hail';
    } else {
      weatherType = 'NA';
    }

    return weatherType;
  }

  @override
  EntityDaily mapFrom(List<WeatherModel>? from) =>
      throw Exception('Invalid operation');
}
