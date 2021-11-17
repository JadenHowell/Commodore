import 'package:flutter/material.dart';

import '../../data_cache.dart';

class StocksPage extends StatefulWidget {
  const StocksPage({Key? key}) : super(key: key);

  @override
  _StocksPageState createState() => _StocksPageState();
}

class _StocksPageState extends CommodoreState<StocksPage> {

  final DataCache _cache = DataCache.getInstance();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("STOCKS"),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget> [

        ],
      ),
    );
  }

  @override
  void notify() {
    // TODO: implement notify
  }
}
