import 'package:flutter_test/flutter_test.dart';
import 'package:crypto_observer/coin/coins.dart';

void main() {
  group('CoinsStatusX', () {
    test('returns correct values for CoinsStatus.initial', () {
      const status = CoinsStatus.initial;
      expect(status.isInitial, isTrue);
      expect(status.isLoading, isFalse);
      expect(status.isSuccessful, isFalse);
      expect(status.isFailed, isFalse);
    });

    test('returns correct values for CoinsStatus.loading', () {
      const status = CoinsStatus.loading;
      expect(status.isInitial, isFalse);
      expect(status.isLoading, isTrue);
      expect(status.isSuccessful, isFalse);
      expect(status.isFailed, isFalse);
    });

    test('returns correct values for CoinsStatus.success', () {
      const status = CoinsStatus.success;
      expect(status.isInitial, isFalse);
      expect(status.isLoading, isFalse);
      expect(status.isSuccessful, isTrue);
      expect(status.isFailed, isFalse);
    });

    test('returns correct values for CoinsStatus.failure', () {
      const status = CoinsStatus.failure;
      expect(status.isInitial, isFalse);
      expect(status.isLoading, isFalse);
      expect(status.isSuccessful, isFalse);
      expect(status.isFailed, isTrue);
    });
  });
}
