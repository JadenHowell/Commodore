import 'package:commodore/model/user.dart';
import 'package:commodore/view/pages/worth_page.dart';
import 'package:flutter/material.dart';

class PlayerWorthButton extends StatelessWidget {
  PlayerWorthButton({Key? key, required this.user}) : super(key: key);

  final User user;
  late BuildContext appContext;

  @override
  Widget build(BuildContext context) {
    appContext = context;
    return ElevatedButton(
      onPressed: () => navigateToUserWorthPage(),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(user.color),
      ),
      child: SizedBox(
        width: 200,
        height: 75,
        child: Center(
          child: Text(
            user.name + ": \$" + user.worthToString(),
            style: const TextStyle(
              fontSize: 28,
            ),
          ),
        ),
      ),
    );
  }

  void navigateToUserWorthPage() {
    Navigator.push(
      appContext,
      MaterialPageRoute(builder: (context) => WorthPage(user: user)),
    );
  }
}
