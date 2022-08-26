class Data {
  String? id;
  String? symbol;
  String? name;
  String? image;
  String? currentPrice;
  String? marketCap;
  String? marketCapRank;
  String? high24;
  String? low24;
  String? pricechange24;
  String? priceChangePercentage24;
  String? ciculatingSupply;
  String? ath;
  String? at1;

  Data({
    required this.id,
    required this.symbol,
    required this.name,
    required this.image,
    required this.currentPrice,
    required this.marketCap,
    required this.marketCapRank,
    required this.high24,
    required this.low24,
    required this.pricechange24,
    required this.priceChangePercentage24,
    required this.ciculatingSupply,
    required this.ath,
    required this.at1,
  });

  factory Data.fromJson(Map<String, dynamic> map) {
    return Data(
        id: map['id'],
        symbol: map['symbol'],
        name: map['name'],
        image: map['image'],
        currentPrice: map['current_price'],
        marketCap: map['market_cap'],
        marketCapRank: map['market_cap_rank'],
        high24: map['high_24h'],
        low24: map['low_24h'],
        pricechange24: map['price_change_24h'],
        priceChangePercentage24: map['price_change_percentage_24h'],
        ciculatingSupply: map['circuating_supply'],
        ath: map['ath'],
        at1: map['at1']);
  }
}
