import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:social_share/social_share.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ArticleView extends StatefulWidget {
  final String url;
  ArticleView(this.url);

  @override
  _ArticleViewState createState() => _ArticleViewState();
}

class _ArticleViewState extends State<ArticleView> {
  final Completer<WebViewController> _completer =
      Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.only(right: 25.0),
            icon: Icon(
              Icons.share,
              color: Colors.white,
            ),
            onPressed: (){
              SocialShare.shareWhatsapp("Hello World");
            }
          )
        ],
        backgroundColor: Colors.black,
        shadowColor: Colors.white54,
        centerTitle: true,
        title: Text(
          '#nustaNews',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      body: WebView(
        initialUrl: widget.url,
        onWebViewCreated: ((WebViewController webViewController) {
          _completer.complete(webViewController);
        }),
      ),
    );
  }
}
