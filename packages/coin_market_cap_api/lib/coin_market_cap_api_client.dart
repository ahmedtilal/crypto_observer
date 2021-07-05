import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:json_annotation/json_annotation.dart';
import 'package:http/http.dart' as http;
import 'coin_market_cap_api.dart';

part 'coin_market_cap_api_client.g.dart';

///Exception thrown if getCoins fails.
class CoinsDataFetchingError implements Exception {}

///Exception thrown if values returned are empty.
class CoinsReturnedEmptyFailure implements Exception {}

@JsonSerializable()
class CoinMarketApiClient {
  CoinMarketApiClient({http.Client? httpClient})
      : _httpClient = httpClient ?? http.Client();
  static const _mainUrl =
      'https://pro-api.coinmarketcap.com/v1/cryptocurrency/listings/latest?';
  final http.Client _httpClient;

  factory CoinMarketApiClient.fromJson(Map<String, dynamic> json) =>
      _$CoinMarketApiClientFromJson(json);

  Future<List<Coin>> getCoins() async {
    List<Coin> _coinsList = [];
    final coinsRequest = Uri.parse(
        '${_mainUrl}CMC_PRO_API_KEY=f6fb5f25-5b44-42f1-85e3-eb905ff030e8&start=1&limit=15&convert=GBP');
    final dynamic coinsResponse = await _httpClient.get(coinsRequest);

    if (coinsResponse.statusCode != 200) {
      throw CoinsDataFetchingError();
    }

    final jsonBody =
        await jsonDecode(coinsResponse.body) as Map<String, dynamic>;

    if (jsonBody.isEmpty) {
      throw CoinsReturnedEmptyFailure();
    }

    final coinsJson = jsonBody['data'];
    if (coinsJson.isEmpty) {
      throw CoinsReturnedEmptyFailure();
    }

    for (Map<String, dynamic> coin in coinsJson) {
      _coinsList.add(Coin.fromJson(coin));
    }
    return _coinsList;
  }

  Map<String, dynamic> toJson() => _$CoinMarketApiClientToJson(this);
}
