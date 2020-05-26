import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebviewGuide extends StatelessWidget {
  static const routeName = "kfdjgdlkjgdf";

  final Completer<WebViewController> _controller =
      Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {
    return WebView(
      initialUrl:
          'https://www.nationalgeographic.com/adventure/features/how-to-survive-natural-disaster-storm-hurricane-expert-tips/',
      javascriptMode: JavascriptMode.unrestricted,
      onWebViewCreated: (WebViewController webViewController) {
        _controller.complete(webViewController);
      },
    );
  }
}
