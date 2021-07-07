import 'package:coin_market_cap_api/coin_market_cap_api.dart';
import 'package:test/test.dart';

void main() {
  group('Coin', () {
    group('fromJson', () {
      test('returns CoinSymbol.unknown' 'for unsupported coin symbols', () {
        expect(
            Coin.fromJson(<String, dynamic>{
              "id": 8916,
              "name": "Internet Computer",
              "symbol": "JFK",
              "slug": "internet-computer",
              "num_market_pairs": 36,
              "date_added": "2021-03-23T00:00:00.000Z",
              "tags": [
                "platform",
                "distributed-computing",
                "polychain-capital-portfolio",
                "exnetwork-capital-portfolio"
              ],
              "max_supply": null,
              "circulating_supply": 136899213.55,
              "total_supply": 470967297.7829494,
              "platform": null,
              "cmc_rank": 18,
              "last_updated": "2021-07-07T11:17:10.000Z",
              "quote": {
                "GBP": {
                  "price": 33.93199038119974,
                  "volume_24h": 139013712.301878,
                  "percent_change_1h": 1.0735028,
                  "percent_change_24h": 2.8349708,
                  "percent_change_7d": -5.49989053,
                  "percent_change_30d": -55.51472678,
                  "percent_change_60d": null,
                  "percent_change_90d": null,
                  "market_cap": 4645262797.37241,
                  "last_updated": "2021-07-07T11:18:24.000Z"
                }
              }
            }),
            isA<Coin>().having(
              (c) => c.symbol,
              'symbol',
              CoinSymbol.unknown,
            ));
      });
    });
  });
}
