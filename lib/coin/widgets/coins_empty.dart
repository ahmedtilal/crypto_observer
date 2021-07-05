import 'package:flutter/material.dart';

class CoinsEmpty extends StatelessWidget {
  const CoinsEmpty({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      child: Center(
          child: Text('Please Wait Until CryptoCurrencies Data is Fetched',
              style: theme.textTheme.headline4)),
    );
  }
}
