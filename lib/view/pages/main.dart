import 'package:commodore/presenter/create_room_presenter.dart';
import 'package:commodore/presenter/join_room_presenter.dart';
import 'package:commodore/services/response/create_room_response.dart';
import 'package:commodore/services/response/join_room_response.dart';
import 'package:commodore/themes/color_values.dart';
import 'package:commodore/themes/theme_data.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Commodore Score',
      theme: CustomTheme.theme,
      home: const MyHomePage(title: 'Commodore'),
    );
  }
}

class MyHomePage extends StatefulWidget {

  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();

}

class _MyHomePageState extends State<MyHomePage> implements JoinRoomView, CreateRoomView {
  _MyHomePageState(){
    _joinRoomPresenter = JoinRoomPresenter(view: this);
    _createRoomPresenter = CreateRoomPresenter(view: this);
  }

  JoinRoomPresenter? _joinRoomPresenter;
  CreateRoomPresenter? _createRoomPresenter;

  final double _buttonWidth = 200.0;
  final double _buttonHeight = 50.0;
  final double _textFieldWidth = 250.0;
  final double _textFieldHeight = 75.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            _nameTextField(),

            _roomCodeTextField(),

            _joinRoomButton(),

            _createRoomButton(),

          ],
        ),
      ),
    );
  }

  Container _nameTextField(){
    return Container(
      width: _textFieldWidth,
      height: _textFieldHeight,
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.transparent),
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        color: ColorValues.textEntryColor,
      ),

      child: TextFormField(
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 36),
        keyboardType: TextInputType.text,
        decoration: const InputDecoration(
          border: InputBorder.none,
          hintText: 'name',
          // labelText: 'name',
          // labelStyle: TextStyle(
          //   fontSize: 12,
          //   color: Colors.black45,
          // ),
          // floatingLabelBehavior: FloatingLabelBehavior.always,
        ),
      ),
    );
  }

  Container _roomCodeTextField(){
    return Container(
        width: _textFieldWidth,
        height: _textFieldHeight,
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.transparent),
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            color: ColorValues.textEntryColor,
        ),

        child: TextFormField(
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 36),
          keyboardType: TextInputType.text,
          decoration: const InputDecoration(
            border: InputBorder.none,
            hintText: 'room code',
            // labelText: 'room code',
            // labelStyle: TextStyle(
            //   fontSize: 12,
            //   color: Colors.black45,
            // ),
            // floatingLabelBehavior: FloatingLabelBehavior.always,
          ),
        ),
    );
  }

  Container _joinRoomButton(){
    return Container(
      width: _buttonWidth,
      height: _buttonHeight,
      margin: const EdgeInsets.all(5),
      child: ElevatedButton(
        child: const Text("join room"),
        onPressed: () => _joinRoomPresenter?.onJoinRoomClicked("hi", "hi"),
      ),
    );
  }

  Container _createRoomButton() {
    return Container(
      width: _buttonWidth,
      height: _buttonHeight,
      margin: const EdgeInsets.all(5),
      child: ElevatedButton(
        child: const Text("create room"),
        onPressed: () => _createRoomPresenter?.onCreateRoomClicked("hi"),
      ),
    );
  }

  @override
  void roomJoined(JoinRoomResponse response) {
    String text;
    if(response.success) {
      text = "Join success!";
    } else {
      text = "Join failed...";
    }

    SnackBar snackBar = SnackBar(content: Text(text));

    // Find the ScaffoldMessenger in the widget tree
    // and use it to show a SnackBar.
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  void roomCreated(CreateRoomResponse response) {
    String text;
    if(response.success) {
      text = "Create success!";
    } else {
      text = "Create failed...";
    }

    SnackBar snackBar = SnackBar(content: Text(text));

    // Find the ScaffoldMessenger in the widget tree
    // and use it to show a SnackBar.
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
