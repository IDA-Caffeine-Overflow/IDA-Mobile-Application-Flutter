import 'package:flutter/material.dart';
import 'package:unisys/custom_widgets/location_box.dart';
import 'package:unisys/custom_widgets/zone_box.dart';
import 'package:unisys/utilities/constants.dart';

class ViewZone extends StatelessWidget {
  static const routeName = "ahojkhkasf";
  final latitude;
  final longitude;
  final containmentsAvailability;
  final containmentZoneName;
  final district;
  final districtZoneType;
  final inContainmentZone;

  ViewZone({
    this.latitude,
    this.longitude,
    this.containmentZoneName,
    this.containmentsAvailability,
    this.district,
    this.districtZoneType,
    this.inContainmentZone,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Your Zone',
            style: kAppBarText,
          ),
        ),
        body: Column(
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ZoneBox(
                      stat: 'District',
                      value: district.toString(),
                    ),
                  ),
                  Expanded(
                    child: ZoneBox(
                      stat: 'Zone',
                      value: districtZoneType.toString(),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: LocationBox(
                lat: latitude,
                long: longitude,
              ),
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ZoneBox(
                      stat: 'Contained Zone',
                      value: inContainmentZone.toString() == "false"
                          ? "Your zone is not a Containment Zone"
                          : "Your zone is a Containment Zone",
                    ),
                  ),
                  Expanded(
                    child: ZoneBox(
                      stat: 'Zone Name',
                      value: containmentZoneName.toString() == "NA"
                          ? 'Not a Containment Zone'
                          : containmentZoneName.toString(),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
