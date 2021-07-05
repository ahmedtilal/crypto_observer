import 'package:crypto_observer/coin/coins.dart';
import 'package:crypto_observer/coin/widgets/widgets.dart';
import 'package:flutter/material.dart';

class CoinsFetched extends StatelessWidget {
  const CoinsFetched({Key? key, required this.onRefresh, required this.coins})
      : super(key: key);

  final List<Coin> coins;
  final ValueGetter<Future<void>> onRefresh;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        Container(
          height: height,
          width: width,
          color: Colors.grey[400],
        ),
        RefreshIndicator(
          onRefresh: onRefresh,
          child: ListView.builder(
            itemCount: coins.length,
            itemBuilder: (BuildContext context, int index) {
              return CoinCard(
                  coin: coins[index].symbol.toString().split('.').last,
                  name: coins[index].name,
                  price: coins[index].price,
                  percentageToShow: coins[index].percentageToShow);
            },
          ),
        ),
      ],
    );
  }
}

// CoinCard(
//                 name: coins[0].name,
//                 coin: coins[0].symbol.toString().split('.').last,
//                 price: coins[0].price,
//                 percentageToShow: coins[0].percentageToShow,
//               ),
