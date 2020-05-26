import 'package:flutter/material.dart';
import 'package:unisys/utilities/constants.dart';

class Path extends StatelessWidget {
  final text;
  final onTap;
  Path({@required this.text, @required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: 290.0,
            height: 190.0,
            decoration: new BoxDecoration(
              color: kButtonColor.withOpacity(0.3),
              shape: BoxShape.rectangle,
            ),
          ),
          Container(
            width: 240.0,
            height: 140.0,
            decoration: new BoxDecoration(
              color: kButtonColor.withOpacity(0.5),
              shape: BoxShape.rectangle,
            ),
          ),
          Center(
            child: Container(
              width: 190.0,
              height: 90.0,
              decoration: new BoxDecoration(
                color: kButtonColor,
                shape: BoxShape.rectangle,
              ),
            ),
          ),
          Text(
            text,
            style: kHugeText,
          ),
        ],
      ),
    );
  }
}
