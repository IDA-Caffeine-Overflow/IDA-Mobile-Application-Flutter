import 'package:flutter/material.dart';
import 'package:flutter_audio_recorder/flutter_audio_recorder.dart';
import 'package:geolocator/geolocator.dart';
import 'package:unisys/custom_widgets/button.dart';
import 'package:unisys/screens/symptoms_page.dart';
import 'package:unisys/utilities/constants.dart';

class ReportCovid extends StatefulWidget {
  static const routeName = "ReportCovidadsasd";

  @override
  _ReportCovidState createState() => _ReportCovidState();
}

Position position;
String audio;
Recording recording;
String uid;

class _ReportCovidState extends State<ReportCovid> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Coronavirus helpline',
            style: kAppBarText,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              Column(
                children: <Widget>[
                  Container(
                    color: Colors.white,
                    width: double.infinity,
                    height: 250.0,
                    child: Opacity(
                      opacity: 0.7,
                      child: Image.asset(
                        'images/mohfw.jpg',
                        width: 200.0,
                        height: 170.0,
                        fit: BoxFit.contain,
                        gaplessPlayback: true,
                        alignment: Alignment.center,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Center(
                    child: Text(
                      'Government of India is taking all necessary steps to ensure that we are prepared well to face the challenge and threat posed by the growing pandemic of COVID-19 the Corona Virus. With active support of the people of India, we have been able to contain the spread of the Virus in our country. The most important factor in preventing the spread of the Virus locally is to empower the citizens with the right information and taking precautions as per the advisories being issued by Ministry of Health & Family Welfare.',
                      textAlign: TextAlign.justify,
                      style: kText,
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Button(
                    text: 'CONTINUE',
                    onPressed: () {
                      Navigator.pushNamed(context, SymptomsPage.routeName);
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
