import 'package:flutter/material.dart';
import 'package:useful_stuffs/utils/ui_helper.dart';

class Snack {
  static void showMsg(BuildContext context, String msg,
      {int milliseconds = 4000}) {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            duration: Duration(milliseconds: milliseconds),
            behavior: SnackBarBehavior.floating,
            backgroundColor: Colors.blue,
            content: Text(
              msg,
              style: const TextStyle(fontSize: 15, locale: Locale("ja", "JP"), fontFamilyFallback: [NotoSansJP]),
              textAlign: TextAlign.center,
            ),
          ),
        );
      },
    );
  }

  static void showMsg2(BuildContext context, String msg,
      {int milliseconds = 4000}) {
    WidgetsBinding.instance.addPostFrameCallback(
          (_) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            duration: Duration(milliseconds: milliseconds),
            behavior: SnackBarBehavior.floating,
            backgroundColor: Colors.orange,
            content: Text(
              msg,
              style: const TextStyle(fontSize: 15, locale: Locale("ja", "JP"), fontFamilyFallback: [NotoSansJP]),
              textAlign: TextAlign.center,
            ),
          ),
        );
      },
    );
  }
}
