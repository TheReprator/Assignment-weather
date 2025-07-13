import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:weather/data/repository/remote/entity/location.dart';
import 'package:weather/data/repository/remote/entity/weather.dart';

part 'serializers.g.dart';

@SerializersFor([
  EntityLocationContainer,
  EntityLocation,
  EntityDaily,
  EntityWeather,
])
final Serializers serializers =
    (_$serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();
