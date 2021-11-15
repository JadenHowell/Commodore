import 'package:commodore/model/user.dart';
import 'package:commodore/view/other_widgets/player_worth_button.dart';
import 'package:commodore/view/other_widgets/player_header.dart';
import 'package:flutter/material.dart';

import '../../data_cache.dart';

class GamePage extends StatefulWidget {
  const GamePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {

  final DataCache _dataCache = DataCache.getInstance();
  late List<User> allUsers;

  @override
  Widget build(BuildContext context) {
    allUsers = DataCache.getInstance().allUsers;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget> [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 10.0, 0, 20.0),
            child: PlayerHeader(user: _dataCache.player),
          ),

          for(User user in allUsers)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: PlayerWorthButton(
                    user: user,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
