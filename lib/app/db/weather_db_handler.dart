import 'package:injectable/injectable.dart';
import 'package:weather/app/db/database.dart';

@singleton
@Injectable(as: WeatherDbHandler)
class WeatherDbHandler extends SqfLiteDbHandler {
  static const String tableName = 'weather_data';

  Future<void> insertWeather(Map<String, dynamic> data) async {
    await insert(tableName, data);
  }

  Future<List<Map<String, dynamic>>> getAllWeather() async {
    return await selectAll(tableName);
  }
}
