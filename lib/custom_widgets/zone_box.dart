import 'package:flutter/material.dart';
import 'package:unisys/utilities/constants.dart';

class ZoneBox extends StatelessWidget {
  final stat;
  final value;

  ZoneBox({this.stat, this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: (MediaQuery.of(context).size.width / 2),
            height: (MediaQuery.of(context).size.height / 2),
            decoration: BoxDecoration(
              color: Color(0xFFFF5733),
            ),
          ),
          Container(
            width: (MediaQuery.of(context).size.width / 2) - 60,
            height: (MediaQuery.of(context).size.height / 2) - 90,
            decoration: BoxDecoration(
              color: Color(0xFFC70039),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    stat,
                    textAlign: TextAlign.center,
                    style: kSubHeadingText.copyWith(
                        fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                  Text(
                    value,
                    textAlign: TextAlign.center,
                    style: kText.copyWith(
                        fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
