// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class ScreenWebView extends StatefulWidget {
  final String? pageTitle;
  final String? url;
  ScreenWebView(
    this.pageTitle,
    this.url,
  );

  @override
  State<ScreenWebView> createState() => _WebViewState();
}

class _WebViewState extends State<ScreenWebView> {
  double progress = 0;

  InAppWebViewController? controler;
  GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        title: Text(
          widget.pageTitle!,
          style: TextStyle(color: Colors.black, fontSize: 20),
        ),
        centerTitle: true,

      ),
      body: Stack(children: [
        InAppWebView(
          initialUrlRequest: URLRequest(
            url: Uri.parse(widget.url!),
          ),
          onWebViewCreated: (InAppWebViewController _controller) {
            controler = _controller;
          },
          onProgressChanged:
              (InAppWebViewController _controller, int _progress) {
            setState(() {
              progress = _progress / 100;
            });
          },
        ),
        progress < 1
            ? SizedBox(
                child: LinearProgressIndicator(
                  color: Colors.pink,
                  backgroundColor: Colors.white,
                  value: progress,
                ),
              )
            : SizedBox()
      ]),
    );
  }
}


