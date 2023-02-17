import 'dart:async';
import 'package:flutter/material.dart';
import 'package:useful_stuffs/utils/extensions/string_extensions.dart';

const soundMap = {
  "ios": {
    "LONG_PRESS_ACTIVATE": 1113,
    "LONG_PRESS_CANCEL": 1075,
    "ADD_GEOFENCE": 1114,
    "BUTTON_CLICK": 1104,
    "MESSAGE_SENT": 1303,
    "ERROR": 1006,
    "OPEN": 1502,
    "CLOSE": 1503,
    "FLOURISH": 1509
  },
  "android": {
    "LONG_PRESS_ACTIVATE": "DOT_START",
    "LONG_PRESS_CANCEL": "DOT_STOP",
    "ADD_GEOFENCE": "DOT_SUCCESS",
    "BUTTON_CLICK": "BUTTON_CLICK",
    "MESSAGE_SENT": "WHOO_SEND_SHARE",
    "ERROR": "ERROR",
    "OPEN": "OPEN",
    "CLOSE": "CLOSE",
    "FLOURISH": "POP"
  }
};

/// Util class for launching dialogs.
/// - [confirmTerm]
/// - [confirm]
/// - [alert]
/// - [prompt]
/// - [showLoading]
///
class Dialog {
  static void confirmTerm(BuildContext context, String title, String message,
      Function(bool) callback) {
    showDialog<dynamic>(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          title: title.regularText(
              isDarkModeChange: true, context: context, fontSize: 20),
          content: message.regularText(
              isDarkModeChange: true, context: context, fontSize: 20),
          actions: <Widget>[
            TextButton(
              child: 'キャンセル'.regularText(
                  isDarkModeChange: true, context: context, fontSize: 16),
              onPressed: () {
                callback(false);
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: '確認'.regularText(
                  isDarkModeChange: true, context: context, fontSize: 16),
              onPressed: () {
                callback(true);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  static void confirm(BuildContext context, String title, String message,
      Function(bool) callback,
      {bool isPop = true}) {
    showDialog<dynamic>(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          title: title.regularText(
              isDarkModeChange: true, context: context, fontSize: 20),
          content: message.regularText(
              isDarkModeChange: true, context: context, fontSize: 20),
          actions: <Widget>[
            TextButton(
              child: 'キャンセル'.regularText(
                  isDarkModeChange: true, context: context, fontSize: 16),
              onPressed: () {
                callback(false);
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: '実行'.regularText(
                  isDarkModeChange: true, context: context, fontSize: 16),
              onPressed: () {
                callback(true);
                if (isPop) {
                  Navigator.of(context).pop();
                }
              },
            ),
          ],
        );
      },
    );
  }

  static void alert(BuildContext context, String title, String message,
      [Function? callback]) {
    showDialog<dynamic>(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          title: title.regularText(
              isDarkModeChange: true, context: context, fontSize: 20),
          content: message.regularText(
              isDarkModeChange: true, context: context, fontSize: 20),
          actions: <Widget>[
            TextButton(
              child: 'Ok'.regularText(
                  isDarkModeChange: true, context: context, fontSize: 16),
              onPressed: () {
                if (callback != null) {
                  callback(true);
                }
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  static Future<String> prompt(BuildContext context,
      {String? title, String? labelText, String? hintText, String? value}) {
    TextEditingController controller = TextEditingController(text: value);

    Completer completer = Completer<String>();

    String submittedValue = value ?? '';

    showDialog<String>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: (title ?? '').regularText(
              isDarkModeChange: true, context: context, fontSize: 20),
          contentPadding: const EdgeInsets.all(16.0),
          content: SizedBox(
            height: 100.0,
            child: Column(children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(
                      child: TextField(
                    controller: controller,
                    onChanged: (value) {
                      submittedValue = value;
                    },
                    autofocus: true,
                    decoration: InputDecoration(
                      labelText: labelText,
                      hintText: hintText,
                    ),
                  ))
                ],
              ),
            ]),
          ),
          actions: <Widget>[
            TextButton(
                child: 'キャンセル'.regularText(
                    isDarkModeChange: true, context: context, fontSize: 16),
                onPressed: () {
                  Navigator.of(context).pop();
                }),
            TextButton(
                child: '送信'.regularText(
                    isDarkModeChange: true, context: context, fontSize: 16),
                onPressed: () {
                  Navigator.of(context).pop();
                  completer.complete(submittedValue);
                })
          ],
        );
      },
    );
    return completer.future as Future<String>;
  }

  static Future<CircularProgressIndicator> showLoading(BuildContext context) {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return const CircularProgressIndicator(color: Colors.blueAccent);
        }) as Future<CircularProgressIndicator>;
  }

  static void showLicense(
      BuildContext context, String name, String appVersion) {
    return showLicensePage(
      context: context,
      applicationName: name,
      applicationVersion: appVersion,
    );
  }
}
