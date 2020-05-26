import 'package:flutter/material.dart';
import 'package:unisys/custom_widgets/checkbox.dart';
import 'package:unisys/custom_widgets/checkbox_legend.dart';
import 'package:unisys/custom_widgets/button.dart';
import 'package:unisys/screens/report_emergency_covid.dart';
import 'package:unisys/utilities/constants.dart';

class SymptomsPage extends StatefulWidget {
  static const routeName = "ssobaras";

  @override
  _SymptomsPageState createState() => _SymptomsPageState();
}

class _SymptomsPageState extends State<SymptomsPage> {
  List<MyCheckbox> symptoms = [
    MyCheckbox(text: 'Fever'),
    MyCheckbox(text: 'Tiredness'),
    MyCheckbox(text: 'Dry Cough'),
    MyCheckbox(text: 'Aches and Pains'),
    MyCheckbox(text: 'Nasal Congestion'),
    MyCheckbox(text: 'Runny Nose'),
    MyCheckbox(text: 'Sore Throat'),
    MyCheckbox(text: 'Diarrhoea'),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Select Symptoms',
            style: kAppBarText,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Text(
                    'Before proceeding further please select the symtoms which you are having to help us know your situation better. Please mark the symptoms which are applicable',
                    textAlign: TextAlign.justify,
                    style: kSubHeadingText,
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              CheckboxLegend(),
              SizedBox(
                height: 16.0,
              ),
              Center(
                child: Text(
                  'Select from the following :',
                  style: kSubHeadingText.copyWith(fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 12.0,
              ),
              Column(
                children: symptoms,
              ),
              SizedBox(
                height: 12.0,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 118.0, right: 118.0),
                child: Button(
                  text: 'NEXT',
                  onPressed: () {
                    List<MyCheckbox> pass = [];
                    for (MyCheckbox i in symptoms)
                      if (i.selected == true) pass.add(i);
                    for (MyCheckbox i in pass) print(i.text);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            ReportEmergencyCovid(symptoms: pass),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
                height: 12.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
