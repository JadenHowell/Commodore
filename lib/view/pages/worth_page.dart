import 'package:commodore/model/user.dart';
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
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.user.name),
        centerTitle: true,
        backgroundColor: widget.user.color,
      ),
      body: Column(),
    );
  }
}
