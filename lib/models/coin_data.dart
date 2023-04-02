// To parse this JSON data, do
//
//     final coinData = coinDataFromJson(jsonString);

import 'dart:convert';

CoinData coinDataFromJson(String str) => CoinData.fromJson(json.decode(str));

String coinDataToJson(CoinData data) => json.encode(data.toJson());

class CoinData {
  CoinData({
    required this.status,
    required this.data,
  });

  Status status;
  Map<String, Datum> data;

  CoinData copyWith({
    required Status status,
    required Map<String, Datum> data,
  }) =>
      CoinData(
        status: status,
        data: data,
      );

  factory CoinData.fromJson(Map<String, dynamic> json) => CoinData(
        status: Status.fromJson(json["status"]),
        data: Map.from(json["data"])
            .map((k, v) => MapEntry<String, Datum>(k, Datum.fromJson(v))),
      );

  Map<String, dynamic> toJson() => {
        "status": status.toJson(),
        "data": Map.from(data)
            .map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
      };
}

class Datum {
  Datum({
    required this.id,
    required this.name,
    required this.symbol,
    required this.slug,
    required this.numMarketPairs,
    required this.dateAdded,
    required this.tags,
    required this.maxSupply,
    required this.circulatingSupply,
    required this.totalSupply,
    required this.isActive,
    required this.platform,
    required this.cmcRank,
    required this.isFiat,
    required this.selfReportedCirculatingSupply,
    required this.selfReportedMarketCap,
    required this.tvlRatio,
    required this.lastUpdated,
    required this.quote,
  });

  int id;
  String name;
  String symbol;
  String slug;
  int numMarketPairs;
  DateTime dateAdded;
  List<String> tags;
  int maxSupply;
  double circulatingSupply;
  double totalSupply;
  int isActive;
  dynamic platform;
  int cmcRank;
  int isFiat;
  dynamic selfReportedCirculatingSupply;
  dynamic selfReportedMarketCap;
  dynamic tvlRatio;
  DateTime lastUpdated;
  Quote quote;

  Datum copyWith({
    required int id,
    required String name,
    required String symbol,
    required String slug,
    required int numMarketPairs,
    required DateTime dateAdded,
    required List<String> tags,
    int? maxSupply,
    required double circulatingSupply,
    required double totalSupply,
    required int isActive,
    required dynamic platform,
    required int cmcRank,
    required int isFiat,
    required dynamic selfReportedCirculatingSupply,
    required dynamic selfReportedMarketCap,
    required dynamic tvlRatio,
    required DateTime lastUpdated,
    required Quote quote,
  }) =>
      Datum(
        id: id,
        name: name,
        symbol: symbol,
        slug: slug,
        numMarketPairs: numMarketPairs,
        dateAdded: dateAdded,
        tags: tags,
        maxSupply: maxSupply ?? 0,
        circulatingSupply: circulatingSupply,
        totalSupply: totalSupply,
        isActive: isActive,
        platform: platform,
        cmcRank: cmcRank,
        isFiat: isFiat,
        selfReportedCirculatingSupply: selfReportedCirculatingSupply,
        selfReportedMarketCap: selfReportedMarketCap,
        tvlRatio: tvlRatio,
        lastUpdated: lastUpdated,
        quote: quote,
      );

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        name: json["name"],
        symbol: json["symbol"],
        slug: json["slug"],
        numMarketPairs: json["num_market_pairs"],
        dateAdded: DateTime.parse(json["date_added"]),
        tags: List<String>.from(json["tags"].map((x) => x)),
        maxSupply: json["max_supply"] ?? 0,
        circulatingSupply: json["circulating_supply"]?.toDouble(),
        totalSupply: json["total_supply"]?.toDouble(),
        isActive: json["is_active"],
        platform: json["platform"],
        cmcRank: json["cmc_rank"],
        isFiat: json["is_fiat"],
        selfReportedCirculatingSupply: json["self_reported_circulating_supply"],
        selfReportedMarketCap: json["self_reported_market_cap"],
        tvlRatio: json["tvl_ratio"],
        lastUpdated: DateTime.parse(json["last_updated"]),
        quote: Quote.fromJson(json["quote"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "symbol": symbol,
        "slug": slug,
        "num_market_pairs": numMarketPairs,
        "date_added": dateAdded.toIso8601String(),
        "tags": List<dynamic>.from(tags.map((x) => x)),
        "max_supply": maxSupply,
        "circulating_supply": circulatingSupply,
        "total_supply": totalSupply,
        "is_active": isActive,
        "platform": platform,
        "cmc_rank": cmcRank,
        "is_fiat": isFiat,
        "self_reported_circulating_supply": selfReportedCirculatingSupply,
        "self_reported_market_cap": selfReportedMarketCap,
        "tvl_ratio": tvlRatio,
        "last_updated": lastUpdated.toIso8601String(),
        "quote": quote.toJson(),
      };
}

class Quote {
  Quote({
    required this.usd,
  });

  Usd usd;

  Quote copyWith({
    required Usd usd,
  }) =>
      Quote(
        usd: usd,
      );

  factory Quote.fromJson(Map<String, dynamic> json) => Quote(
        usd: Usd.fromJson(json["USD"]),
      );

  Map<String, dynamic> toJson() => {
        "USD": usd.toJson(),
      };
}

class Usd {
  Usd({
    required this.price,
    required this.volume24H,
    required this.volumeChange24H,
    required this.percentChange1H,
    required this.percentChange24H,
    required this.percentChange7D,
    required this.percentChange30D,
    required this.percentChange60D,
    required this.percentChange90D,
    required this.marketCap,
    required this.marketCapDominance,
    required this.fullyDilutedMarketCap,
    required this.tvl,
    required this.lastUpdated,
  });

  double price;
  double volume24H;
  double volumeChange24H;
  double percentChange1H;
  double percentChange24H;
  double percentChange7D;
  double percentChange30D;
  double percentChange60D;
  double percentChange90D;
  double marketCap;
  double marketCapDominance;
  double fullyDilutedMarketCap;
  dynamic tvl;
  DateTime lastUpdated;

  Usd copyWith({
    required double price,
    required double volume24H,
    required double volumeChange24H,
    required double percentChange1H,
    required double percentChange24H,
    required double percentChange7D,
    required double percentChange30D,
    required double percentChange60D,
    required double percentChange90D,
    required double marketCap,
    required double marketCapDominance,
    required double fullyDilutedMarketCap,
    required dynamic tvl,
    required DateTime lastUpdated,
  }) =>
      Usd(
        price: price,
        volume24H: volume24H,
        volumeChange24H: volumeChange24H,
        percentChange1H: percentChange1H,
        percentChange24H: percentChange24H,
        percentChange7D: percentChange7D,
        percentChange30D: percentChange30D,
        percentChange60D: percentChange60D,
        percentChange90D: percentChange90D,
        marketCap: marketCap,
        marketCapDominance: marketCapDominance,
        fullyDilutedMarketCap: fullyDilutedMarketCap,
        tvl: tvl,
        lastUpdated: lastUpdated,
      );

  factory Usd.fromJson(Map<String, dynamic> json) => Usd(
        price: json["price"]?.toDouble(),
        volume24H: json["volume_24h"]?.toDouble(),
        volumeChange24H: json["volume_change_24h"]?.toDouble(),
        percentChange1H: json["percent_change_1h"]?.toDouble(),
        percentChange24H: json["percent_change_24h"]?.toDouble(),
        percentChange7D: json["percent_change_7d"]?.toDouble(),
        percentChange30D: json["percent_change_30d"]?.toDouble(),
        percentChange60D: json["percent_change_60d"]?.toDouble(),
        percentChange90D: json["percent_change_90d"]?.toDouble(),
        marketCap: json["market_cap"]?.toDouble(),
        marketCapDominance: json["market_cap_dominance"]?.toDouble(),
        fullyDilutedMarketCap: json["fully_diluted_market_cap"]?.toDouble(),
        tvl: json["tvl"],
        lastUpdated: DateTime.parse(json["last_updated"]),
      );

  Map<String, dynamic> toJson() => {
        "price": price,
        "volume_24h": volume24H,
        "volume_change_24h": volumeChange24H,
        "percent_change_1h": percentChange1H,
        "percent_change_24h": percentChange24H,
        "percent_change_7d": percentChange7D,
        "percent_change_30d": percentChange30D,
        "percent_change_60d": percentChange60D,
        "percent_change_90d": percentChange90D,
        "market_cap": marketCap,
        "market_cap_dominance": marketCapDominance,
        "fully_diluted_market_cap": fullyDilutedMarketCap,
        "tvl": tvl,
        "last_updated": lastUpdated.toIso8601String(),
      };
}

class Status {
  Status({
    required this.timestamp,
    required this.errorCode,
    required this.errorMessage,
    required this.elapsed,
    required this.creditCount,
    required this.notice,
  });

  DateTime timestamp;
  int errorCode;
  dynamic errorMessage;
  int elapsed;
  int creditCount;
  dynamic notice;

  Status copyWith({
    required DateTime timestamp,
    required int errorCode,
    required dynamic errorMessage,
    required int elapsed,
    required int creditCount,
    required dynamic notice,
  }) =>
      Status(
        timestamp: timestamp,
        errorCode: errorCode,
        errorMessage: errorMessage,
        elapsed: elapsed,
        creditCount: creditCount,
        notice: notice,
      );

  factory Status.fromJson(Map<String, dynamic> json) => Status(
        timestamp: DateTime.parse(json["timestamp"]),
        errorCode: json["error_code"],
        errorMessage: json["error_message"],
        elapsed: json["elapsed"],
        creditCount: json["credit_count"],
        notice: json["notice"],
      );

  Map<String, dynamic> toJson() => {
        "timestamp": timestamp.toIso8601String(),
        "error_code": errorCode,
        "error_message": errorMessage,
        "elapsed": elapsed,
        "credit_count": creditCount,
        "notice": notice,
      };
}
