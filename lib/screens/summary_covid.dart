import 'dart:io';

import 'package:flutter/services.dart' show rootBundle;
import 'package:path_provider/path_provider.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:unisys/custom_widgets/button.dart';
import 'package:unisys/custom_widgets/checkbox.dart';
import 'package:unisys/custom_widgets/emergency_corona_guide.dart';
import 'package:unisys/custom_widgets/gradient_header.dart';
import 'package:unisys/custom_widgets/selected_symptom.dart';
import 'package:unisys/custom_widgets/what_next.dart';
import 'package:unisys/screens/success.dart';
import 'package:unisys/utilities/constants.dart';
import 'package:unisys/screens/report_emergency_covid.dart';
import 'package:unisys/screens/ph2.dart';
import 'package:sms/sms.dart';

class SummaryCovid extends StatefulWidget {
  static const routeName = "asyrtyrrta";

  final symptoms;

  SummaryCovid({this.symptoms});

  @override
  _SummaryCovidState createState() => _SummaryCovidState();
}

class _SummaryCovidState extends State<SummaryCovid> {
  bool val = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ModalProgressHUD(
          inAsyncCall: val,
          child: ListView(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  GradientHeader(),
                  SizedBox(height: 10.0),
                  Text(
                    'Symtoms Selected :',
                    style: kHeadingText.copyWith(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10.0),
                  Column(
                    children: selectedSymptoms(),
                  ),
                  SizedBox(height: 10.0),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'What next ?',
                      style: kHeadingText.copyWith(fontWeight: FontWeight.w700),
                    ),
                  ),
                  Column(
                    children: <Widget>[
                      WhatNext(
                        text:
                            'You will receive a call from us soon. We will make sure that you\'re rightly tested and are safe from the virus.',
                      ),
                      WhatNext(
                        text:
                            'Our helpline department will look into your situation and repond at the earliest',
                      ),
                      WhatNext(
                        text:
                            'Our Medical Team will contact you based after checking your complaint which is prioritized.',
                      ),
                    ],
                  ),
                  SizedBox(height: 10.0),
                  EmergencyCoronaGuide(),
                  SizedBox(height: 10.0),
                  Button(
                    onPressed: () async {
                      setState(() {
                        val = true;
                      });

                      SmsSender sender = new SmsSender();
                      String address = mobileNumber;
                      print("hoi : $address");
                      sender.sendSms(
                        new SmsMessage(
                          address,
                          'Thank you registering your complaint. Help will reach out to you soon. Your Complaint ID is $uid. Please take neccesary safety measures.',
                        ),
                      );

                      // image = await getImageFileFromAssets('images/1.png');

                      // final StorageReference firebaseStorageRef =
                      //     FirebaseStorage.instance
                      //         .ref()
                      //         .child('images')
                      //         .child(uid);
                      // firebaseStorageRef.putFile(image);

                      File audi = File.fromUri(Uri.parse(audio));

                      final StorageReference firebaseStorageRef2 =
                          FirebaseStorage.instance
                              .ref()
                              .child('audio')
                              .child(uid + '.wav');
                      firebaseStorageRef2.putFile(audi);

                      await Firestore.instance
                          .collection('users')
                          .document(uid.toString())
                          .setData(
                        {
                          'uid': uid,
                          'location': {
                            'latitude': position.latitude,
                            'longitude': position.longitude,
                            'altitude': position.altitude,
                          }
                        },
                      );
                      setState(() {
                        val = false;
                      });
                      Navigator.pushNamed(context, Success.routeName);
                    },
                    text: 'REGISTER',
                  ),
                  SizedBox(height: 10.0),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<File> getImageFileFromAssets(String path) async {
    final byteData = await rootBundle.load('assets/$path');

    final file = File('${(await getTemporaryDirectory()).path}/$path');
    await file.writeAsBytes(byteData.buffer
        .asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));

    return file;
  }

  List<SelectedSymptom> selectedSymptoms() {
    List<SelectedSymptom> ans = [];
    for (MyCheckbox i in widget.symptoms) {
      ans.add(SelectedSymptom(symp: i.text));
    }
    return ans;
  }
}
