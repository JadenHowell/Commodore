import 'package:flutter/material.dart';

class StocksPage extends StatefulWidget {
  const StocksPage({Key? key}) : super(key: key);

  @override
  _StocksPageState createState() => _StocksPageState();
}

class _StocksPageState extends State<StocksPage> {
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
}
