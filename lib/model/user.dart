import 'package:flutter/material.dart';

class User{
  final String name;
  final Color color;
  int stockWorth;
  int cash;
  late Map<User, int> stocks = {};

  User({required this.name, required this.color, this.stockWorth = 5, this.cash = 100000});

  void setStocks(Map<User, int> newStocks){
    stocks = newStocks;
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
}