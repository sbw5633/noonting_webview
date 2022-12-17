import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:webview_flutter/webview_flutter.dart';

final urlProvider = StateProvider<String?>((ref) => null);

final urlFieldProvider = StateProvider<String?>((ref) => null);
