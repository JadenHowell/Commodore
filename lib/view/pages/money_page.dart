import 'package:flutter/material.dart';

class MoneyPage extends StatefulWidget {
  const MoneyPage({Key? key}) : super(key: key);

  @override
  _MoneyPageState createState() => _MoneyPageState();
}

class _MoneyPageState extends State<MoneyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("MONEY"),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget> [

        ],
      ),
    );
  }
}
