import 'package:flutter/material.dart';
import 'package:unisys/utilities/constants.dart';

class CheckboxLegend extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Column(
          children: <Widget>[
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  width: 35.0,
                  height: 35.0,
                  decoration: new BoxDecoration(
                    color: kButtonColor.withOpacity(0.4),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                Center(
                  child: Container(
                    width: 20.0,
                    height: 20.0,
                    decoration: new BoxDecoration(
                      color: kButtonColor,
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                ),
              ],
            ),
            Text(
              'Selected',
              style: kText.copyWith(fontWeight: FontWeight.bold),
            ),
          ],
        ),
        Column(
          children: <Widget>[
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  width: 35.0,
                  height: 35.0,
                  decoration: new BoxDecoration(
                    color: Color(0xFFD9DDDC),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                Center(
                  child: Container(
                    width: 20.0,
                    height: 20.0,
                    decoration: new BoxDecoration(
                      color: Color(0xFF808588),
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                ),
              ],
            ),
            Text(
              'Unselected',
              style: kText.copyWith(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ],
    );
  }
}
