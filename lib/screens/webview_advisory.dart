import 'dart:async';

import 'package:flutter/material.dart';
import 'package:unisys/utilities/constants.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebviewAdvisory extends StatelessWidget {
  static const routeName = "kfdjgdlasdakasdasdf";

  final Completer<WebViewController> _controller =
      Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'COVID-19 Advisory',
            style: kAppBarText,
          ),
        ),
        body: 
        Center(
          child: WebView(
            initialUrl:
                'https://www.who.int/emergencies/diseases/novel-coronavirus-2019/advice-for-public',
            javascriptMode: JavascriptMode.unrestricted,
            onWebViewCreated: (WebViewController webViewController) {
              _controller.complete(webViewController);
            },
          ),
        ),
      ),
    );
  }
}
