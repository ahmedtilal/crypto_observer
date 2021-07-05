import 'package:flutter/material.dart';

class CoinsLoading extends StatelessWidget {
  const CoinsLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
        child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Loading Coins Data...',
            style: theme.textTheme.headline5,
          ),
          SizedBox(height: 100.0),
          CircularProgressIndicator()
        ],
      ),
    ));
  }
}
