import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:noonting_webview/component/web_view_screen/app_bar_text_field.dart';
import 'package:noonting_webview/const/color.dart';
import 'package:noonting_webview/const/url.dart';
import 'package:noonting_webview/provider/url_provider.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewAppBar extends ConsumerWidget {
  final WebViewController controller;

  const WebViewAppBar({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final double _iconSize = 30;

    final urlState = ref.watch(urlProvider);

    goUrl(urlState!);

    return AppBar(
      titleSpacing: 0,
      backgroundColor: PRIMARY_COLOR,
      title: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          SizedBox(
              width: _iconSize,
              child: IconButton(
                onPressed: () {
                  ref
                      .read(urlProvider.notifier)
                      .update((state) => NOONTING_WEB_URL);
                },
                icon: Icon(Icons.home),
              )),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: AppBarTextField(),
            ),
          ),
          SizedBox(
            width: _iconSize,
            child: IconButton(
                onPressed: () {
                  final _u = ref.read(urlFieldProvider);
                  _u != null
                      ? ref.read(urlProvider.notifier).update(
                            (state) => _u,
                          )
                      : null;
                },
                icon: Icon(Icons.search)),
          )
        ]),
      ),
    );
  }

  void goUrl(String urlState) {
    controller.loadUrl('https://$urlState');
  }
}
