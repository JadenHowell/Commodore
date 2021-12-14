import 'package:commodore/data_cache.dart';
import 'package:commodore/model/user.dart';
import 'package:commodore/view/other_widgets/stock_square.dart';
import 'package:flutter/material.dart';

class WorthPage extends StatefulWidget {
  const WorthPage({Key? key, required this.userIndex}) : super(key: key);

  final int userIndex;

  @override
  _WorthPageState createState() => _WorthPageState();
}

class _WorthPageState extends CommodoreState<WorthPage> {

  final DataCache _cache = DataCache.getInstance();
  late List<User> _allUsers;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_allUsers[widget.userIndex].name),
        centerTitle: true,
        backgroundColor: _allUsers[widget.userIndex].color,
      ),
      body: Column(
        children: <Widget>[

          const SizedBox(height: 25),

          const Text(
              "Stocks:",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 35,
              )
          ),


          //Each StockSquare plus it's value is in a row
          for(int i = 0; i< _allUsers.length; i ++)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 60,
                    width: 100,
                    child: Center(
                      child: Text(
                          _allUsers[i].name + ":",
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 28,
                          )
                      ),
                    ),
                  ),
                  StockSquare(
                    user: _allUsers[i],
                    amount: _allUsers[widget.userIndex].stocks[_allUsers[i]]!,
                  ),
                  SizedBox(
                    height: 60,
                    width: 100,
                    child: Center(
                      child: Text(
                        "\$" + (_allUsers[i].stockWorth * 10).toString() + "K",
                        style: const TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

          const SizedBox(height:25),

          Text(
              "CASH: \$" + _allUsers[widget.userIndex].cashToString(),
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 35,
              )
          ),

          const SizedBox(height:25),

          Text(
              "NET WORTH: \$" + _allUsers[widget.userIndex].worthToString(),
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 35,
              )
          ),


        ],
      ),
    );
  }

  @override
  void notify() {
    setState(() {
      _allUsers = _cache.allUsers;
    });
  }
}

/*

*/