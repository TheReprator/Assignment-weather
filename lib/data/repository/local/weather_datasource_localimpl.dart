import 'dart:async';
import 'package:injectable/injectable.dart';
import 'package:weather/app/db/weather_db_handler.dart';
import 'package:weather/data/datasource/weather_datasource.dart';
import 'package:weather/data/repository/local/mapper/weather_local_mapper.dart';
import 'package:weather/domain/model/weather_model.dart';
import 'package:weather/util/app_result_container.dart';
import 'package:weather/util/mapper_result.dart';
import 'package:weather/util/pair.dart';

@named
@Injectable(as: WeatherDataSource)
class WeatherDatasourceLocalImpl implements WeatherDataSource {
  WeatherDatasourceLocalImpl(
    this._weatherDbHandler,
    @Named.from(WeatherLocalMapper) this._mapper,
  );

  final WeatherDbHandler _weatherDbHandler;
  final MapperResult<List<Map<String, dynamic>>, Pair<List<WeatherModel>>>
  _mapper;

  @override
  Future<AppResult<List<WeatherModel>>> fetchWeather(String query) {
    throw Exception('invalid operatioin: fetchWeather');
  }

  @override
  void updateDB(String query, List<WeatherModel> listWeather) async {
    await _weatherDbHandler.clearTable(WeatherDbHandler.tableName);

    final builtList = _mapper.mapFrom(Pair(first: query, second: listWeather));

    await _weatherDbHandler.insertBatch(WeatherDbHandler.tableName, builtList);
  }

  @override
  Future<AppResult<Pair<List<WeatherModel>>>> fetchWeatherFromLocal() async {
    final result = await _weatherDbHandler.getAllWeather();
    if (result.isEmpty) {
      return AppResult.error('No data found');
    }

    final builtList = _mapper.mapTo(result);
    return AppResult.success(builtList);
  }
}
