import 'package:flutter/material.dart';
import 'package:unisys/utilities/constants.dart';

class OptionBox extends StatelessWidget {
  final text;
  final onTap;
  OptionBox({@required this.text, @required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: onTap,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: 310.0,
              height: 110.0,
              decoration: new BoxDecoration(
                color: Color(0xFF20639B),
                borderRadius: BorderRadius.circular(82.0),
              ),
            ),
            Center(
              child: Container(
                width: 260.0,
                height: 60.0,
                decoration: new BoxDecoration(
                  color: Color(0xFF173F5F),
                  borderRadius: BorderRadius.circular(52.0),
                ),
              ),
            ),
            Text(
              text,
              style: kHeadingText.copyWith(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
