// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
final class _$ApiService extends ApiService {
  _$ApiService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final Type definitionType = ApiService;

  @override
  Future<EntityLocationContainer> geoCodeLocation(String location) async {
    final Uri $url = Uri.parse(
      'https://geocoding-api.open-meteo.com/v1/search?count=1',
    );
    final Map<String, dynamic> $params = <String, dynamic>{'name': location};
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
    );
    final Response $response = await client
        .send<EntityLocationContainer, EntityLocationContainer>($request);
    return $response.bodyOrThrow;
  }

  @override
  Future<EntityWeather> getWeatherInfo(
    double latitude,
    double longitude,
  ) async {
    final Uri $url = Uri.parse(
      'forecast?latitude=52.52&longitude=13.41&daily=temperature_2m_max,temperature_2m_min,weather_code&forecast_days=5&timezone=auto',
    );
    final Map<String, dynamic> $params = <String, dynamic>{
      'latitude': latitude,
      'longitude': longitude,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
    );
    final Response $response = await client.send<EntityWeather, EntityWeather>(
      $request,
    );
    return $response.bodyOrThrow;
  }
}
