import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:crypto_observer/coin/coins.dart';
import 'package:coin_market_cap_api/coin_market_cap_api.dart'
    as coins_Repository;
import '../../helpers/hydrated_bloc.dart';

final coin1 = coins_Repository.Coin(
    name: 'Bitcoin',
    cmcRank: 1,
    symbol: coins_Repository.CoinSymbol.BTC,
    quote: coins_Repository.Quote(
        gbp: coins_Repository.Currency(
            price: 2000,
            percentChange_1h: 1,
            percentChange_24h: 2,
            percentChange_30d: 3,
            percentChange_60d: 4,
            percentChange_7d: 5,
            percentChange_90d: 6)));

class MockCoinsRepository extends Mock
    implements coins_Repository.CoinMarketApiClient {}

class MockCoin extends Mock implements coins_Repository.Coin {}

class MockCoins extends Mock implements List<MockCoin> {}

void main() {
  group('CoinsCubit', () {
    late List<coins_Repository.Coin> coins;
    late coins_Repository.CoinMarketApiClient coinMarketApiClient;
    late CoinsCubit coinsCubit;

    setUpAll(
      initHydratedBloc,
    );

    setUp(() {
      coins = [];
      coins.add(coin1);
      coinMarketApiClient = MockCoinsRepository();
      when(() => coinMarketApiClient.getCoins())
          .thenAnswer((_) => Future.value(coins));

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
          act: (cubit) async => await cubit.fetchCoins(),
          expect: () => <dynamic>[
                CoinsState(status: CoinsStatus.loading),
                isA<CoinsState>()
                    .having((s) => s.status, 'status', CoinsStatus.success)
                    .having(
                        (s) => s.period, 'period', PercentagePeriod.period_24h)
              ]);
    });

    group('refreshCoins', () {
      blocTest<CoinsCubit, CoinsState>(
          'emits nothing when status is not success',
          build: () => coinsCubit,
          act: (cubit) => cubit.refreshCoins(),
          expect: () => <CoinsState>[],
          verify: (_) {
            verifyNever(() => coinMarketApiClient.getCoins());
          });

      blocTest<CoinsCubit, CoinsState>('invokes getCoins()',
          build: () => coinsCubit,
          seed: () => CoinsState(
              status: CoinsStatus.success,
              period: PercentagePeriod.period_24h,
              coins: []),
          act: (cubit) => cubit.refreshCoins(),
          verify: (_) {
            verify(() => coinMarketApiClient.getCoins()).called(1);
          });

      blocTest<CoinsCubit, CoinsState>(
        'emits nothing when Exception is thrown.',
        build: () {
          when(() => coinMarketApiClient.getCoins())
              .thenThrow(Exception('Exception Thrown'));
          return coinsCubit;
        },
        seed: () => CoinsState(
            status: CoinsStatus.success,
            period: PercentagePeriod.period_24h,
            coins: []),
        act: (cubit) => cubit.refreshCoins(),
        expect: () => <CoinsState>[],
      );

//TODO fix test
      blocTest<CoinsCubit, CoinsState>(
        'emits updated coins list.',
        build: () {
          when(() => coinMarketApiClient.getCoins())
              .thenAnswer((_) => Future.value(coins));
          return coinsCubit;
        },
        seed: () => CoinsState(
            status: CoinsStatus.success,
            period: PercentagePeriod.period_24h,
            coins: [
              Coin(
                  cmcRank: 1,
                  name: 'Bitcoin',
                  symbol: coins_Repository.CoinSymbol.BTC,
                  price: 2000,
                  percentage1h: 1,
                  percentage24h: 2,
                  percentage30d: 3,
                  percentage60d: 4,
                  percentage7d: 5,
                  percentage90d: 6,
                  percentageToShow: '24h change: 2%')
            ]),
        act: (cubit) => cubit.refreshCoins(),
        expect: () => <Matcher>[
          isA<CoinsState>()
              .having((state) => state.status, 'status', CoinsStatus.loading),
          isA<CoinsState>()
              .having((s) => s.status, 'status', CoinsStatus.success)
              .having((s) => s.period, 'period', PercentagePeriod.period_24h)
        ],
      );
    });

    group('changePeriod', () {
      blocTest<CoinsCubit, CoinsState>(
          'emits State with period of PercentagePeriod.period_30d',
          build: () => coinsCubit,
          act: (cubit) => cubit.changePeriod(PercentagePeriod.period_30d),
          expect: () => <dynamic>[
                isA<CoinsState>().having(
                    (s) => s.period, 'period', PercentagePeriod.period_30d)
              ]);
    });
  });
}
