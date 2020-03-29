import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
class Website extends StatefulWidget {
  @override
  _WebsiteState createState() => _WebsiteState();
}

class _WebsiteState extends State<Website> {
  var urlString = "https://vishalkanu.herokuapp.com/";
  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      appBar: AppBar(
        title: Text(
          "About Developer(Please wait)",
        ),
      ),
      url: urlString,
      withZoom: false,
    );
  }
}

