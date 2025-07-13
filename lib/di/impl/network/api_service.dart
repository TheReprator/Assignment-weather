import 'package:chopper/chopper.dart';
import 'package:injectable/injectable.dart';
import 'package:weather/data/repository/remote/entity/location.dart';
import 'package:weather/data/repository/remote/entity/weather.dart';

part 'api_service.chopper.dart';

@ChopperApi()
abstract class ApiService extends ChopperService {
  @GET(path: 'https://geocoding-api.open-meteo.com/v1/search?count=1')
  Future<EntityLocationContainer> geoCodeLocation(
    @Query("name") String location,
  );

  @GET(
    path:
        'forecast?latitude=52.52&longitude=13.41&daily=temperature_2m_max,temperature_2m_min,weather_code&forecast_days=5&timezone=auto',
  )
  Future<EntityWeather> getWeatherInfo(
    @Query("latitude") double latitude,
    @Query("longitude") double longitude,
  );

  @factoryMethod
  static ApiService create(ChopperClient client) {
    return _$ApiService(client);
  }
}
