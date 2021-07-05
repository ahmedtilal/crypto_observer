// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coin_cubit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CoinsCubit _$CoinsCubitFromJson(Map<String, dynamic> json) {
  return CoinsCubit(
    CoinMarketApiClient.fromJson(
        json['coinsRepository'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$CoinsCubitToJson(CoinsCubit instance) =>
    <String, dynamic>{
      'coinsRepository': instance.coinsRepository,
    };

CoinsState _$CoinsStateFromJson(Map<String, dynamic> json) {
  return CoinsState(
    status: _$enumDecodeNullable(_$CoinsStatusEnumMap, json['status']),
    period: _$enumDecodeNullable(_$PercentagePeriodEnumMap, json['period']),
    coins: (json['coins'] as List<dynamic>?)
        ?.map((e) => Coin.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$CoinsStateToJson(CoinsState instance) =>
    <String, dynamic>{
      'status': _$CoinsStatusEnumMap[instance.status],
      'coins': instance.coins,
      'period': _$PercentagePeriodEnumMap[instance.period],
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

const _$CoinsStatusEnumMap = {
  CoinsStatus.initial: 'initial',
  CoinsStatus.loading: 'loading',
  CoinsStatus.success: 'success',
  CoinsStatus.failure: 'failure',
};

const _$PercentagePeriodEnumMap = {
  PercentagePeriod.period_1h: 'period_1h',
  PercentagePeriod.period_24h: 'period_24h',
  PercentagePeriod.period_7d: 'period_7d',
  PercentagePeriod.period_30d: 'period_30d',
  PercentagePeriod.period_60d: 'period_60d',
  PercentagePeriod.period_90d: 'period_90d',
};
