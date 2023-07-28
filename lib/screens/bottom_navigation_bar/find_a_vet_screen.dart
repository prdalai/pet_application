import 'package:flutter/material.dart';
import 'package:pet_application/screens/bottom_navigation_bar/bottom_navigation_bar.dart';
import 'package:pet_application/services/navigation_service.dart';
import 'package:webview_flutter/webview_flutter.dart';

class FindAVet extends StatefulWidget {
  const FindAVet({Key? key}) : super(key: key);

  @override
  State<FindAVet> createState() => _FindAVetState();
}

class _FindAVetState extends State<FindAVet> {
  WebViewController? controller;

  @override
  void initState() {
    super.initState();
    controller = WebViewController()
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
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse('https://www.google.com/maps/d/u/0/edit?mid=18xpeWA6ZXmOA5EkVA23VMw3j5qjwHb8&usp=sharing'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Find A Vet'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => _handleBackButtonPressed(context),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: WebViewWidget(
              controller: controller!,
            ),
          ),
        ],
      ),
    );
  }

  void _handleBackButtonPressed(BuildContext context) {
    NavigationService.navigateTo(BottomNavigationScreen(0), context);
  }
}
