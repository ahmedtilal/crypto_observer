import 'package:coin_market_cap_api/coin_market_cap_api.dart';
import 'package:test/test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:http/http.dart' as http;

class MockHttpClient extends Mock implements http.Client {}

class MockResponse extends Mock implements http.Response {}

class FakeUri extends Fake implements Uri {}

void main() {
  group('CoinMarketApiClient', () {
    late http.Client httpClient;
    late CoinMarketApiClient coinMarketApiClient;

    setUpAll(() {
      registerFallbackValue<Uri>(FakeUri());
    });

    setUp(() {
      httpClient = MockHttpClient();
      coinMarketApiClient = CoinMarketApiClient(httpClient: httpClient);
    });

    group('constructor', () {
      test('does not require an httpClient', () {
        expect(CoinMarketApiClient(), isNotNull);
      });
    });

    group('getCoins', () {
      const _mainUrl =
          'https://pro-api.coinmarketcap.com/v1/cryptocurrency/listings/latest?';
      test('makes correct http request', () async {
        final response = MockResponse();
        when(() => response.statusCode).thenReturn(200);
        when(() => response.body).thenReturn('[]');
        when(() => httpClient.get(any())).thenAnswer((_) async => response);
        try {
          await coinMarketApiClient.getCoins();
        } catch (_) {}
        verify(
          () => httpClient.get(
            Uri.parse(
                '${_mainUrl}CMC_PRO_API_KEY=f6fb5f25-5b44-42f1-85e3-eb905ff030e8&start=1&limit=15&convert=GBP'),
          ),
        ).called(1);
      });

      test('throws CoinsDataFetchingError on non-200 response', () async {
        final response = MockResponse();
        when(() => response.statusCode).thenReturn(400);
        when(() => response.body).thenReturn('[]');
        when(() => httpClient.get(any())).thenAnswer((_) async => response);
        await expectLater(
          coinMarketApiClient.getCoins(),
          throwsA(isA<CoinsDataFetchingError>()),
        );
      });

      test('throws CoinsReturnedEmptyFailure on empty response', () async {
        final response = MockResponse();
        when(() => response.statusCode).thenReturn(200);
        when(() => response.body).thenReturn('{}');
        when(() => httpClient.get(any())).thenAnswer((_) async => response);
        expect(
          () async => await coinMarketApiClient.getCoins(),
          throwsA(isA<CoinsReturnedEmptyFailure>()),
        );
      });

      test('throws CoinsReturnedEmptyFailure on empty data', () async {
        final response = MockResponse();
        when(() => response.statusCode).thenReturn(200);
        when(() => response.body).thenReturn('{"data": []}');
        when(() => httpClient.get(any())).thenAnswer((_) async => response);
        expect(
          () async => await coinMarketApiClient.getCoins(),
          throwsA(isA<CoinsReturnedEmptyFailure>()),
        );
      });

      test('returns coins on valid response', () async {
        final response = MockResponse();
        when(() => response.statusCode).thenReturn(200);
        when(() => response.body).thenReturn('''
          {
"status": {
"timestamp": "2021-07-07T14:26:11.411Z",
"error_code": 0,
"error_message": null,
"elapsed": 18,
"credit_count": 1,
"notice": null,
"total_count": 5563
},
"data": [
{
"id": 1,
"name": "Bitcoin",
"symbol": "BTC",
"slug": "bitcoin",
"num_market_pairs": 9151,
"date_added": "2013-04-28T00:00:00.000Z",
"tags": [
"mineable",
"pow",
"sha-256",
"store-of-value",
"state-channels",
"coinbase-ventures-portfolio",
"three-arrows-capital-portfolio",
"polychain-capital-portfolio",
"binance-labs-portfolio",
"arrington-xrp-capital",
"blockchain-capital-portfolio",
"boostvc-portfolio",
"cms-holdings-portfolio",
"dcg-portfolio",
"dragonfly-capital-portfolio",
"electric-capital-portfolio",
"fabric-ventures-portfolio",
"framework-ventures",
"galaxy-digital-portfolio",
"huobi-capital",
"alameda-research-portfolio",
"a16z-portfolio",
"1confirmation-portfolio",
"winklevoss-capital",
"usv-portfolio",
"placeholder-ventures-portfolio",
"pantera-capital-portfolio",
"multicoin-capital-portfolio",
"paradigm-xzy-screener"
],
"max_supply": 21000000,
"circulating_supply": 18750206,
"total_supply": 18750206,
"platform": null,
"cmc_rank": 1,
"last_updated": "2021-07-07T14:25:02.000Z",
"quote": {
"GBP": {
"price": 25264.492765858893,
"volume_24h": 19309317334.51292,
"percent_change_1h": 0.17916521,
"percent_change_24h": 1.79733951,
"percent_change_7d": -1.7241034,
"percent_change_30d": -3.50451188,
"percent_change_60d": -40.79721301,
"percent_change_90d": -39.7985328,
"market_cap": 473714443845.36395,
"last_updated": "2021-07-07T14:25:28.000Z"
}
}
},
{
"id": 1027,
"name": "Ethereum",
"symbol": "ETH",
"slug": "ethereum",
"num_market_pairs": 5924,
"date_added": "2015-08-07T00:00:00.000Z",
"tags": [
"mineable",
"pow",
"smart-contracts",
"ethereum",
"coinbase-ventures-portfolio",
"three-arrows-capital-portfolio",
"polychain-capital-portfolio",
"binance-labs-portfolio",
"arrington-xrp-capital",
"blockchain-capital-portfolio",
"boostvc-portfolio",
"cms-holdings-portfolio",
"dcg-portfolio",
"dragonfly-capital-portfolio",
"electric-capital-portfolio",
"fabric-ventures-portfolio",
"framework-ventures",
"hashkey-capital-portfolio",
"kinetic-capital",
"huobi-capital",
"alameda-research-portfolio",
"a16z-portfolio",
"1confirmation-portfolio",
"winklevoss-capital",
"usv-portfolio",
"placeholder-ventures-portfolio",
"pantera-capital-portfolio",
"multicoin-capital-portfolio",
"paradigm-xzy-screener"
],
"max_supply": null,
"circulating_supply": 116596400.249,
"total_supply": 116596400.249,
"platform": null,
"cmc_rank": 2,
"last_updated": "2021-07-07T14:25:02.000Z",
"quote": {
"GBP": {
"price": 1730.4357407786863,
"volume_24h": 16978249384.179857,
"percent_change_1h": 0.21264809,
"percent_change_24h": 3.36484741,
"percent_change_7d": 9.21643137,
"percent_change_30d": -14.28687034,
"percent_change_60d": -34.75391959,
"percent_change_90d": 16.41378492,
"market_cap": 201762578237.00653,
"last_updated": "2021-07-07T14:25:28.000Z"
}
}
},
{
"id": 825,
"name": "Tether",
"symbol": "USDT",
"slug": "tether",
"num_market_pairs": 13753,
"date_added": "2015-02-25T00:00:00.000Z",
"tags": [
"payments",
"stablecoin",
"stablecoin-asset-backed",
"solana-ecosystem"
],
"max_supply": null,
"circulating_supply": 62328222787.33169,
"total_supply": 64469767616.826355,
"platform": {
"id": 1027,
"name": "Ethereum",
"symbol": "ETH",
"slug": "ethereum",
"token_address": "0xdac17f958d2ee523a2206206994597c13d831ec7"
},
"cmc_rank": 3,
"last_updated": "2021-07-07T14:24:13.000Z",
"quote": {
"GBP": {
"price": 0.72582116461764,
"volume_24h": 37537414280.06496,
"percent_change_1h": -0.13213454,
"percent_change_24h": -0.49512881,
"percent_change_7d": -2.40300084,
"percent_change_30d": -0.06365238,
"percent_change_60d": 0.00213242,
"percent_change_90d": -0.0881216,
"market_cap": 45239143252.04881,
"last_updated": "2021-07-07T14:25:28.000Z"
}
}
}
]
}
        ''');
        when(() => httpClient.get(any())).thenAnswer((_) async => response);
        final actual = await coinMarketApiClient.getCoins();
        expect(
            actual,
            isA<List<Coin>>()
                .having((coins) => coins[0].name, 'name', 'Bitcoin')
                .having((coins) => coins[0].symbol, 'symbol', CoinSymbol.BTC)
                .having((coins) => coins[0].cmcRank, 'cmcRank', 1)
                .having((coins) => coins[0].quote!.gbp!.price, 'price',
                    25264.492765858893)
                .having((coins) => coins[0].quote!.gbp!.percentChange_24h,
                    'percentChange_24h', 1.79733951));
      });
    });
  });
}
