import 'dart:ui';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:useful_stuffs/utils/colors.dart';
import 'package:useful_stuffs/utils/ui_helper.dart';

extension StringConverter on String {
  /*
  HexからColorを返す
  */
  Color hexToColor() {
    final buffer = StringBuffer();
    if (length == 6 || length == 7) buffer.write('ff');
    buffer.write(replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  /*
  文字列をDataTimeに変換
  ex)
  03/20 -> 今年の3月20日
   */
  DateTime get toTodayDateTimeFromStringDate {
    List<String> targets = split('/');
    int month = int.parse(targets[0]);
    int day = int.parse(targets[1]);
    DateTime now = DateTime.now();
    return DateTime(now.year, month, day, 0, 0, 0);
  }

  /*
  文字列の時間をdoubleの分に換算する
  ex)
  9:00 -> 540
  9:30 -> 570
   */
  double toMinutesFromStringTime() {
    List<String> targets = split(':');
    double hour = double.parse(targets[0]);
    double minute = double.parse(targets[1]);
    return hour * 60.0 + minute;
  }

  /*
  現在日時を指定の時分で置き換える
  ex)
  '09:00' -> YYYY-MM-DD 9:00:00
   */
  DateTime replaceTimeMinutes() {
    List<String> targets = split(':');
    int hour = int.parse(targets[0]);
    int minute = int.parse(targets[1]);
    DateTime now = DateTime.now();
    return DateTime(now.year, now.month, now.day, hour, minute, 0);
  }

  /*
  ２つの文字列時分秒から経過時間(分)を算出する
  ex) '9:00'と'18:00' -> 540
  */
  int differenceOfStartAndEnd(String end) {
    if (isEmpty || end.isEmpty) {
      return 0;
    }
    return (end.toMinutesFromStringTime() - this.toMinutesFromStringTime())
        .toInt();
  }

  ///頻繁に使用するテキストパターン
  Widget regularText(
      {TextAlign align = TextAlign.start,
      double fontSize = 14.0,
      Color color = customSwatch,
      FontWeight fontWeight = FontWeight.bold,
      bool isNumberAdjust = false,
      double letterSpacing = 3.0,
      bool isDarkModeChange = false,
      required BuildContext context}) {
    List<FontFeature> _fontFeatures = [];
    if (isNumberAdjust) {
      _fontFeatures.add(const FontFeature.tabularFigures());
    }
    if (isDarkModeChange && Theme.of(context).brightness == Brightness.dark) {
      color = const Color(0xffA4B2BD);
    }
    return Text(this,
        style: TextStyle(
          fontFamilyFallback: const [NotoSansJP],
          fontFeatures: _fontFeatures,
          fontSize: fontSize,
          fontWeight: fontWeight,
          letterSpacing: letterSpacing,
          decoration: TextDecoration.none,
          color: color,
        ),
        textAlign: align,
        locale: const Locale('ja', 'JP'));
  }

  String get dateTimeStringUTC {
    final _t1 = replaceAll('/', '-');
    final _t2 = _t1.replaceAll(' ', 'T');
    return '$_t2.000000+09:00';
  }

  String get creditCardMask {
    final newCardNumber = trim();
    var newStr = '';
    const step = 4;

    for (var i = 0; i < newCardNumber.length; i += step) {
      newStr +=
          newCardNumber.substring(i, math.min(i + step, newCardNumber.length));
      if (i + step < newCardNumber.length) newStr += ' ';
    }
    return newStr;
  }
}
