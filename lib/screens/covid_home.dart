import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:unisys/custom_widgets/option_box.dart';
import 'package:unisys/screens/view_zone.dart';
import 'package:unisys/screens/webview_advisory.dart';
import 'package:unisys/screens/ph2.dart';
import 'package:unisys/screens/webview_heatmap.dart';
import 'package:unisys/utilities/constants.dart';
import 'package:geolocator/geolocator.dart';

class CovidHome extends StatefulWidget {
  static const routeName = "jerinfs";

  @override
  _CovidHomeState createState() => _CovidHomeState();
}

class _CovidHomeState extends State<CovidHome> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Coronavirus helpline service',
            style: kAppBarText,
          ),
        ),
        body: ListView(
          children: <Widget>[
            Container(
              color: Colors.white,
              width: double.infinity,
              height: 250.0,
              child: Opacity(
                opacity: 0.7,
                child: Image.asset(
                  'images/coro.gif',
                  width: 250.0,
                  height: 250.0,
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
                'Select an option to proceed',
                textAlign: TextAlign.center,
                style: kSubHeadingText.copyWith(fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            OptionBox(
              onTap: () {
                Navigator.pushNamed(context, PhoneNumberPage2.routeName);
              },
              text: 'CALL HELPLINE',
            ),
            OptionBox(
              onTap: () async {
                Position pos = await Geolocator()
                    .getCurrentPosition(desiredAccuracy: LocationAccuracy.low);

                print(
                    pos.latitude.toString() + ", " + pos.longitude.toString());

                Map data = {
                  'key':
                      'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJtYWlsSWRlbnRpdHkiOiJqZXJpbmZyYW5jaXM3N0BnbWFpbC5jb20ifQ.tbqXuZEPuc4G1Mk60pD_5TtgoYTGbkXJCGX19hEIEYo',
                  'latlngs': [
                    [pos.latitude, pos.longitude],
                  ],
                };

                String body = json.encode(data);

                http.Response response = await http.post(
                  'https://data.geoiq.io/dataapis/v1.0/covid/locationcheck',
                  headers: {"Content-Type": "application/json"},
                  body: body,
                );

                Map values = json.decode(response.body);

                var containmentsAvailability =
                    values["data"][0]["containmentsAvailability"];
                var containmentZoneName =
                    values["data"][0]["containmentZoneName"];
                var district = values["data"][0]["district"];
                var districtZoneType = values["data"][0]["districtZoneType"];
                var inContainmentZone = values["data"][0]["inContainmentZone"];

                print(containmentsAvailability);
                print(containmentZoneName);
                print(district);
                print(districtZoneType);
                print(inContainmentZone);

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ViewZone(
                      latitude: pos.latitude,
                      longitude: pos.longitude,
                      containmentZoneName: containmentZoneName,
                      containmentsAvailability: containmentsAvailability,
                      district: district,
                      districtZoneType: districtZoneType,
                      inContainmentZone: inContainmentZone,
                    ),
                  ),
                );
              },
              text: 'VIEW ZONE',
            ),
            OptionBox(
              onTap: () {
                Navigator.pushNamed(context, WebviewHeatmap.routeName);
              },
              text: 'VIEW HEATMAP',
            ),
            OptionBox(
              onTap: () {
                Navigator.pushNamed(context, WebviewAdvisory.routeName);
              },
              text: 'ADVISORY',
            ),
          ],
        ),
      ),
    );
  }
}
