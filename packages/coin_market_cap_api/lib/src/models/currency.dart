import 'package:json_annotation/json_annotation.dart';

part 'currency.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Currency {
  Currency(
      {required this.price,
      required this.percentageChange_1h,
      required this.percentageChange_24h,
      required this.percentageChange_30d,
      required this.percentageChange_60d,
      required this.percentageChange_7d,
      required this.percentageChange_90d});

  final double price;
  final double percentageChange_1h;
  final double percentageChange_24h;
  final double percentageChange_7d;
  final double percentageChange_30d;
  final double percentageChange_60d;
  final double percentageChange_90d;

  factory Currency.fromJson(Map<String, dynamic> json) =>
      _$CurrencyFromJson(json);

  Map<String, dynamic> toJson() => _$CurrencyToJson(this);
}
