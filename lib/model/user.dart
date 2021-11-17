import 'package:flutter/material.dart';

import '../data_cache.dart';

class User{
  final String name;
  final Color color;
  late int _stockWorth;
  late int _cash;
  int get cash => _cash;
  late Map<User, int> stocks = {};

  User({required this.name, required this.color, stockWorth = 5, cash = 100000}) {
    _cash = cash;
    _stockWorth = stockWorth;
  }

  int get stockWorth => _stockWorth;

  void setStocks(Map<User, int> newStocks){
    stocks = newStocks;
    DataCache.getInstance().notifyObservers();
  }

  String worthToString(){
    int netWorth = 0;
    for(User stockUser in stocks.keys){
      netWorth += stocks[stockUser]! * stockUser.stockWorth * 10000;
    }
    netWorth += cash;

    String worthString;
    if(netWorth > 1000000){
      worthString = (netWorth / 1000000).toString() + "M";
    } else {
      worthString = (netWorth ~/ 1000).toString() + "K"; //toInt() allows us to remove decimal places if we still not over 1 mil
    }
    return worthString;
  }

  String cashToString() {
    String cashString;
    if(cash > 1000000){
      cashString = (cash / 1000000).toString() + "M";
    } else {
      cashString = (cash ~/ 1000).toString() + "K"; //toInt() allows us to remove decimal places if we still not over 1 mil
    }
    return cashString;
  }

  void addCash(int addedAmount){
    _cash += addedAmount;
    DataCache.getInstance().notifyObservers();
  }

  void subtractCash(int subtractedAmount){
    _cash -= subtractedAmount;
    DataCache.getInstance().notifyObservers();
  }

  void increaseStockWorth(){
    if(_stockWorth >= 80){
      return; //can't increase stock worth past 80
    } else if (_stockWorth <= 4){
      _stockWorth += 1;
    } else {
      _stockWorth += 5;
    }
    DataCache.getInstance().notifyObservers();
  }

  void decreaseStockWorth(){
    if(_stockWorth <= 0){
      return; //can't decrease below 0
    } if(_stockWorth <= 5){
      _stockWorth -= 1;
    } else {
      _stockWorth -= 5;
    }
    DataCache.getInstance().notifyObservers();
  }

}