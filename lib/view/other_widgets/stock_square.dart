import 'package:commodore/model/user.dart';
import 'package:flutter/material.dart';

class StockSquare extends StatefulWidget {
  const StockSquare({Key? key, required this.user, required this.amount, this.size = 75}) : super(key: key);

  final User user;
  final int amount;
  final int size;

  @override
  _StockSquareState createState() => _StockSquareState();
}

class _StockSquareState extends State<StockSquare> {
  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: widget.user.color,
        borderRadius: BorderRadius.circular(6),
      ),
      child: SizedBox(
        width: widget.size.toDouble(),
        height: widget.size.toDouble(),
        child: Center(
          child: Text(
            widget.amount.toString(),
            style: TextStyle(
              fontSize: widget.size / 3,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
