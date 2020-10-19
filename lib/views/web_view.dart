import 'dart:async';

import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_news/widgets/widget.dart';
//import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewNews extends StatefulWidget {
  final String NewsURL;
  WebViewNews({this.NewsURL});
  @override
  _WebViewNewsState createState() => _WebViewNewsState();
}

class _WebViewNewsState extends State<WebViewNews> {
  //bool isSwitched = false;

  final Completer<WebViewController> _controller =
      Completer<WebViewController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AppName(),
        elevation: 0.0,
        //backgroundColor: Colors.white,
        centerTitle: true,
        //iconTheme: IconThemeData(color: Colors.black),
        // actions: [
        //   Switch(
        //     value: isSwitched,
        //     onChanged: (value) {
        //       toggleTheme();
        //       setState(() {
        //         isSwitched = value;
        //       });
        //     },
        //   )
        // ],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: WebView(
          initialUrl: widget.NewsURL,
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (WebViewController webViewController) {
            _controller.complete(webViewController);
          },
        ),
      ),
    );
  }

  // void toggleTheme() {
  //   DynamicTheme.of(context).setBrightness(
  //       Theme.of(context).brightness == Brightness.dark
  //           ? Brightness.light
  //           : Brightness.dark);
  // }
}
