import 'package:flutter/material.dart';
import 'package:unisys/utilities/constants.dart';

class Button extends StatelessWidget {
  final Function onPressed;
  final String text;
  Button({@required this.onPressed, @required this.text});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Text(
          text,
          style: kText.copyWith(fontWeight: FontWeight.bold),
        ),
      ),
      elevation: 3.0,
      fillColor: kButtonColor,
      splashColor: kButtonColor.withOpacity(0.5),
    );
  }
}
