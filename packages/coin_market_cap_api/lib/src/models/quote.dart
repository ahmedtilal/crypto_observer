import 'package:json_annotation/json_annotation.dart';
import 'currency.dart';
part 'quote.g.dart';

@JsonSerializable(explicitToJson: true)
class Quote {
  Quote({required this.gbp});

  @JsonKey(name: 'GBP')
  final Currency gbp;

  factory Quote.fromJson(Map<String, dynamic> json) => _$QuoteFromJson(json);
  Map<String, dynamic> toJson() => _$QuoteToJson(this);
}
