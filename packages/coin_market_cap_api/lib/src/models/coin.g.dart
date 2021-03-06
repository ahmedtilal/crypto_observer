// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coin.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Coin _$CoinFromJson(Map<String, dynamic> json) {
  return Coin(
    name: json['name'] as String?,
    symbol: _$enumDecodeNullable(_$CoinSymbolEnumMap, json['symbol'],
        unknownValue: CoinSymbol.unknown),
    cmcRank: json['cmc_rank'] as int?,
    quote: json['quote'] == null
        ? null
        : Quote.fromJson(json['quote'] as Map<String, dynamic>?),
  );
}

Map<String, dynamic> _$CoinToJson(Coin instance) => <String, dynamic>{
      'name': instance.name,
      'symbol': _$CoinSymbolEnumMap[instance.symbol],
      'cmc_rank': instance.cmcRank,
      'quote': instance.quote?.toJson(),
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

K? _$enumDecodeNullable<K, V>(
  Map<K, V> enumValues,
  dynamic source, {
  K? unknownValue,
}) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<K, V>(enumValues, source, unknownValue: unknownValue);
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
  CoinSymbol.unknown: 'unknown',
};
