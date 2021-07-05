import 'package:crypto_observer/coin/widgets/coins_empty.dart';
import 'package:crypto_observer/coin/widgets/coins_error.dart';
import 'package:crypto_observer/coin/widgets/coins_fetched.dart';
import 'package:crypto_observer/coin/widgets/coins_loading.dart';
import 'package:crypto_observer/settings/view/settings_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:crypto_observer/coin/coins.dart';
import 'package:coin_market_cap_api/coin_market_cap_api.dart';
import 'package:crypto_observer/settings/settings.dart';
import 'package:pedantic/pedantic.dart';

class CoinsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CoinsCubit(
        context.read<CoinMarketApiClient>(),
      ),
      child: CoinsView(),
    );
  }
}

class CoinsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    unawaited(context.read<CoinsCubit>().fetchCoins());
    return Scaffold(
      appBar: AppBar(
        title: Center(child: const Text('Crypto Observer')),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).push<void>(
                  SettingsPage.route(
                    context.read<CoinsCubit>(),
                  ),
                );
              },
              icon: Icon(Icons.settings))
        ],
      ),
      body: Container(
        child: BlocBuilder<CoinsCubit, CoinsState>(builder: (context, state) {
          switch (state.status!) {
            case CoinsStatus.initial:
              unawaited(context.read<CoinsCubit>().fetchCoins());
              return const CoinsEmpty();
            case CoinsStatus.loading:
              return const CoinsLoading();
            case CoinsStatus.success:
              print(state.coins![0].percentageToShow);
              return CoinsFetched(
                onRefresh: () {
                  return context.read<CoinsCubit>().refreshCoins();
                },
                coins: state.coins!,
              );
            case CoinsStatus.failure:
              return CoinsError(
                period: state.period.toString(),
              );
          }
        }),
      ),
    );
  }
}
