import 'package:commodore/model/user.dart';
import 'package:flutter/material.dart';

class PlayerHeader extends StatelessWidget {
  const PlayerHeader({Key? key, required this.user}) : super(key: key);

  final User user;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: user.color,
        borderRadius: BorderRadius.circular(12),
      ),
      child: SizedBox(
        width: 300,
        height: 100,
        child: Center(
          child: Text(
            user.name,
            style: const TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
