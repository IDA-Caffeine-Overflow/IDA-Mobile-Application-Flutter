import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:unisys/custom_widgets/button.dart';
import 'package:unisys/screens/pre_home.dart';
import 'package:unisys/utilities/constants.dart';

class First extends StatelessWidget {
  static const routeName = "asdasdasfsaaaaaaaaaaaaaaaaadfsa";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Welcome',
            style: kAppBarText,
          ),
        ),
        body: Column(
          children: <Widget>[
            Stack(
              children: [
                Container(
                  height: 140,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.elliptical(450.0, 560.0),
                    ),
                    color: Color(0xFF20639B),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 38.0),
                  child: Container(
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.elliptical(220.0, 340.0),
                      ),
                      color: Color(0xFF173F5F),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Center(
                    child: SizedBox(
                      width: 260,
                      height: 260.0,
                      child: Carousel(
                        dotBgColor: Colors.black.withOpacity(0),
                        dotColor: Colors.black.withOpacity(0.3),
                        dotIncreasedColor: Colors.black,
                        showIndicator: false,
                        images: [
                          RoundImage(i: 'images/d0.jpg'),
                          RoundImage(i: 'images/d1.png'),
                          RoundImage(i: 'images/d2.png'),
                          RoundImage(i: 'images/d3.png'),
                          RoundImage(i: 'images/d4.png'),
                          RoundImage(i: 'images/d5.png'),
                          RoundImage(i: 'images/d6.jpg'),
                          RoundImage(i: 'images/d7.jpg'),
                          RoundImage(i: 'images/d8.jpg'),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
            Text(
              'WELCOME TO IDA !!',
              style: kHugeText.copyWith(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(14.0),
              child: Text(
                'Follow 3 simple steps to register your helpline complain in this time of havoc, and we will ensure that you get the help you deserve at the earliest. We at IDA make sure your voice is heard and help reaches out to you at the right time. Please follow the instructions to file your issue.',
                style: kText,
                textAlign: TextAlign.justify,
              ),
            ),
            Button(
              onPressed: () {
                Navigator.pushNamed(context, PreHome.routeName);
              },
              text: 'NEXT',
            ),
          ],
        ),
      ),
    );
  }
}

class RoundImage extends StatelessWidget {
  final String i;

  const RoundImage({Key key, this.i}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          image: AssetImage(i),
        ),
      ),
    );
  }
}
