import 'package:edufin/size_config.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewPage extends StatefulWidget {
  const WebViewPage({super.key});

  @override
  State<WebViewPage> createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {
  WebViewController? _controller;

  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://www.youtube.com/')) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(
        Uri.parse(
          'https://sandbox.api.of.ayoconnect.id/cards/virtual/view?lang=id&merchant=sand02&token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJjYXJkRXhwaXJ5IjoiMDYvMjUiLCJjYXJkSWQiOiJDSUpWYW1KU0RsYUsiLCJjYXJkTGFzdFBhbiI6IjIyMzYiLCJlbWFpbCI6ImFkZCoqKioqKioqODc5QG1haWxpbmF0b3IuY29tIiwiZXhwIjoxNjg1ODg3NjczLCJpYXQiOjE2ODU4ODQwNzMsImlzcyI6IkF5b2Nvbm5lY3QgVmlydHVhbCBDYXJkIiwibGltaXQiOjEwMDAwMDAsIm1lcmNoYW50Ijoic2FuZDAyIiwibmFtZSI6IkFkZGllIEtvZXBwIiwic3BlbmQiOjB9.b_jeyL5nRlPTSt3hVCVKVBNcif0CADta5SjZsTpqsbg',
        ),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Card Detail'),
      ),
      body: SafeArea(
        child: WebViewWidget(
          controller: _controller!,
        ),
      ),
    );
  }
}
