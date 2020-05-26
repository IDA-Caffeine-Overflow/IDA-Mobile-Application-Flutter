import 'package:flutter/material.dart';
import 'package:unisys/utilities/constants.dart';

class LocationBox extends StatelessWidget {
  final lat;
  final long;

  LocationBox({this.lat, this.long});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Container(
            width: (MediaQuery.of(context).size.width),
            height: (MediaQuery.of(context).size.height),
            decoration: BoxDecoration(
              color: Color(0xFFFF5733),
            ),
          ),
          Container(
            width: (MediaQuery.of(context).size.width) - 60,
            height: (MediaQuery.of(context).size.height) - 90,
            decoration: BoxDecoration(
              color: Color(0xFFC70039),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('YOU ARE CURRENTLY LOCATED AT :',
                      textAlign: TextAlign.center,
                      style: kHeadingText.copyWith(
                          fontWeight: FontWeight.bold, color: Colors.black)),
                  Text('Latitude : $lat',
                      style: kSubHeadingText.copyWith(color: Colors.white)),
                  Text('Latitude : $long',
                      style: kSubHeadingText.copyWith(color: Colors.white)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
