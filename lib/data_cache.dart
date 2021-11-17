import 'dart:core';

import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:commodore/model/user.dart';
import 'package:flutter/material.dart';

class DataCache{
  static DataCache? _instance;
  IO.Socket? _socket;

  DataCache._private();

  static _init(){
    _instance = DataCache._private();
    _instance!._initUsers();
  }

  static DataCache getInstance(){
    if (_instance == null){
      _init();
    }
    return _instance!;
  }

  IO.Socket? get socket => _socket;

  set socket(IO.Socket? value) {
    _socket = value;
  }


  late Map<User, int> _stockMarket;
  Map<User, int> get stockMarket => _stockMarket;

  final List<User> _allUsers = [
    User(name: 'Jaden', color: Colors.blue, stockWorth: 10, cash: 100000),
    User(name: 'Easton', color: Colors.green, stockWorth: 35, cash: 10000),
    User(name: 'Haylee', color: Colors.red, stockWorth: 4, cash: 750000),
    User(name: 'Jimbo', color: Colors.orange, stockWorth: 5, cash: 400000)
  ];
  late User player;

  List<User> get allUsers => _allUsers;

  void _initUsers() {
    Map<User, int> player0Stocks = {
      _allUsers[0] : 8,
      _allUsers[1] : 1,
      _allUsers[2] : 0,
      _allUsers[3] : 1,
    };
    _allUsers[0].setStocks(player0Stocks);

    Map<User, int> player1Stocks = {
      _allUsers[0] : 1,
      _allUsers[1] : 9,
      _allUsers[2] : 0,
      _allUsers[3] : 0,
    };
    _allUsers[1].setStocks(player1Stocks);

    Map<User, int> player2Stocks = {
      _allUsers[0] : 1,
      _allUsers[1] : 0,
      _allUsers[2] : 6,
      _allUsers[3] : 4,
    };
    _allUsers[2].setStocks(player2Stocks);

    Map<User, int> player3Stocks = {
      _allUsers[0] : 0,
      _allUsers[1] : 0,
      _allUsers[2] : 4,
      _allUsers[3] : 5,
    };
    _allUsers[3].setStocks(player3Stocks);

    _stockMarket = {
      _allUsers[0] : 0,
      _allUsers[1] : 0,
      _allUsers[2] : 0,
      _allUsers[3] : 0
    };

    player = _allUsers[0];
  }


  void sellStock(User userStockSold){
    if(player.stocks[userStockSold] == 0){
      return; //Can't sell what you don't own
    }
    player.stocks[userStockSold] = player.stocks[userStockSold]! - 1;
    _stockMarket[userStockSold] = _stockMarket[userStockSold]! + 1;
    player.addCash(10000 * userStockSold.stockWorth);
    notifyObservers();
  }

  void buyStock(User userStockBought){
    if(_stockMarket[userStockBought] == 0 || player.cash < (10000 * userStockBought.stockWorth)){
      return; //Can't buy whats not in the market and if you don't have money for it
    }
    player.stocks[userStockBought] = player.stocks[userStockBought]! + 1;
    _stockMarket[userStockBought] = _stockMarket[userStockBought]! - 1;
    player.subtractCash(10000 * userStockBought.stockWorth);
    notifyObservers();
  }

  final List<SocketObserver> _observers = [];

  void registerObserver(SocketObserver observer){
    _observers.add(observer);
  }

  void removeObserver(SocketObserver observer){
    _observers.remove(observer);
  }

  void notifyObservers(){
    for(SocketObserver observer in _observers){
      observer.notify();
    }
  }

}

abstract class SocketObserver {
  void notify();
}

abstract class CommodoreState<T extends StatefulWidget> extends State<T> implements SocketObserver {

  @override
  void initState() {
    super.initState();
    DataCache.getInstance().registerObserver(this);
    notify();
  }

  @override
  void dispose() {
    super.dispose();
    DataCache.getInstance().removeObserver(this);
  }

}