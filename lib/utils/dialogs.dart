import 'dart:async';
import 'package:flutter/material.dart';
import 'package:useful_stuffs/constants.dart';
import 'package:useful_stuffs/utils/extensions/double_extension.dart';
import 'package:useful_stuffs/utils/extensions/string_extensions.dart';

import '../common_widgets/common_button.dart';
import '../common_widgets/one_check_box.dart';

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
/// - [confim]
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
              //Text(''),  TODO could add some paragrah here before text-field.
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

  static void showAboutDeliveryOfLeftBehind(
    BuildContext context,
    Function(bool) callback,
    bool isChecked,
    Function() add,
    Function() remove,
  ) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return AlertDialog(
            title: const Text('置き配お届けについて'),
            content: SingleChildScrollView(
                controller: ScrollController(),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('置き配オプションは、以下の注意事項にご同意いただいた上でご利用ください。'),
                      const SizedBox(height: defaultSpacing),
                      const Text('お届け時'),
                      const SizedBox(height: defaultSpacing),
                      const Text('・インターホン等での在宅の確認が必須となります。'),
                      const Text('・在宅確認後玄関前またはお客様指定場所への置き配になります。'),
                      const Text('・応答不可の場合はことづて欄にご記入ください。'),
                      const SizedBox(height: defaultSpacing),
                      const Text('お受け取り後'),
                      const SizedBox(height: defaultSpacing),
                      const Text(
                          '・保冷にはドライアイスを使用している場合がございます。やけど等しないようご注意ください。'),
                      const Text(
                          '・ツイディは、置き配の受取場所への配達が完了した後の、荷物の紛失、盗難、汚損、き損、商品の劣化（冷蔵品・冷凍品の温度上昇による劣化も含む）等、及びこれらから生じる全ての損害について一切の責任を負いません。'),
                      const SizedBox(height: defaultSpacing),
                      Row(children: [
                        OneCheckBox(
                            isChecked: isChecked, add: add, remove: remove),
                        const Text('お届け場所の写真を\n領収書メールで受け取る',
                            overflow: TextOverflow.ellipsis),
                      ]),
                      const SizedBox(height: defaultSpacing),
                      Center(
                        child: CommonButton(
                            label: '同意する',
                            onPressed: () {
                              callback(true);
                              Navigator.of(context).pop();
                            },
                            labelFontWeight: FontWeight.bold,
                            labelFontSize: 18,
                            width: 60.0.responsiveWidthSafeArea(context),
                            height: 50),
                      ),
                      const SizedBox(height: defaultSpacing),
                      Center(
                        child: TextButton(
                          child: const Text('閉じる',
                              style: TextStyle(color: Colors.blueAccent)),
                          onPressed: () => Navigator.of(context).pop(),
                        ),
                      ),
                    ])),
          );
        });
  }

  static void ageVerification(
    BuildContext context,
    bool isChecked,
    void Function() add,
    void Function() remove,
  ) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return AlertDialog(
            title: const Text('年齢確認が必要です'),
            content: SingleChildScrollView(
                controller: ScrollController(),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('20歳未満へのお酒・煙草の販売はできません。'),
                      const Text('20歳以上のお客様は、チェックボックスをチェックして「注文する」をタップしてください。'),
                      const Text('20歳未満のお客様の酒類の購入や飲酒は日本の法律により固く禁じられています。'),
                      const SizedBox(height: defaultSpacing),
                      Row(children: [
                        OneCheckBox(
                            isChecked: isChecked, add: add, remove: remove),
                        const Text('20歳以上です', overflow: TextOverflow.ellipsis),
                      ]),
                      const SizedBox(height: defaultSpacing),
                      Center(
                        child: TextButton(
                          child: const Text('閉じる',
                              style: TextStyle(color: Colors.blueAccent)),
                          onPressed: () => Navigator.of(context).pop(),
                        ),
                      ),
                    ])),
          );
        });
  }
}
