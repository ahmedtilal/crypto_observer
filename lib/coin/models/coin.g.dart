// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coin.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Coin _$CoinFromJson(Map<String, dynamic> json) {
  return Coin(
    name: json['name'] as String,
    symbol: _$enumDecode(_$CoinSymbolEnumMap, json['symbol']),
    cmcRank: json['cmcRank'] as int,
    price: (json['price'] as num).toDouble(),
    percentage1h: (json['percentage1h'] as num).toDouble(),
    percentage24h: (json['percentage24h'] as num).toDouble(),
    percentage30d: (json['percentage30d'] as num).toDouble(),
    percentage60d: (json['percentage60d'] as num).toDouble(),
    percentage7d: (json['percentage7d'] as num).toDouble(),
    percentage90d: (json['percentage90d'] as num).toDouble(),
  );
}

Map<String, dynamic> _$CoinToJson(Coin instance) => <String, dynamic>{
      'name': instance.name,
      'symbol': _$CoinSymbolEnumMap[instance.symbol],
      'cmcRank': instance.cmcRank,
      'price': instance.price,
      'percentage1h': instance.percentage1h,
      'percentage24h': instance.percentage24h,
      'percentage7d': instance.percentage7d,
      'percentage30d': instance.percentage30d,
      'percentage60d': instance.percentage60d,
      'percentage90d': instance.percentage90d,
    };

K _$enumDecode<K, V>(
  Map<K, V> enumValues,
  Object? source, {
  K? unknownValue,
}) {
  if (source == null) {
    throw ArgumentError(
      'A value must be provided. Supported values: '
      '${enumValues.values.join(', ')}',
    );
  }

  return enumValues.entries.singleWhere(
    (e) => e.value == source,
    orElse: () {
      if (unknownValue == null) {
        throw ArgumentError(
          '`$source` is not one of the supported values: '
          '${enumValues.values.join(', ')}',
        );
      }
      return MapEntry(unknownValue, enumValues.values.first);
    },
  ).key;
}

const _$CoinSymbolEnumMap = {
  CoinSymbol.BTC: 'BTC',
  CoinSymbol.ETH: 'ETH',
  CoinSymbol.USDT: 'USDT',
  CoinSymbol.BNB: 'BNB',
  CoinSymbol.ADA: 'ADA',
  CoinSymbol.DOGE: 'DOGE',
  CoinSymbol.XRP: 'XRP',
  CoinSymbol.USDC: 'USDC',
  CoinSymbol.DOT: 'DOT',
  CoinSymbol.UNI: 'UNI',
  CoinSymbol.BUSD: 'BUSD',
  CoinSymbol.BCH: 'BCH',
  CoinSymbol.LTC: 'LTC',
  CoinSymbol.SOL: 'SOL',
  CoinSymbol.LINK: 'LINK',
  CoinSymbol.MATIC: 'MATIC',
  CoinSymbol.ETC: 'ETC',
  CoinSymbol.WBTC: 'WBTC',
  CoinSymbol.THETA: 'THETA',
  CoinSymbol.ICP: 'ICP',
};
