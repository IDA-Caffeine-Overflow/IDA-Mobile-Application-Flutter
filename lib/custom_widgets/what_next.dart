import 'package:flutter/material.dart';
import 'package:unisys/utilities/constants.dart';

class WhatNext extends StatefulWidget {
  final String text;

  WhatNext({@required this.text});
  @override
  _WhatNextState createState() => _WhatNextState();
}

class _WhatNextState extends State<WhatNext> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              Icons.bubble_chart,
              size: 38.0,
              color: Colors.blueGrey,
            ),
          ),
          Expanded(
            child: Text(
              widget.text,
              style: kText,
            ),
          ),
        ],
      ),
    );
  }
}
