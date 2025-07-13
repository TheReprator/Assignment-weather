// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:chopper/chopper.dart' as _i31;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:logger/logger.dart' as _i974;
import 'package:weather/data/datasource/weather_data_repositoryImpl.dart'
    as _i1063;
import 'package:weather/data/datasource/weather_datasource.dart' as _i827;
import 'package:weather/data/repository/remote/entity/weather.dart' as _i110;
import 'package:weather/data/repository/remote/mapper/weather_mapper.dart'
    as _i1047;
import 'package:weather/data/repository/remote/weather_datasource_remoteimpl.dart'
    as _i50;
import 'package:weather/di/impl/network/api_service.dart' as _i996;
import 'package:weather/di/impl/network/built_value_converter.dart' as _i853;
import 'package:weather/di/module/app_module.dart' as _i774;
import 'package:weather/di/module/network_module.dart' as _i423;
import 'package:weather/domain/model/weather_model.dart' as _i719;
import 'package:weather/domain/repository/weather_repository.dart' as _i121;
import 'package:weather/domain/usecase/weather_usecase.dart' as _i210;
import 'package:weather/presentation/controller/weather_bloc.dart' as _i847;
import 'package:weather/util/logger.dart' as _i17;
import 'package:weather/util/mapper_result.dart' as _i765;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final appModule = _$AppModule();
    final networkModule = _$NetworkModule(this);
    gh.lazySingleton<_i974.Logger>(() => appModule.logger);
    gh.singleton<_i17.Logger>(() => _i17.LoggerLogging());
    gh.factory<List<_i31.Interceptor>>(
      () => networkModule.clientInterceptor,
      instanceName: 'interceptorList',
    );
    gh.factory<_i765.MapperResult<_i110.EntityDaily, List<_i719.WeatherModel>>>(
      () => _i1047.WeatherMapper(),
      instanceName: 'WeatherMapper',
    );
    gh.factory<_i853.BuiltValueConverter>(
      () => networkModule.converter(),
      instanceName: 'serializer',
    );
    gh.factory<String>(() => networkModule.baseUrl, instanceName: 'apiUrl');
    gh.lazySingleton<_i31.ChopperClient>(
      () => networkModule.chopperClient(
        gh<String>(instanceName: 'apiUrl'),
        gh<_i853.BuiltValueConverter>(instanceName: 'serializer'),
        gh<List<_i31.Interceptor>>(instanceName: 'interceptorList'),
      ),
    );
    gh.lazySingleton<_i996.ApiService>(() => networkModule.apiService);
    gh.factory<_i827.WeatherDataSource>(
      () => _i50.WeatherDatasourceRemoteImpl(
        gh<_i996.ApiService>(),
        gh<_i765.MapperResult<_i110.EntityDaily, List<_i719.WeatherModel>>>(
          instanceName: 'WeatherMapper',
        ),
      ),
      instanceName: 'WeatherDatasourceRemoteImpl',
    );
    gh.factory<_i121.WeatherRepository>(
      () => _i1063.WeatherDatasourceRepositoryImpl(
        gh<_i827.WeatherDataSource>(
          instanceName: 'WeatherDatasourceRemoteImpl',
        ),
      ),
      instanceName: 'WeatherDatasourceRepositoryImpl',
    );
    gh.factory<_i210.WeatherUsecase>(
      () => _i210.WeatherUsecase(
        gh<_i121.WeatherRepository>(
          instanceName: 'WeatherDatasourceRepositoryImpl',
        ),
      ),
    );
    gh.factory<_i847.WeatherBloc>(
      () => _i847.WeatherBloc(gh<_i210.WeatherUsecase>()),
    );
    return this;
  }
}

class _$AppModule extends _i774.AppModule {}

class _$NetworkModule extends _i423.NetworkModule {
  _$NetworkModule(this._getIt);

  final _i174.GetIt _getIt;

  @override
  _i996.ApiService get apiService =>
      _i996.ApiService.create(_getIt<_i31.ChopperClient>());
}
