import 'package:flutter/material.dart';
import 'package:weather/util/app_extension.dart';

class WeatherError extends StatelessWidget {
  const WeatherError({super.key, required this.errorMessage, this.onRetry});

  final String errorMessage;
  final VoidCallback? onRetry;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text('🙈', style: TextStyle(fontSize: 64)),
        Text(errorMessage, style: theme.textTheme.headlineSmall),
        if (onRetry != null)
          ElevatedButton.icon(
            onPressed: onRetry,
            icon: Icon(Icons.refresh),
            label: Text(context.loc.retry),
            style: ElevatedButton.styleFrom(backgroundColor: Colors.blueAccent),
          ),
      ],
    );
  }
}
