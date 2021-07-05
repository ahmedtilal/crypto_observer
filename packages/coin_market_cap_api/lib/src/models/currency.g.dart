// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'currency.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Currency _$CurrencyFromJson(Map<String, dynamic> json) {
  return Currency(
    price: (json['price'] as num?)?.toDouble(),
    percentChange_1h: (json['percent_change_1h'] as num?)?.toDouble(),
    percentChange_24h: (json['percent_change_24h'] as num?)?.toDouble(),
    percentChange_30d: (json['percent_change_30d'] as num?)?.toDouble(),
    percentChange_60d: (json['percent_change_60d'] as num?)?.toDouble(),
    percentChange_7d: (json['percent_change_7d'] as num?)?.toDouble(),
    percentChange_90d: (json['percent_change_90d'] as num?)?.toDouble(),
  );
}

Map<String, dynamic> _$CurrencyToJson(Currency instance) => <String, dynamic>{
      'price': instance.price,
      'percent_change_1h': instance.percentChange_1h,
      'percent_change_24h': instance.percentChange_24h,
      'percent_change_7d': instance.percentChange_7d,
      'percent_change_30d': instance.percentChange_30d,
      'percent_change_60d': instance.percentChange_60d,
      'percent_change_90d': instance.percentChange_90d,
    };
