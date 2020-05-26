import 'package:flutter/material.dart';
import 'package:unisys/custom_widgets/path.dart';
import 'package:unisys/screens/covid_home.dart';
import 'package:unisys/screens/home_screen.dart';
import 'package:unisys/utilities/constants.dart';

class PreHome extends StatefulWidget {
  static const routeName = "saddsadsa";

  @override
  _PreHomeState createState() => _PreHomeState();
}

class _PreHomeState extends State<PreHome> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Select Situation',
            style: kAppBarText,
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Center(
              child: Padding(
                padding: const EdgeInsets.all(3.0),
                child: Text(
                  'Find help at the Earliest by contacting the helpline through our service',
                  textAlign: TextAlign.center,
                  style: kSubHeadingText,
                ),
              ),
            ),
            Path(
              text: 'DISASTER',
              onTap: () {
                Navigator.pushNamed(context, HomeScreen.routeName);
              },
            ),
            Path(
              text: 'COVID-19',
              onTap: () {
                Navigator.pushNamed(context, CovidHome.routeName);
              },
            ),
          ],
        ),
      ),
    );
  }
}
