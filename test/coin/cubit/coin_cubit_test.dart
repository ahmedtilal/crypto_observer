import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:crypto_observer/coin/coins.dart';
import 'package:coin_market_cap_api/coin_market_cap_api.dart'
    as coins_Repository;
import '../../helpers/hydrated_bloc.dart';

const coinName = 'Bitcoin';
const coinSymbol = coins_Repository.CoinSymbol.BTC;
const coinCmcRank = 1;

class MockCoinsRepository extends Mock
    implements coins_Repository.CoinMarketApiClient {}

class MockCoin extends Mock implements List<coins_Repository.Coin> {}

void main() {
  group('CoinsCubit', () {
    late List<coins_Repository.Coin> coins;
    late coins_Repository.CoinMarketApiClient coinMarketApiClient;
    late CoinsCubit coinsCubit;

    setUpAll(initHydratedBloc);

    setUp(() {
      coins = MockCoin();
      coinMarketApiClient = MockCoinsRepository();
      when(() => coins[0].name).thenReturn(coinName);
      when(() => coins[0].symbol).thenReturn(coinSymbol);
      when(() => coins[0].cmcRank).thenReturn(coinCmcRank);
      when(() => coinMarketApiClient.getCoins()).thenAnswer((_) async => coins);
      coinsCubit = CoinsCubit(coinMarketApiClient);
    });

    tearDown(() {
      coinsCubit.close();
    });

    test('Initial state is correct', () {
      expect(coinsCubit.state, CoinsState());
    });

    group('toJson/fromJson', () {
      test('from Json working properly', () {
        expect(
          coinsCubit.fromJson(coinsCubit.toJson(coinsCubit.state)),
          coinsCubit.state,
        );
      });
    });

    group('fetchCoins', () {
      blocTest<CoinsCubit, CoinsState>('Calls getCoins',
          build: () => coinsCubit,
          act: (cubit) => cubit.fetchCoins(),
          verify: (_) {
            verify(() => coinMarketApiClient.getCoins()).called(1);
          });

      blocTest<CoinsCubit, CoinsState>(
        'emits [Loading, Failure] when getCoins throws.',
        build: () {
          when(() => coinMarketApiClient.getCoins())
              .thenThrow(Exception('Problem'));
          return coinsCubit;
        },
        act: (cubit) => cubit.fetchCoins(),
        expect: () => <CoinsState>[
          CoinsState(status: CoinsStatus.loading),
          CoinsState(status: CoinsStatus.failure)
        ],
      );

      blocTest<CoinsCubit, CoinsState>(
          'emits [Loading, Success] when getCoins returns List of Coins',
          build: () => coinsCubit,
          act: (cubit) => cubit.fetchCoins(),
          expect: () => <dynamic>[
                CoinsState(status: CoinsStatus.loading),
                isA<CoinsState>()
                    .having((s) => s.status, 'status', CoinsStatus.success)
                    .having(
                        (s) => s.period, 'period', PercentagePeriod.period_24h)
                    .having((s) => s.coins, 'coins', [])
              ]);
    });
  });
}
