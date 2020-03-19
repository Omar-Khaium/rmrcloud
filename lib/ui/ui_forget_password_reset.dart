import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ForgetPasswordResetUI extends StatefulWidget {
  String url;

  ForgetPasswordResetUI(this.url);

  @override
  _ForgetPasswordResetUIState createState() => _ForgetPasswordResetUIState();
}

class _ForgetPasswordResetUIState extends State<ForgetPasswordResetUI> {
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: Icon(
            Icons.clear,
            color: Colors.white,
          ),
          color: Colors.green,
        ),
      ),
      body: SafeArea(
        child: Builder(builder: (BuildContext context) {
          return WebView(
            initialUrl: widget.url,
            javascriptMode: JavascriptMode.unrestricted,
            onWebViewCreated: (WebViewController webViewController) {
              _controller.complete(webViewController);
            },
            javascriptChannels: <JavascriptChannel>[
              _toasterJavascriptChannel(context),
            ].toSet(),
            navigationDelegate: (NavigationRequest request) {
              if (request.url.startsWith('https://www.gratecrm.com/')) {
                Navigator.of(context).pop();
                return NavigationDecision.prevent;
              } else {
                return NavigationDecision.navigate;
              }
              },
            onPageStarted: (String url) {
              showDialog(context: context, builder: (_) => loadingAlert());
            },
            onPageFinished: (String url) {
              Navigator.of(context).pop();
            },
            gestureNavigationEnabled: true,
          );
        }),
      ),
    );
  }

  JavascriptChannel _toasterJavascriptChannel(BuildContext context) {
    return JavascriptChannel(
        name: 'Toaster',
        onMessageReceived: (JavascriptMessage message) {
          Scaffold.of(context).showSnackBar(
            SnackBar(content: Text(message.message)),
          );
        });
  }

  loadingAlert() {
    return WillPopScope(
      onWillPop: () async => false,
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
        child: SimpleDialog(
          contentPadding: EdgeInsets.all(0),
          backgroundColor: Colors.transparent,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          children: <Widget>[
            Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                  width: 100,
                  height: 100,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(24),
                    child: Image.asset(
                      "images/loading.gif",
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
