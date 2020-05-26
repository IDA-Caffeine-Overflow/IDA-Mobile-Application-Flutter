import 'package:flutter/material.dart';
import 'package:unisys/utilities/constants.dart';

class CircleButton extends StatelessWidget {
  final IconData icon;
  final Color color;
  final double size;
  final Function onTap;

  const CircleButton({
    Key key,
    @required this.onTap,
    @required this.size,
    @required this.color,
    @required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: size,
            height: size,
            decoration: new BoxDecoration(
              color: color.withOpacity(0.2),
              shape: BoxShape.circle,
            ),
          ),
          Center(
            child: Container(
              width: size,
              height: size - 30.0,
              decoration: new BoxDecoration(
                color: color,
                shape: BoxShape.circle,
              ),
            ),
          ),
          Icon(
            icon,
            color: kBackgroundColor,
            size: 40.0,
          ),
        ],
      ),
    );
  }
}
