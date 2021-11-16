import 'package:commodore/data_cache.dart';
import 'package:commodore/model/user.dart';
import 'package:commodore/view/other_widgets/stock_square.dart';
import 'package:flutter/material.dart';

class WorthPage extends StatefulWidget {
  const WorthPage({Key? key, required this.user}) : super(key: key);

  final User user;

  @override
  _WorthPageState createState() => _WorthPageState();
}

class _WorthPageState extends State<WorthPage> {
  @override
  Widget build(BuildContext context) {
    DataCache _cache = DataCache.getInstance();

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.user.name),
        centerTitle: true,
        backgroundColor: widget.user.color,
      ),
      body: Column(
        children: <Widget>[

          const SizedBox(height: 25),

          //Each StockSquare plus it's value is in a row
          for(int i = 0; i< _cache.allUsers.length; i ++)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  StockSquare(
                    user: _cache.allUsers[i],
                    amount: widget.user.stocks[_cache.allUsers[i]]!,
                  ),
                  SizedBox(
                    height: 60,
                    width: 60,
                    child: Center(
                      child: Text(
                        "\$" + _cache.allUsers[i].stockWorth.toString(),
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
              "CASH: \$" + widget.user.cashToString(),
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 35,
              )
          ),

          const SizedBox(height:25),

          Text(
              "NET WORTH: \$" + widget.user.worthToString(),
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 35,
              )
          ),


        ],
      ),
    );
  }
}

/*

*/