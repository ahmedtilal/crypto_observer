import 'package:flutter/material.dart';

class CoinsError extends StatelessWidget {
  CoinsError({this.period});
  final String? period;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      child: Center(
        child: Text('There Was An Error Fetching The Data',
            style: theme.textTheme.headline4),
      ),
    );
  }
}
