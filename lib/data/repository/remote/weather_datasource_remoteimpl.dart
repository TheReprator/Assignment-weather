import 'dart:async';
import 'package:injectable/injectable.dart';
import 'package:weather/data/datasource/weather_datasource.dart';
import 'package:weather/data/repository/remote/entity/weather.dart';
import 'package:weather/data/repository/remote/mapper/weather_mapper.dart';
import 'package:weather/di/impl/network/api_service.dart';
import 'package:weather/domain/model/weather_model.dart';
import 'package:weather/util/app_result_container.dart';
import 'package:weather/util/mapper_result.dart';
import 'package:weather/util/pair.dart';

@named
@Injectable(as: WeatherDataSource)
class WeatherDatasourceRemoteImpl implements WeatherDataSource {
  WeatherDatasourceRemoteImpl(
    this._apiService,
    @Named.from(WeatherMapper) this._mapper,
  );

  final ApiService _apiService;
  final MapperResult<EntityDaily, List<WeatherModel>> _mapper;

  @override
  Future<AppResult<List<WeatherModel>>> fetchWeather(String query) async {
    return _apiService
        .geoCodeLocation(query)
        .then((geoCodeList) {
          if (geoCodeList.results == null || geoCodeList.results!.isEmpty) {
            throw _DataNotFoundException();
          }
          return _apiService.getWeatherInfo(
            geoCodeList.results![0].latitude!,
            geoCodeList.results![0].longitude!,
          );
        })
        .then((weather) {
          if (weather.daily == null ||
              weather.daily!.time == null ||
              weather.daily!.time!.isEmpty) {
            throw _DataNotFoundException();
          }
          return AppResult.success(_mapper.mapTo(weather.daily));
        })
        .catchError(
          (e) => AppResult<List<WeatherModel>>.error('City not found'),
          test: (e) => e is _DataNotFoundException,
        )
        .catchError(
          (e) => AppResult<List<WeatherModel>>.error('An error occurred'),
          test: (e) => true,
        );
  }

  @override
  void updateDB(String query, List<WeatherModel> listWeather) =>
      throw Exception('invalid operation');

  @override
  Future<AppResult<Pair<List<WeatherModel>>>> fetchWeatherFromLocal() =>
      throw Exception('invalid operation');
}

class _DataNotFoundException implements Exception {
  const _DataNotFoundException([this.message]);

  final String? message;
}
