part of 'coin_cubit.dart';

enum CoinsStatus { initial, loading, success, failure }

extension CoinStatusX on CoinsStatus {
  bool get isInitial => this == CoinsStatus.initial;
  bool get isLoading => this == CoinsStatus.loading;
  bool get isSuccessful => this == CoinsStatus.success;
  bool get isFailed => this == CoinsStatus.failure;
}

@JsonSerializable()
class CoinsState extends Equatable {
  CoinsState({
    this.status = CoinsStatus.initial,
    this.period = PercentagePeriod.period_24h,
    List<Coin>? coins,
  }) : coins = coins ?? List.empty();

  factory CoinsState.fromJson(Map<String, dynamic> json) =>
      _$CoinsStateFromJson(json);

  final CoinsStatus status;
  final List<Coin> coins;
  final PercentagePeriod period;

  CoinsState copyWith({
    CoinsStatus? status,
    PercentagePeriod? period,
    List<Coin>? coins,
  }) {
    return CoinsState(
        status: status ?? this.status,
        period: period ?? this.period,
        coins: coins ?? this.coins);
  }

  Map<String, dynamic> toJson() => _$CoinsStateToJson(this);

  @override
  List<Object?> get props => [status, period, coins];
}
