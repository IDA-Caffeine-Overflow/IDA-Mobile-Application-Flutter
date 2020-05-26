import 'package:flutter/material.dart';
import 'package:unisys/utilities/constants.dart';

class MyCheckbox extends StatefulWidget {
  final text;
  bool selected = false;

  MyCheckbox({@required this.text});

  @override
  _MyCheckboxState createState() => _MyCheckboxState();
}

class _MyCheckboxState extends State<MyCheckbox> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: GestureDetector(
        onTap: () {
          setState(() {
            widget.selected = !widget.selected;
          });
        },
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: 330.0,
              height: 80.0,
              decoration: new BoxDecoration(
                color: widget.selected
                    ? kButtonColor.withOpacity(0.4)
                    : Color(0xFFD9DDDC),
                borderRadius: BorderRadius.circular(18.0),
              ),
            ),
            Center(
              child: Container(
                width: 300.0,
                height: 50.0,
                decoration: new BoxDecoration(
                  color: widget.selected ? kButtonColor : Color(0xFF808588),
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ),
            ),
            Text(
              widget.text,
              style: kHeadingText.copyWith(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
