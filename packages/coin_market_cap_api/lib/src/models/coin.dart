import 'package:json_annotation/json_annotation.dart';
import 'quote.dart';

part 'coin.g.dart';

enum CoinSymbol {
  @JsonValue('BTC')
  BTC,
  @JsonValue('ETH')
  ETH,
  @JsonValue('USDT')
  USDT,
  @JsonValue('BNB')
  BNB,
  @JsonValue('ADA')
  ADA,
  @JsonValue('DOGE')
  DOGE,
  @JsonValue('XRP')
  XRP,
  @JsonValue('USDC')
  USDC,
  @JsonValue('DOT')
  DOT,
  @JsonValue('UNI')
  UNI,
  @JsonValue('BUSD')
  BUSD,
  @JsonValue('BCH')
  BCH,
  @JsonValue('LTC')
  LTC,
  @JsonValue('SOL')
  SOL,
  @JsonValue('LINK')
  LINK,
  @JsonValue('MATIC')
  MATIC,
  @JsonValue('ETC')
  ETC,
  @JsonValue('WBTC')
  WBTC,
  @JsonValue('THETA')
  THETA,
  @JsonValue('ICP')
  ICP,
}

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class Coin {
  Coin(
      {required this.name,
      required this.symbol,
      required this.cmcRank,
      required this.quote});

  final String? name;
  final CoinSymbol? symbol;
  final int? cmcRank;
  final Quote? quote;

  factory Coin.fromJson(Map<String, dynamic>? json) => _$CoinFromJson(json!);
}
