import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'coin/coins.dart';
import 'package:coin_market_cap_api/coin_market_cap_api.dart';

class CoinsApp extends StatelessWidget {
  const CoinsApp({Key? key, required CoinMarketApiClient coinsRepository})
      : _coinsRepository = coinsRepository,
        super(key: key);
  final CoinMarketApiClient _coinsRepository;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: _coinsRepository,
      child: CoinsAppView(),
    );
  }
}

class CoinsAppView extends StatelessWidget {
  const CoinsAppView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.cyan,
        textTheme: GoogleFonts.poppinsTextTheme(),
        appBarTheme: AppBarTheme(
          textTheme: GoogleFonts.poppinsTextTheme(textTheme).apply(
            bodyColor: Colors.black,
          ),
        ),
      ),
      home: CoinsPage(),
    );
  }
}
