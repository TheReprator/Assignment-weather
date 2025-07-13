import 'package:built_value/standard_json_plugin.dart';
import 'package:chopper/chopper.dart';
import 'package:injectable/injectable.dart';
import 'package:weather/di/impl/network/api_service.dart';
import 'package:weather/di/impl/network/built_value_converter.dart';
import 'package:weather/di/impl/network/serializers.dart';

import 'package:weather/util/enviorment.dart' as app_enviorment;

const _namedApiUrl = 'apiUrl';
const _namedInterceptorList = 'interceptorList';
const _namedSerializer = 'serializer';

@module
abstract class NetworkModule {
  @lazySingleton
  ApiService get apiService;

  @Named(_namedApiUrl)
  String get baseUrl => app_enviorment.Environment.serverUrl;

  @lazySingleton
  ChopperClient chopperClient(
    @Named(_namedApiUrl) String baseUrl,
    @Named(_namedSerializer) BuiltValueConverter converter,
    @Named(_namedInterceptorList) List<Interceptor> interceptorList,
  ) => ChopperClient(
    baseUrl: Uri.parse(baseUrl),
    interceptors: interceptorList,
    errorConverter: converter,
    converter: converter,
  );

  @Named(_namedInterceptorList)
  List<Interceptor> get clientInterceptor => [
    CurlInterceptor(),
    HttpLoggingInterceptor(),
  ];

  @Named(_namedSerializer)
  BuiltValueConverter converter() {
    final jsonSerializers =
        (serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();

    return BuiltValueConverter(jsonSerializers);
  }
}
