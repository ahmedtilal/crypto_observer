import 'package:json_annotation/json_annotation.dart';

part 'currency.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Currency {
  Currency(
      {required this.price,
      required this.percentChange_1h,
      required this.percentChange_24h,
      required this.percentChange_30d,
      required this.percentChange_60d,
      required this.percentChange_7d,
      required this.percentChange_90d});

  final double? price;
  final double? percentChange_1h;
  final double? percentChange_24h;
  final double? percentChange_7d;
  final double? percentChange_30d;
  final double? percentChange_60d;
  final double? percentChange_90d;

  factory Currency.fromJson(Map<String, dynamic>? json) =>
      _$CurrencyFromJson(json!);

  Map<String, dynamic> toJson() => _$CurrencyToJson(this);
}
