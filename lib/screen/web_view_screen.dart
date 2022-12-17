import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:noonting_webview/component/web_view_screen/web_view_app_bar.dart';
import 'package:noonting_webview/const/color.dart';
import 'package:noonting_webview/const/url.dart';
import 'package:noonting_webview/provider/url_provider.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewScreen extends ConsumerWidget {
  WebViewScreen({super.key});

  WebViewController? controller;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final urlState = ref.watch(urlProvider);

    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight),
          child: controller != null
              ? WebViewAppBar(
                  controller: controller!,
                )
              : AppBar(
                  backgroundColor: PRIMARY_COLOR,
                ),
        ),
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child: Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: WebView(
              onWebViewCreated: (controller) {
                this.controller = controller;
                ref
                    .read(urlProvider.notifier)
                    .update((state) => NOONTING_WEB_URL);
              },
              javascriptMode: JavascriptMode.unrestricted,
              initialUrl: NOONTING_WEB_URL,
            ),
          ),
        ),
      ),
    );
  }
}
