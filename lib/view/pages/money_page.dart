import 'package:commodore/data_cache.dart';
import 'package:commodore/model/user.dart';
import 'package:commodore/model/utils.dart';
import 'package:commodore/themes/color_values.dart';
import 'package:commodore/view/other_widgets/minus_button.dart';
import 'package:commodore/view/other_widgets/plus_button.dart';
import 'package:flutter/material.dart';

class MoneyPage extends StatefulWidget {
  const MoneyPage({Key? key}) : super(key: key);

  @override
  _MoneyPageState createState() => _MoneyPageState();
}

class _MoneyPageState extends CommodoreState<MoneyPage> {
  final DataCache _cache = DataCache.getInstance();
  late User _player;
  int tempAmount = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: _cache.player.color,
        title: const Text("MONEY"),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          const SizedBox(height: 25),
          Center(
            child: Text("CASH: \$" + _player.cashToString(),
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 35,
                )),
          ),
          const SizedBox(
            height: 25,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _displayBox("\$10K"),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: MinusButton(
                      callback: () => {updateTempAmount(-10000)}),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: PlusButton(callback: () => {updateTempAmount(10000)}),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _displayBox("\$50K"),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: MinusButton(
                      callback: () => {updateTempAmount(-50000)}),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: PlusButton(callback: () => {updateTempAmount(50000)}),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _displayBox("\$100K"),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: MinusButton(
                      callback: () => {updateTempAmount(-100000)}),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: PlusButton(callback: () => {updateTempAmount(100000)}),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(8,30,8,8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Text(
                    "\$" + Utils.cashToString(tempAmount),
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    )),
                SizedBox(
                  width: 150,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () => confirm(),
                    child: const Text(
                      "CONFIRM",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      ),
                    ),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.resolveWith<Color>(
                            (Set<MaterialState> states) {
                          if (states.contains(MaterialState.pressed)) {
                            return ColorValues.addButtonColor.withOpacity(0.5);
                          }
                          return ColorValues.addButtonColor;
                        },
                      ),
                      padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.zero),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  updateTempAmount(int cash){
    setState(() {
      tempAmount += cash;
    });
  }

  void confirm(){
    _player.addCash(tempAmount);
    setState(() {
      tempAmount = 0;
    });
  }

  Widget _displayBox(String display) {
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

  @override
  void notify() {
    setState(() {
      _player = _cache.player;
    });
  }
}
