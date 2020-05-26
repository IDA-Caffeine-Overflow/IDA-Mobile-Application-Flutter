import 'dart:io';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:unisys/custom_widgets/button.dart';
import 'package:unisys/custom_widgets/emergency_survival_guide.dart';
import 'package:unisys/custom_widgets/gradient_header.dart';
import 'package:unisys/custom_widgets/what_next.dart';
import 'package:unisys/screens/success.dart';
import 'package:unisys/utilities/constants.dart';
import 'package:unisys/screens/report_emergency_page.dart';
import 'package:unisys/screens/phone_number_page.dart';
import 'package:sms/sms.dart';

class SummaryPage extends StatefulWidget {
  static const routeName = "asdafsassa";

  @override
  _SummaryPageState createState() => _SummaryPageState();
}

class _SummaryPageState extends State<SummaryPage> {
  bool val = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ModalProgressHUD(
          inAsyncCall: val,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              GradientHeader(),
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
                        'You will receive a call from the control room based on the emergency. Expect rescue any time soon',
                  ),
                  WhatNext(
                    text: 'Responder will reach your location at the earliest',
                  ),
                  WhatNext(
                    text:
                        'Responder will help you out of the situation and take necessary actions',
                  ),
                ],
              ),
              EmergencySurvivalGuide(),
              Button(
                onPressed: () async {
                  setState(() {
                    val = true;
                  });

                  SmsSender sender = new SmsSender();
                  String address = mobileNumber;

                  sender.sendSms(
                    new SmsMessage(
                      address,
                      'Thank you registering your complaint. Help will reach out to you soon. Your Complaint ID is $uid. Please take neccesary safety measures.',
                    ),
                  );

                  final StorageReference firebaseStorageRef =
                      FirebaseStorage.instance.ref().child('images').child(uid);
                  firebaseStorageRef.putFile(image);

                  File audi = File.fromUri(Uri.parse(audio));

                  final StorageReference firebaseStorageRef2 = FirebaseStorage
                      .instance
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
            ],
          ),
        ),
      ),
    );
  }
}
