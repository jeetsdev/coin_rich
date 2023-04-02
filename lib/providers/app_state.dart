import 'package:coin_rich/models/coin_data.dart';
import 'package:coin_rich/services/app_services.dart';
import 'package:flutter/material.dart';

class AppState extends ChangeNotifier {
  CoinData? coinData;
  bool isLoading = true;
  bool isError = false;

  getCoinDataHandler() async {
    isLoading = true;
    notifyListeners();
    try {
      final data = await AppServices().getCoinData();
      print(data);
      coinData = data;
      notifyListeners();
      isLoading = false;
      notifyListeners();
    } catch (e) {
      isLoading = false;
      isError = true;
      notifyListeners();
    }
  }
}
