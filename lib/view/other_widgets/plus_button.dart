import 'package:commodore/themes/color_values.dart';
import 'package:flutter/material.dart';

class PlusButton extends StatelessWidget {
  const PlusButton({Key? key, required this.callback}) : super(key: key);

  final Function callback;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      width: 40,
      child: ElevatedButton(
        onPressed: () => callback(),
        child: const Text(
          "+",
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
    );
  }
}
