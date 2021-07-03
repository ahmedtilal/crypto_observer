import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:coin_market_cap_api/coin_market_cap_api.dart' hide Coin;
import 'package:coin_market_cap_api/coin_market_cap_api.dart' as coins;

part 'coin.g.dart';

enum PercentagePeriod {
  period_1h,
  period_24h,
  period_7d,
  period_30d,
  period_60d,
  period_90d
}

@JsonSerializable()
class Coin extends Equatable {
  const Coin(
      {required this.name,
      required this.symbol,
      required this.cmcRank,
      required this.price,
      required this.percentage1h,
      required this.percentage24h,
      required this.percentage30d,
      required this.percentage60d,
      required this.percentage7d,
      required this.percentage90d,
      this.percentageToShow});

  factory Coin.fromJson(Map<String, dynamic> json) => _$CoinFromJson(json);

  factory Coin.fromRepository(coins.Coin coin) {
    return Coin(
        name: coin.name,
        symbol: coin.symbol,
        cmcRank: coin.cmcRank,
        price: coin.quote.gbp.price,
        percentage1h: coin.quote.gbp.percentageChange_1h,
        percentage24h: coin.quote.gbp.percentageChange_24h,
        percentage7d: coin.quote.gbp.percentageChange_7d,
        percentage30d: coin.quote.gbp.percentageChange_30d,
        percentage60d: coin.quote.gbp.percentageChange_60d,
        percentage90d: coin.quote.gbp.percentageChange_90d,
        percentageToShow: 'Empty');
  }

  final String name;
  final CoinSymbol symbol;
  final int cmcRank;
  final double price;
  final double percentage1h;
  final double percentage24h;
  final double percentage7d;
  final double percentage30d;
  final double percentage60d;
  final double percentage90d;
  @JsonKey(ignore: true)
  final String? percentageToShow;

  @override
  List<Object> get props => [
        name,
        symbol,
        cmcRank,
        price,
        percentage1h,
        percentage24h,
        percentage7d,
        percentage30d,
        percentage60d,
        percentage90d,
        percentageToShow!,
      ];

  Map<String, dynamic> toJson() => _$CoinToJson(this);

  Coin copyWith(
      {String? name,
      CoinSymbol? symbol,
      int? cmcRank,
      double? price,
      double? percentage1h,
      double? percentage24h,
      double? percentage7d,
      double? percentage30d,
      double? percentage60d,
      double? percentage90d,
      String? percentageToShow}) {
    return Coin(
        name: name ?? this.name,
        symbol: symbol ?? this.symbol,
        cmcRank: cmcRank ?? this.cmcRank,
        price: price ?? this.price,
        percentage1h: percentage1h ?? this.percentage1h,
        percentage24h: percentage24h ?? this.percentage24h,
        percentage7d: percentage7d ?? this.percentage7d,
        percentage30d: percentage30d ?? this.percentage30d,
        percentage60d: percentage60d ?? this.percentage60d,
        percentage90d: percentage90d ?? this.percentage90d,
        percentageToShow: percentageToShow ?? this.percentageToShow);
  }

  String toStringAsPercentage({double? decimal, String? period}) {
    String percentage = (decimal! * 100).toStringAsFixed(2);
    return "$period change: $percentage%";
  }

  Coin changePercentageToShow(Coin coin, PercentagePeriod period) {
    switch (period) {
      case PercentagePeriod.period_1h:
        return coin.copyWith(
            percentageToShow:
                toStringAsPercentage(decimal: coin.percentage1h, period: '1h'));

      case PercentagePeriod.period_24h:
        return coin.copyWith(
            percentageToShow:
                toStringAsPercentage(decimal: percentage24h, period: '24h'));

      case PercentagePeriod.period_7d:
        return coin.copyWith(
            percentageToShow:
                toStringAsPercentage(decimal: percentage7d, period: '7d'));

      case PercentagePeriod.period_30d:
        return coin.copyWith(
            percentageToShow:
                toStringAsPercentage(decimal: percentage30d, period: '30d'));

      case PercentagePeriod.period_60d:
        return coin.copyWith(
            percentageToShow:
                toStringAsPercentage(decimal: percentage60d, period: '60d'));

      case PercentagePeriod.period_90d:
        return coin.copyWith(
            percentageToShow:
                toStringAsPercentage(decimal: percentage90d, period: '90d'));
    }
  }
}
