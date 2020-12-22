import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class HomePage extends StatelessWidget {

  final String url;

  const HomePage({Key key, this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('SCSK'),),
      body: InAppWebView(
        initialUrl: url,
        initialOptions: InAppWebViewGroupOptions(
          crossPlatform: InAppWebViewOptions(
            debuggingEnabled: true,
          ),
        ),
        onWebViewCreated: (InAppWebViewController controller) {
        },
        onConsoleMessage: (InAppWebViewController controller, ConsoleMessage consoleMessage) {

        },
        onLoadHttpError: (controller, url, statusCode, description) {

        },
        onLoadError: (controller, url, code, message) {

        },
      ),
    );
  }
}
