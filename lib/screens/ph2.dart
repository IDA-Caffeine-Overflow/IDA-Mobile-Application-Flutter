import 'package:flutter/material.dart';
import 'package:mobile_number/mobile_number.dart';
import 'package:unisys/custom_widgets/button.dart';
import 'package:unisys/custom_widgets/input_box.dart';
import 'package:unisys/screens/report_covid.dart';
import 'package:unisys/utilities/constants.dart';

class PhoneNumberPage2 extends StatefulWidget {
  static const routeName = "sdakfaigkjglskf";

  @override
  _PhoneNumberPage2State createState() => _PhoneNumberPage2State();
}

String mobileNumber = '1111111111';

class _PhoneNumberPage2State extends State<PhoneNumberPage2> {
  var userEnteredMobileNumber = InputBox(
    hintText: 'Enter Phone Number',
    labelText: 'Phone Number (+91)',
  );

  bool display = false;

  getMobileNumber() async {
    mobileNumber = await MobileNumber.mobileNumber;
    setState(() {});
  }

  @override
  void initState() {
    getMobileNumber();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Phone Number',
            style: kAppBarText,
          ),
        ),
        body: ListView(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Visibility(
                  visible: !display,
                  child: Container(
                    height: 200.0,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Button(
                          onPressed: () {
                            setState(() {
                              getMobileNumber();
                            });
                          },
                          text: 'REFRESH',
                        ),
                        Text(
                          'Phone Number Identified as',
                          style: kBigText,
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          '${mobileNumber.substring(2)}',
                          style: kBigText.copyWith(
                            color: Colors.blueAccent,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 50.0,
                ),
                Button(
                  onPressed: () {
                    setState(() {
                      display = !display;
                    });
                  },
                  text: !display ? "ENTER MANUALLY" : "AUTO-DETECT",
                ),
                SizedBox(
                  height: 20.0,
                ),
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Divider(
                    thickness: 4.0,
                  ),
                ),
                SizedBox(
                  height: 50.0,
                ),
                Visibility(
                  visible: display,
                  child: Container(
                      child: Column(
                    children: <Widget>[
                      Text(
                        'Enter Manually',
                        style: kBigText,
                      ),
                      userEnteredMobileNumber,
                    ],
                  )),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Button(
                  onPressed: () {
                    if (userEnteredMobileNumber.input != null &&
                        userEnteredMobileNumber.input.length != 10) {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            actions: <Widget>[
                              Button(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                text: 'CLOSE',
                              ),
                            ],
                            content: Text(
                              'Enter Valid Phone Number',
                              style: kSubHeadingText,
                            ),
                            contentPadding: EdgeInsets.all(8.0),
                          );
                        },
                      );
                    } else if (userEnteredMobileNumber.input != null &&
                        userEnteredMobileNumber.input.length == 10) {
                      mobileNumber = '+91' + userEnteredMobileNumber.input;
                      Navigator.pushNamed(
                        context,
                        ReportCovid.routeName,
                      );
                    } else if (mobileNumber != null &&
                        (userEnteredMobileNumber.input == null ||
                            userEnteredMobileNumber.input == '')) {
                      Navigator.pushNamed(
                        context,
                        ReportCovid.routeName,
                      );
                    } else if (!display) {
                      Navigator.pushNamed(
                        context,
                        ReportCovid.routeName,
                      );
                    }
                  },
                  text: 'PROCEED',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
