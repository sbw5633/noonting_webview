import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:noonting_webview/const/url.dart';
import 'package:noonting_webview/provider/url_provider.dart';

class AppBarTextField extends ConsumerWidget {
  const AppBarTextField({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(urlProvider);

    TextEditingController controller = TextEditingController();
    return Container(
        color: Color(0x1EFFFFFF),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: TextField(
            decoration: InputDecoration(
                border: InputBorder.none, prefixText: "https://"),
            controller: controller..text = ref.read(urlProvider).toString(),
            onTap: () => controller.selection = TextSelection(
                baseOffset: 0, extentOffset: controller.value.text.length),
            onChanged: (value) {
              ref.read(urlFieldProvider.notifier).update((state) => value);
            },
          ),
        ));
  }
}
