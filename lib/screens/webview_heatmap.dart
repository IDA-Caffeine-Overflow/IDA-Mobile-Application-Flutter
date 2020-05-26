import 'dart:async';

import 'package:flutter/material.dart';
import 'package:unisys/utilities/constants.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebviewHeatmap extends StatelessWidget {
  static const routeName = "kfdjgdlkasdasdf";

  final Completer<WebViewController> _controller =
      Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Heatmap',
            style: kAppBarText,
          ),
        ),
        body: 
        Center(
          child: WebView(
            initialUrl:
                'https://www.mapbox.cn/coronavirusmap/#3.24/24.54/77.25',
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
