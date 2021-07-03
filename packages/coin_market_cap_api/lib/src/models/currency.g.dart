// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'currency.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Currency _$CurrencyFromJson(Map<String, dynamic> json) {
  return Currency(
    price: (json['price'] as num).toDouble(),
    percentageChange_1h: (json['percentage_change_1h'] as num).toDouble(),
    percentageChange_24h: (json['percentage_change_24h'] as num).toDouble(),
    percentageChange_30d: (json['percentage_change_30d'] as num).toDouble(),
    percentageChange_60d: (json['percentage_change_60d'] as num).toDouble(),
    percentageChange_7d: (json['percentage_change_7d'] as num).toDouble(),
    percentageChange_90d: (json['percentage_change_90d'] as num).toDouble(),
  );
}

Map<String, dynamic> _$CurrencyToJson(Currency instance) => <String, dynamic>{
      'price': instance.price,
      'percentage_change_1h': instance.percentageChange_1h,
      'percentage_change_24h': instance.percentageChange_24h,
      'percentage_change_7d': instance.percentageChange_7d,
      'percentage_change_30d': instance.percentageChange_30d,
      'percentage_change_60d': instance.percentageChange_60d,
      'percentage_change_90d': instance.percentageChange_90d,
    };
