import 'package:coin_market_cap_api/coin_market_cap_api.dart';
import 'package:test/test.dart';

void main() {
  group('Currency', () {
    group('fromJson', () {
      test('returns Currency.price = 2000', () {
        expect(
            Currency.fromJson(<String, dynamic>{
              'price': 2000,
              'percent_change_1h': 2,
              'percent_change_24h': 3,
              'percent_change_7d': 4,
              'percent_change_30d': 5,
              'percent_change_60d': 6,
              'percent_change_90d': 7,
            }),
            isA<Currency>().having((c) => c.price, 'price', 2000));
      });
    });
  });
}
