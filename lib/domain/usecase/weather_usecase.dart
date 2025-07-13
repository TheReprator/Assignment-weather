import 'package:injectable/injectable.dart';
import 'package:weather/data/datasource/weather_data_repositoryImpl.dart';
import 'package:weather/domain/model/weather_model.dart';
import 'package:weather/domain/repository/weather_repository.dart';
import 'package:weather/util/app_result_container.dart';

@injectable
class WeatherUsecase {
  WeatherUsecase(
    @Named.from(WeatherDatasourceRepositoryImpl) this._weatherRepository,
  );

  final WeatherRepository _weatherRepository;

  Future<AppResult<List<WeatherModel>>> call(String query) =>
      _weatherRepository.fetchWeather(query);
}
