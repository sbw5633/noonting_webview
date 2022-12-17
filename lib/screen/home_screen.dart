import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:noonting_webview/const/color.dart';
import 'package:noonting_webview/screen/web_view_screen.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: PRIMARY_COLOR,
              ),
              onPressed: () {
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (_) => WebViewScreen()),
                    (route) => false);
              },
              child: Text(
                "NoonTing",
                style: TextStyle(fontFamily: 'GamjaFlower', fontSize: 30),
              ))),
    );
  }
}
