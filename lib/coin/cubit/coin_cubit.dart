import 'package:crypto_observer/coin/models/coin.dart';
import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:coin_market_cap_api/coin_market_cap_api.dart'
    show CoinMarketApiClient;
import 'package:json_annotation/json_annotation.dart';

part 'coin_cubit.g.dart';
part 'coin_state.dart';

@JsonSerializable()
class CoinsCubit extends HydratedCubit<CoinsState> {
  CoinsCubit(this.coinsRepository) : super(CoinsState());
  final CoinMarketApiClient coinsRepository;

  Future<void> fetchCoins() async {
    emit(state.copyWith(status: CoinsStatus.loading));
    try {
      final coinsReturned = await coinsRepository.getCoins();
      final coins = filterCoins(coinsReturned);
      emit(state.copyWith(
          status: CoinsStatus.success, coins: coins, period: state.period));
    } on Exception {
      emit(state.copyWith(status: CoinsStatus.failure));
    }
  }

  Future<void> refreshCoins() async {
    if (!state.status!.isSuccessful) return;
    if (state.coins == List.empty()) return;
    try {
      final coins = filterCoins(await coinsRepository.getCoins());
      emit(state.copyWith(
          status: CoinsStatus.success, coins: coins, period: state.period));
    } on Exception {
      emit(state);
    }
  }

  void changePeriod(PercentagePeriod? period) {
    emit(
      state.copyWith(
        period: period!,
        coins: state.coins!.ammendCoins(state.coins!, period),
      ),
    );
  }

  List<Coin> filterCoins(List? coins) {
    List<Coin> _coinsList = [];
    for (int i = 0; i < coins!.length; i++) {
      _coinsList.add(Coin.fromRepository(coins[i]));
    }
    return _coinsList.ammendCoins(_coinsList, PercentagePeriod.period_24h);
  }

  @override
  CoinsState fromJson(Map<String, dynamic> json) => CoinsState.fromJson(json);
  @override
  Map<String, dynamic> toJson(CoinsState state) => state.toJson();
}

extension on List {
  List<Coin> ammendCoins(List<Coin>? list, PercentagePeriod? period) {
    List<Coin> newList = [];
    list!.forEach(
      (element) =>
          newList.add(element.changePercentageToShow(element, period!)),
    );
    return newList;
  }
}
