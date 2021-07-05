import 'package:flutter/material.dart';

class CoinCard extends StatelessWidget {
  const CoinCard(
      {Key? key,
      required this.coin,
      required this.name,
      required this.price,
      required this.percentageToShow})
      : super(key: key);

  final String? coin;
  final String? name;
  final double? price;
  final String? percentageToShow;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Expanded(
      child: Card(
        elevation: 4,
        child: Container(
          child: Padding(
              padding: const EdgeInsets.all(25),
              child: Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      coin!,
                      style: theme.textTheme.subtitle1!
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    Text(name!, style: theme.textTheme.subtitle2),
                    Text(
                      'Price:  ${price!.toStringAsFixed(2)}  GBP',
                      style: theme.textTheme.subtitle2,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(percentageToShow!, style: theme.textTheme.subtitle2),
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
