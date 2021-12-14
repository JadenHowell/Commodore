import 'package:commodore/model/user.dart';
import 'package:commodore/view/other_widgets/minus_button.dart';
import 'package:commodore/view/other_widgets/plus_button.dart';
import 'package:commodore/view/other_widgets/stock_square.dart';
import 'package:flutter/material.dart';

import '../../data_cache.dart';

class StocksPage extends StatefulWidget {
  const StocksPage({Key? key}) : super(key: key);

  @override
  _StocksPageState createState() => _StocksPageState();
}

class _StocksPageState extends CommodoreState<StocksPage> {

  final DataCache _cache = DataCache.getInstance();
  late Map<User, int> _market;
  late User _player;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: _cache.player.color,
        title: const Text("STOCKS"),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[

          Padding(
            padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
            child: Text(
              _cache.player.name + "'s Stock Value",
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget> [
              SizedBox(
                width: 100,
                child: ElevatedButton(
                    onPressed: () => {_player.decreaseStockWorth()},
                    child: const Text(
                      "-",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      ),
                    )
                ),
              ),
              const SizedBox(width: 25,),
              SizedBox(
                width: 100,
                child: ElevatedButton(
                    onPressed: () => {_player.increaseStockWorth()},
                    child: const Text(
                      "+",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      ),
                    )
                ),
              ),
            ],
          ),

          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
            child: Divider(
              thickness: 3,
            ),
          ),

          const Text(
              "Owned",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 35,
              )
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const <Widget> [
              Text(
                  "SELL",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 26,
                  )
              ),

              SizedBox(width: 170),

              Text(
                  "BUY",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 26,
                  )
              ),
            ],
          ),

          //Each StockSquare plus it's value is in a row
          for(User user in _player.stocks.keys)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 16, 30, 0),
                    child: MinusButton(callback: () => {_cache.sellStock(user)}),
                  ),
                  Column(
                    children: [
                      Text(user.name,
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          )),
                      StockSquare(
                      user: user,
                      amount: _player.stocks[user]!,
                      size: 50
                    ),]
                  ),
                  SizedBox(
                    height: 60,
                    width: 90,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(10, 24, 0, 0),
                      child: Text(
                        "\$" + (user.stockWorth*10).toString() + "k",
                        style: const TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 16, 10, 0),
                    child: PlusButton(callback: () => {_cache.buyStock(user)}),
                  ),
                ],
              ),
            ),

          const SizedBox(height:15),

          Text(
              "CASH: \$" + _player.cashToString(),
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 35,
              )
          ),

          const SizedBox(height:5,),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget> [
              const Text(
                  "MARKET:",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 26,
                  )
              ),

              for(User user in _market.keys)
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: StockSquare(
                    user: user,
                    amount: _market[user]!,
                    size: 50,
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  void notify() {
    setState(() {
      _market = _cache.stockMarket;
      _player = _cache.player;
    });
  }
}
