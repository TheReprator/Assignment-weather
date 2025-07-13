import 'package:injectable/injectable.dart';
import 'package:weather/domain/model/weather_model.dart';
import 'package:weather/util/mapper_result.dart';
import 'package:weather/util/pair.dart';

const _DB_TABLE_PARAM_LOCATION = 'location';

@named
@Injectable(as: MapperResult)
class WeatherLocalMapper
    extends MapperResult<List<Map<String, dynamic>>, Pair<List<WeatherModel>>> {
  @override
  List<Map<String, dynamic>> mapFrom(Pair<List<WeatherModel>>? from) {
    if (null == from) {
      throw Exception('Cannot map null value');
    }
    final location = from.first;

    final result = from.second.map((weather) {
      final item = weather.toJson();
      item[_DB_TABLE_PARAM_LOCATION] = location;
      return item;
    }).toList();

    return result;
  }

  @override
  Pair<List<WeatherModel>> mapTo(List<Map<String, dynamic>>? from) {
    if (null == from) {
      throw Exception('Cannot map null value');
    }

    final second = from.map((item) {
      return WeatherModel.fromJson(item);
    }).toList();

    final first = from.isNotEmpty
        ? from.first[_DB_TABLE_PARAM_LOCATION] as String
        : '';

    return Pair<List<WeatherModel>>(first: first, second: second);
  }
}
