// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quote.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Quote _$QuoteFromJson(Map<String, dynamic> json) {
  return Quote(
    gbp: Currency.fromJson(json['GBP'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$QuoteToJson(Quote instance) => <String, dynamic>{
      'GBP': instance.gbp.toJson(),
    };
