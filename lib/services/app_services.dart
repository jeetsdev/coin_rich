import 'package:coin_rich/models/coin_data.dart';
import 'package:coin_rich/utils/request.dart';
import 'package:flutter/widgets.dart';

class AppServices {
  Future<dynamic> getCoinData() async {
    try {
      dynamic response = await Requests.getData(
          "https://pro-api.coinmarketcap.com/v1/cryptocurrency/quotes/latest?symbol=ADA,BTC,ATOM,BCH,BNB");
      CoinData data = CoinData.fromJson(response.data);
      return data;
    } catch (e) {
      debugPrint(e.toString());
      throw "Something went wrong";
    }
  }

  Future<dynamic> getCoinDataByQuery(String query) async {
    try {
      dynamic response = await Requests.getData(
          "https://pro-api.coinmarketcap.com/v1/cryptocurrency/quotes/latest?symbol=$query");
      CoinData data = CoinData.fromJson(response.data);
      return data;
    } catch (e) {
      debugPrint(e.toString());
      throw "Something went wrong";
    }
  }
}
