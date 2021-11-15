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
        children : <Widget>[
          for(int i = 0; i < _cache.allUsers.length; i ++)
            StockSquare(user: _cache.allUsers[i], amount: widget.user.stocks[_cache.allUsers[i]]!)
        ]
      ),
    );
  }
}
