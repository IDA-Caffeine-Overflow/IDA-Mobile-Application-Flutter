import 'package:flutter/material.dart';
import 'package:unisys/screens/webview_guide.dart';
import 'package:unisys/utilities/constants.dart';

class EmergencySurvivalGuide extends StatelessWidget {
  const EmergencySurvivalGuide({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 12.0, right: 8.0),
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, WebviewGuide.routeName);
        },
        child: Container(
          decoration: BoxDecoration(
            color: Colors.amberAccent.withOpacity(0.35),
            borderRadius: BorderRadius.circular(54.0),
            border: Border.all(
              color: Colors.amberAccent.withOpacity(0.5),
              width: 4.0,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.business_center,
                    size: 40.0,
                    color: Colors.orangeAccent,
                  ),
                ),
                Expanded(
                  child: Text(
                    'Emergency Survival Guide',
                    style: kSubHeadingText,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
