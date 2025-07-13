import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'weather.g.dart';

abstract class EntityWeather
    implements Built<EntityWeather, EntityWeatherBuilder> {
  EntityWeather._();

  EntityDaily? get daily;
  String? get name;
  double? get latitude;
  double? get longitude;

  factory EntityWeather([void Function(EntityWeatherBuilder) updates]) =
      _$EntityWeather;

  static Serializer<EntityWeather> get serializer => _$entityWeatherSerializer;
}

abstract class EntityDaily implements Built<EntityDaily, EntityDailyBuilder> {
  EntityDaily._();

  BuiltList<String?>? get time;
  @BuiltValueField(wireName: "temperature_2m_max")
  BuiltList<double?>? get temperatureMax;
  @BuiltValueField(wireName: "temperature_2m_min")
  BuiltList<double?>? get temperatureMin;
  @BuiltValueField(wireName: "weather_code")
  BuiltList<int?>? get weatherCode;

  factory EntityDaily([void Function(EntityDailyBuilder) updates]) =
      _$EntityDaily;

  static Serializer<EntityDaily> get serializer => _$entityDailySerializer;
}
