import 'package:flutter/material.dart';
import 'package:flutter_gradient_colors/flutter_gradient_colors.dart';
import 'package:unisys/utilities/constants.dart';

class GradientHeader extends StatelessWidget {
  const GradientHeader({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomLeft,
      children: <Widget>[
        Opacity(
          opacity: 0.8,
          child: Container(
            width: double.infinity,
            height: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(56.0),
              ),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: GradientColors.cherry,
                stops: [
                  0.3,
                  0.6,
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 38.0, left: 12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Confirm Emergency',
                style: kHugeText,
              ),
              Divider(
                thickness: 4.0,
                height: 22.0,
              ),
              Text(
                'Please stay calm!',
                style: kSubHeadingText.copyWith(color: kBackgroundColor),
              ),
              Text(
                'Help will reachout to you soon.',
                style: kSubHeadingText.copyWith(color: kBackgroundColor),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
