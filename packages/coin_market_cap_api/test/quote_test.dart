import 'package:test/test.dart';
import 'package:coin_market_cap_api/coin_market_cap_api.dart';

void main() {
  group('Quote', () {
    group('fromJson', () {
      test('returns Quote.gbp.percentChange_1h = 15', () {
        expect(
            Quote.fromJson(<String, dynamic>{
              "GBP": {
                'price': 2000,
                'percent_change_1h': 15,
                'percent_change_24h': 3,
                'percent_change_7d': 4,
                'percent_change_30d': 5,
                'percent_change_60d': 6,
                'percent_change_90d': 7,
              }
            }),
            isA<Quote>().having(
                (q) => q.gbp!.percentChange_1h, 'percentage_change_1h', 15));
      });
    });
  });
}
