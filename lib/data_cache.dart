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



  List<User> allUsers = [
    User(name: 'Jaden', color: Colors.blue, stockWorth: 10, cash: 100000),
    User(name: 'Easton', color: Colors.green, stockWorth: 35, cash: 10000),
    User(name: 'Haylee', color: Colors.red, stockWorth: 4, cash: 750000),
    User(name: 'Jimbo', color: Colors.orange, stockWorth: 5, cash: 400000)
  ];
  User player = User(name: 'Jaden', color: Colors.blue, stockWorth: 10, cash: 100000);

  void _initUsers() {
    Map<User, int> player0Stocks = {
      allUsers[0] : 8,
      allUsers[1] : 1,
      allUsers[2] : 0,
      allUsers[3] : 1,
    };
    allUsers[0].setStocks(player0Stocks);

    Map<User, int> player1Stocks = {
      allUsers[0] : 1,
      allUsers[1] : 9,
      allUsers[2] : 0,
      allUsers[3] : 0,
    };
    allUsers[1].setStocks(player1Stocks);

    Map<User, int> player2Stocks = {
      allUsers[0] : 1,
      allUsers[1] : 0,
      allUsers[2] : 6,
      allUsers[3] : 4,
    };
    allUsers[2].setStocks(player2Stocks);

    Map<User, int> player3Stocks = {
      allUsers[0] : 0,
      allUsers[1] : 0,
      allUsers[2] : 4,
      allUsers[3] : 5,
    };
    allUsers[3].setStocks(player3Stocks);
  }


}