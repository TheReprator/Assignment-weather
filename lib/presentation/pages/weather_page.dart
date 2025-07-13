import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/domain/model/weather_model.dart';
import 'package:weather/presentation/controller/weather_bloc.dart';
import 'package:weather/presentation/controller/weather_bloc_event.dart';
import 'package:weather/presentation/controller/weather_bloc_state.dart';
import 'package:weather/presentation/widgets/weather_error.dart';
import 'package:weather/util/app_extension.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  final _textController = TextEditingController();

  @override
  void initState() {
    super.initState();

    context.read<WeatherBloc>().add(const WeatherEvent.init());
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(context.loc.title)),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: <Widget>[
            _LocationSearchWidget(_textController),
            const SizedBox(height: 16),
            _WeatherBody(_textController),
          ],
        ),
      ),
    );
  }
}

class _LocationSearchWidget extends StatelessWidget {
  const _LocationSearchWidget(TextEditingController textController)
    : _textController = textController;

  final TextEditingController _textController;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _textController,
      autocorrect: false,
      onSubmitted: (text) {
        context.read<WeatherBloc>().add(WeatherLocationQuery(text));
      },
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.search),
        suffixIcon: GestureDetector(
          onTap: () => _onClearTapped(context),
          child: const Icon(Icons.clear),
        ),
        border: OutlineInputBorder(),
        hintText: context.loc.locationHint,
      ),
    );
  }

  void _onClearTapped(BuildContext context) {
    _textController.text = '';
    context.read<WeatherBloc>().add(const WeatherLocationQuery(''));
  }
}

class _WeatherBody extends StatelessWidget {
  const _WeatherBody(TextEditingController textController)
    : _textController = textController;

  final TextEditingController _textController;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<WeatherBloc, WeatherState>(
        builder: (context, state) {
          return switch (state) {
            WeatherStateInit() => Container(),
            WeatherStateLoading() => const Center(
              child: CircularProgressIndicator.adaptive(),
            ),
            WeatherStateError() => Center(
              child: WeatherError(
                errorMessage: state.exception,
                onRetry: () {
                  context.read<WeatherBloc>().add(
                    WeatherLocationQuery(_textController.text),
                  );
                },
              ),
            ),
            WeatherStateContent() => _WeatherResults(items: state.data),
            WeatherPreviousSession() => () {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                _textController.text = state.query;
              });
              return _WeatherResults(items: state.data);
            }(),
          };
        },
      ),
    );
  }
}

class _WeatherResults extends StatelessWidget {
  const _WeatherResults({required this.items});

  final List<WeatherModel> items;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index) {
        return _WeatherResultItem(item: items[index]);
      },
      separatorBuilder: (context, index) {
        return Divider();
      },
    );
  }
}

class _WeatherResultItem extends StatelessWidget {
  const _WeatherResultItem({required this.item});

  final WeatherModel item;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(item.weatherDate),
        Text(item.condition),
        Text(item.temperature),
      ],
    );
  }
}
