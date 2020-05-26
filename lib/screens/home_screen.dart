import 'package:flutter/material.dart';
import 'package:unisys/custom_widgets/help_button.dart';
import 'package:unisys/utilities/constants.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = "HomeScreen";

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Home',
            style: kAppBarText,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Center(
                child: Text(
                  'Are you in an Emergency?',
                  textAlign: TextAlign.center,
                  style: kBigText.copyWith(fontWeight: FontWeight.bold),
                ),
              ),
              HelpButton(),
              Center(
                child: Text(
                  'Press the button above and help will reach you soon',
                  textAlign: TextAlign.center,
                  style: kHeadingText,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
