import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:noonting_webview/const/color.dart';
import 'package:noonting_webview/screen/home_screen.dart';

void main() {
  runApp(ProviderScope(
    child: MaterialApp(
      theme: ThemeData(
          backgroundColor: PRIMARY_COLOR, canvasColor: Color(0xFFE8E8E8)),
      home: HomeScreen(),
    ),
  ));
}
