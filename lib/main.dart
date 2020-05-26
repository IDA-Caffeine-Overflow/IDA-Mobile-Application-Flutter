import 'package:flutter/material.dart';
import 'package:unisys/screens/covid_home.dart';
import 'package:unisys/screens/home_screen.dart';
import 'package:unisys/screens/phone_number_page.dart';
import 'package:unisys/screens/pre_home.dart';
import 'package:unisys/screens/first.dart';
import 'package:unisys/screens/ph2.dart';
import 'package:unisys/screens/report_covid.dart';
import 'package:unisys/screens/report_emergency_covid.dart';
import 'package:unisys/screens/report_emergency_page.dart';
import 'package:unisys/screens/success.dart';
import 'package:unisys/screens/summary_covid.dart';
import 'package:unisys/screens/summary_page.dart';
import 'package:unisys/screens/symptoms_page.dart';
import 'package:unisys/screens/view_zone.dart';
import 'package:unisys/screens/webview_advisory.dart';
import 'package:unisys/screens/webview_guide.dart';
import 'package:unisys/screens/webview_heatmap.dart';
import 'package:unisys/utilities/constants.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Unisys',
      theme: ThemeData(
        scaffoldBackgroundColor: kBackgroundColor,
        appBarTheme: AppBarTheme(
          color: kAppBarColor,
          brightness: Brightness.light,
          elevation: 6.0,
          iconTheme: IconThemeData(
            color: kBackgroundColor,
          ),
          actionsIconTheme: IconThemeData(
            color: kBackgroundColor,
          ),
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => First(),
        First.routeName: (context) => First(),
        PreHome.routeName: (context) => PreHome(),
        HomeScreen.routeName: (context) => HomeScreen(),
        PhoneNumberPage.routeName: (context) => PhoneNumberPage(),
        PhoneNumberPage2.routeName: (context) => PhoneNumberPage2(),
        ReportEmergencyPage.routeName: (context) => ReportEmergencyPage(),
        SummaryPage.routeName: (context) => SummaryPage(),
        WebviewGuide.routeName: (context) => WebviewGuide(),
        Success.routeName: (context) => Success(),
        CovidHome.routeName: (context) => CovidHome(),
        ReportCovid.routeName: (context) => ReportCovid(),
        SymptomsPage.routeName: (context) => SymptomsPage(),
        ReportEmergencyCovid.routeName: (context) => ReportEmergencyCovid(),
        SummaryCovid.routeName: (context) => SummaryCovid(),
        ViewZone.routeName: (context) => ViewZone(),
        WebviewHeatmap.routeName: (context) => WebviewHeatmap(),
        WebviewAdvisory.routeName: (context) => WebviewAdvisory(),
      },
    );
  }
}
