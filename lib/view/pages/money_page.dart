import 'package:commodore/data_cache.dart';
import 'package:commodore/themes/color_values.dart';
import 'package:commodore/view/other_widgets/minus_button.dart';
import 'package:commodore/view/other_widgets/plus_button.dart';
import 'package:flutter/material.dart';

class MoneyPage extends StatefulWidget {
  const MoneyPage({Key? key}) : super(key: key);

  @override
  _MoneyPageState createState() => _MoneyPageState();
}

class _MoneyPageState extends State<MoneyPage> {
  @override
  Widget build(BuildContext context) {
    DataCache _cache = DataCache.getInstance();
    return Scaffold(
      appBar: AppBar(
        title: const Text("MONEY"),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget> [
          const SizedBox(height:25),

          Center(
            child: Text(
                "CASH: \$" + _cache.player.cashToString(),
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 35,
                )
            ),
          ),

          const SizedBox(height: 25,),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget> [
                _displayBox("\$10K"),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: PlusButton(callback: () => {}),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: MinusButton(callback: () => {}),
                )
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget> [
                _displayBox("\$50K"),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: PlusButton(callback: () => {}),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: MinusButton(callback: () => {}),
                )
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget> [
                _displayBox("\$100K"),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: PlusButton(callback: () => {}),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: MinusButton(callback: () => {}),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _displayBox(String display){
    return DecoratedBox(
      decoration: _displayBoxDecoration,
      child: SizedBox(
        height: 125,
        width: 150,
        child: Center(
          child: Text(
            display,
            style: _displayStyle,
          ),
        ),
      ),
    );
  }

  final TextStyle _displayStyle = const TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 40,
  );

  final BoxDecoration _displayBoxDecoration = BoxDecoration(
    border: Border.all(color: Colors.transparent),
    borderRadius: const BorderRadius.all(Radius.circular(10)),
    color: ColorValues.textEntryColor,
  );

}
