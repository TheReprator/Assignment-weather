import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:weather/domain/usecase/weather_usecase.dart';
import 'package:weather/presentation/controller/weather_bloc_event.dart';
import 'package:weather/presentation/controller/weather_bloc_state.dart';
import 'package:weather/util/app_result_container.dart';

@injectable
class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherUsecase _weatherUseCase;

  WeatherBloc(this._weatherUseCase) : super(const WeatherState.init()) {
    on<WeatherLocationQuery>(_onLocationSearch);
    on<WeatherEventRetry>(_onLocationSearch);
    on<WeatherEventInit>(_fetchPreviousLocation);
  }

  Future<void> _fetchPreviousLocation(
    WeatherEventInit event,
    Emitter<WeatherState> emit,
  ) async {
    emit(const WeatherStateLoading());

    final result = await _weatherUseCase.initFetch();
    result.when(
      success: (data) =>
          emit(WeatherPreviousSession(data: data.second, query: data.first)),
      error: (msg) => {emit(const WeatherStateInit())},
    );
  }

  Future<void> _onLocationSearch(
    WeatherEvent event,
    Emitter<WeatherState> emit,
  ) async {
    String query = '';
    if (event is WeatherLocationQuery) {
      query = event.query;
    } else if (event is WeatherEventRetry) {
      query = event.query;
    }
    if (query.trim().isEmpty) return emit(const WeatherStateInit());

    emit(const WeatherStateLoading());

    final result = await _weatherUseCase(query);
    result.when(
      success: (data) => emit(WeatherStateContent(data: data)),
      error: (msg) => emit(WeatherStateError(msg ?? "")),
    );
  }
}
