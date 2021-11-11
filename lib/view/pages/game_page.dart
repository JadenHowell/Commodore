import 'package:commodore/model/user.dart';
import 'package:commodore/view/other_widgets/player_button.dart';
import 'package:flutter/material.dart';

class GamePage extends StatefulWidget {
  const GamePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {

  List<User> allUsers = [
    User(name: 'Jaden', color: Colors.blue, money: 15),
    User(name: 'Easton', color: Colors.green, money: 15),
    User(name: 'Haylee', color: Colors.red, money: 15),
    User(name: 'Jimbo', color: Colors.orange, money: 15)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget> [

          //TODO: need to loop through a list of all users
          for(User user in allUsers)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: PlayerButton(
                    user: user,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
