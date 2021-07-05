import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:crypto_observer/coin/coins.dart';
import 'package:crypto_observer/coin/widgets/widgets.dart';

class SettingsPage extends StatelessWidget {
  static Route route(CoinsCubit coinsCubit) {
    return MaterialPageRoute<void>(
      builder: (_) => BlocProvider.value(
        value: coinsCubit,
        child: SettingsPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Center(
          child: const Text('Settings'),
        ),
      ),
      body: SettingsView(),
    );
  }
}

class SettingsView extends StatelessWidget {
  const SettingsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.grey[300]),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: BlocBuilder<CoinsCubit, CoinsState>(
              buildWhen: (previous, current) =>
                  previous.period != current.period,
              builder: (context, state) {
                return DropDownBox(
                    dropDownValue: state.period,
                    onChanged: (periodString) {
                      switch (periodString) {
                        case '1h':
                          context
                              .read<CoinsCubit>()
                              .changePeriod(PercentagePeriod.period_1h);
                          break;
                        case '24h':
                          context
                              .read<CoinsCubit>()
                              .changePeriod(PercentagePeriod.period_24h);
                          break;
                        case '7d':
                          context
                              .read<CoinsCubit>()
                              .changePeriod(PercentagePeriod.period_7d);
                          break;
                        case '30d':
                          context
                              .read<CoinsCubit>()
                              .changePeriod(PercentagePeriod.period_30d);
                          break;
                        case '60d':
                          context
                              .read<CoinsCubit>()
                              .changePeriod(PercentagePeriod.period_60d);
                          break;
                        case '90d':
                          context
                              .read<CoinsCubit>()
                              .changePeriod(PercentagePeriod.period_90d);
                          break;
                      }
                    },
                    hintText: 'Percentage Change Period');
              }),
        ),
      ),
    );
  }
}
