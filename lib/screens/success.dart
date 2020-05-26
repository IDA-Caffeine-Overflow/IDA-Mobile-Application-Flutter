import 'package:flutter/material.dart';
import 'package:unisys/custom_widgets/button.dart';
import 'package:unisys/custom_widgets/circle_button.dart';
import 'package:unisys/utilities/constants.dart';

class Success extends StatefulWidget {
  static const routeName = "orityruorty";

  @override
  _SuccessState createState() => _SuccessState();
}

class _SuccessState extends State<Success> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Container(
              child: CircleButton(
                onTap: null,
                size: 140.0,
                color: Colors.green,
                icon: Icons.check,
              ),
            ),
            Text(
              'SUCCESSFULLY REGISTERED!',
              textAlign: TextAlign.center,
              style: kHugeText.copyWith(
                color: Colors.black,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Text(
                'BE SAFE TILL HELP ARRIVES',
                textAlign: TextAlign.center,
                style: kHugeText.copyWith(
                  color: Colors.black,
                ),
              ),
            ),
            Button(
              onPressed: () {
                Navigator.of(context).popUntil((route) => route.isFirst);
              },
              text: 'DONE',
            ),
          ],
        ),
      ),
    );
  }
}
