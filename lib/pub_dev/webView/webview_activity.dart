import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewActivity extends StatefulWidget {
  const WebViewActivity({super.key});

  @override
  State<WebViewActivity> createState() => _WebViewActivityState();
}

class _WebViewActivityState extends State<WebViewActivity> {
  late final WebViewController controller;

  int loadingPercentage = 0;

  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..setNavigationDelegate(NavigationDelegate(
        onPageStarted: (url) {
          setState(() {
            loadingPercentage = 0;
          });
        },
        onProgress: (progress) {
          setState(() {
            loadingPercentage = progress;
          });
        },
        onPageFinished: (url) {
          setState(() {
            loadingPercentage = 100;
          });
        },
        onNavigationRequest: (navigation) {
          final host = Uri.parse(navigation.url).host;
          if (host.contains('youtube.com')) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  'Blocking navigation to $host',
                ),
              ),
            );
            return NavigationDecision.prevent;
          }
          return NavigationDecision.navigate;
        },
      ))
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(
        Uri.parse('https://flutter.dev'),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter WebView'),
      ),
      body: WebViewWidget(
        controller: controller,
      ),
    );
  }

  Future<void> _back() async {
    if (await controller.canGoBack()) {
      await controller.goBack();
    } else {
      // Do something
    }
  }

  Future<void> _forward() async {
    if (await controller.canGoForward()) {
      await controller.goForward();
    } else {
      // Do something
    }
  }

  Future<void> _runJs() async {
    controller.runJavaScriptReturningResult('navigator.userAgent');
  }
}
