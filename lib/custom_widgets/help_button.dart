import 'package:flutter/material.dart';
import 'package:unisys/screens/phone_number_page.dart';
import 'package:unisys/utilities/constants.dart';

class HelpButton extends StatelessWidget {
  const HelpButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: 260.0,
          height: 260.0,
          decoration: new BoxDecoration(
            color: Color(0xFFFEDAD3),
            shape: BoxShape.circle,
          ),
        ),
        Container(
          width: 210.0,
          height: 210.0,
          decoration: new BoxDecoration(
            color: Color(0xFFFCBAAD),
            shape: BoxShape.circle,
          ),
        ),
        Center(
          child: GestureDetector(
            onTap: () {
              Navigator.pushNamed(
                context,
                PhoneNumberPage.routeName,
              );
            },
            child: Container(
              width: 160.0,
              height: 160.0,
              decoration: new BoxDecoration(
                color: Color(0xFFF52800),
                shape: BoxShape.circle,
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(
              context,
              PhoneNumberPage.routeName,
            );
          },
          child: Text(
            'HELP ME',
            style: kHugeText,
          ),
        ),
      ],
    );
  }
}
