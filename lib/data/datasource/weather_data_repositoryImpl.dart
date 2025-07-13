import 'package:weather/data/datasource/weather_datasource.dart';
import 'package:weather/data/repository/local/weather_datasource_localimpl.dart';
import 'package:weather/data/repository/remote/weather_datasource_remoteimpl.dart';
import 'package:weather/domain/model/weather_model.dart';
import 'package:weather/domain/repository/weather_repository.dart';
import 'package:weather/util/app_result_container.dart';
import 'package:injectable/injectable.dart';
import 'package:weather/util/pair.dart';

@named
@Injectable(as: WeatherRepository)
class WeatherDatasourceRepositoryImpl implements WeatherRepository {
  WeatherDatasourceRepositoryImpl(
    @Named.from(WeatherDatasourceRemoteImpl) this._weatherDataRemote,
    @Named.from(WeatherDatasourceLocalImpl) this._weatherDataLocal,
  );

  final WeatherDataSource _weatherDataRemote;
  final WeatherDataSource _weatherDataLocal;

  @override
  Future<AppResult<Pair<List<WeatherModel>>>> fetchWeatherInit() =>
      _weatherDataLocal.fetchWeatherFromLocal();

  @override
  Future<AppResult<List<WeatherModel>>> fetchWeather(String query) async {
    final result = await _weatherDataRemote.fetchWeather(query);
    if (result is AppSuccess) {
      _weatherDataLocal.updateDB(
        query,
        (result as AppSuccess<List<WeatherModel>>).data,
      );
    }
    return result;
  }
}
