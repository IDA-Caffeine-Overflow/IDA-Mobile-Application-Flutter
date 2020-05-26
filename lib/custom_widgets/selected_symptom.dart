import 'package:flutter/material.dart';
import 'package:unisys/utilities/constants.dart';

class SelectedSymptom extends StatelessWidget {
  final String symp;

  SelectedSymptom({@required this.symp});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: 290.0,
            height: 50.0,
            decoration: new BoxDecoration(
              color: Color(0xFF20639B).withOpacity(0.6),
              borderRadius: BorderRadius.circular(22.0),
            ),
          ),
          Center(
            child: Container(
              width: 260.0,
              height: 30.0,
              decoration: new BoxDecoration(
                color: Color(0xFF173F5F).withOpacity(0.6),
                borderRadius: BorderRadius.circular(12.0),
              ),
            ),
          ),
          Text(
            symp,
            style: kSubHeadingText.copyWith(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
