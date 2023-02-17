import "package:intl/intl.dart";
import 'package:intl/date_symbol_data_local.dart';
import 'package:useful_stuffs/utils/extensions/int_extensions.dart';

extension DateTimeConverter on DateTime {
  //指定の日時の0時からの分を返す
  double minutesFromZero() {
    return difference(DateTime(year, month, day, 0, 0, 0)).inMinutes.toDouble();
  }

  /*
  DateTime -> String
  */
  String toStartUntilMinutes() {
    return 'year-${month.digits(2)}-${day.digits(2)} ${hour.digits(2)}:${minute.digits(2)}';
  }

  /*
  DateTime -> String
  */
  String toStartUntilDay() {
    return 'year-${month.digits(2)}-${day.digits(2)}';
  }

  /*
  指定日時の0時を返す
  */
  DateTime toStartOfDay() {
    return DateTime(year, month, day, 0, 0, 0);
  }

  /*
  指定日時の23:23:59時を返す
  */
  DateTime toEndOfDay() {
    return DateTime(year, month, day, 23, 59, 59);
  }

  /*
  指定の日付が本日か判断
  */
  bool isToday() {
    final DateTime now = DateTime.now();
    return difference(now).inDays == 0 && day == now.day;
  }

  /*
  指定の日付が翌日か判断
  */
  bool isTomorrow() {
    final DateTime tomorrow = DateTime.now().add(const Duration(days: 1));
    return difference(tomorrow).inDays == 0 && day == tomorrow.day;
  }

  /*
  日付が以上か
  */
  bool isGreaterOrEqual(DateTime date) {
    return isAfter(date) || compareTo(date) == 0;
  }

  /*
  大きい日時を返す
  */
  DateTime getGreater(DateTime date) {
    if (isAfter(date)) {
      return this;
    } else {
      return date;
    }
  }

  /*
  日付が以下か
  */
  bool isLessOrEqual(DateTime date) {
    return isBefore(date) || compareTo(date) == 0;
  }

  /*
  小さい日時を返す
  */
  DateTime getLess(DateTime date) {
    if (isBefore(date)) {
      return this;
    } else {
      return date;
    }
  }

  /*
  指定日時を指定の時分で置き換える
   */
  DateTime margeDateTimeMinutes(String targetTime) {
    List<String> targets = targetTime.split(':');
    int hour = int.parse(targets[0]);
    int minute = int.parse(targets[1]);
    return DateTime(year, month, day, hour, minute, 0);
  }

  /*
  ２つの日時に挟まれてるかどうか(同日は含まない)
  */
  bool isBetween(DateTime start, DateTime end, bool isEqual) {
    if (isEqual) {
      return isGreaterOrEqual(start) && isLessOrEqual(end);
    } else {
      return isAfter(start) && isBefore(end);
    }
  }

  /*
  指定の日付が同じ日か判断
  */
  bool isSameDay(DateTime target) {
    return difference(target).inDays == 0 && day == target.day;
  }

  /*
  日付を指定のフォーマット文字列に変換する(イニシャライズ処理つき)
  */
  Future<String> convertToString(
      {String format = "E dd.MM.yy", String locale = "ja_JP"}) async {
    await initializeDateFormatting(locale);
    var formatter = DateFormat(format, locale);
    var formatted = formatter.format(this);
    return formatted;
  }

  /*
  日付を指定のフォーマット文字列に変換する
  */
  String convertToString2(
      {String format = "yyyy年MM月dd日 HH:mm", String locale = "ja_JP"}) {
    var formatter = DateFormat(format, locale);
    var formatted = formatter.format(this);
    return formatted;
  }

  /*
  指定の日付から今日で何年経過したか算出する
   */
  num passedYear() {
    final days = -(difference(DateTime.now()).inDays);
    return (days / 365).floor();
  }

  /*
  指定年月の全日を取得する
   */
  List<DateTime> getAllDaysInMonth() {
    final lastDateThisMonth =
        DateTime(year, month + 1, 1).subtract(const Duration(days: 1));
    final firstDateThisMonth = DateTime(year, month, 1);
    final targetMonthDateList = List<DateTime>.generate(lastDateThisMonth.day,
        (i) => firstDateThisMonth.add(Duration(days: i)));
    return targetMonthDateList;
  }
}

extension DateTimeNullConverter on DateTime? {
  DateTime notNull() {
    if (this == null) {
      throw UnsupportedError('日付がnullはありえない');
    }
    return this ?? DateTime.now().add(const Duration(days: -100));
  }
}
