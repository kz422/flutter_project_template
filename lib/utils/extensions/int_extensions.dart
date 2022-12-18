import 'package:intl/intl.dart';

extension IntConverter on int {
  String digits(int length) {
    return '$this'.padLeft(length, '0');
  }

  /*
  分を時：分に文字列に変換する
  ex) 1200 --> '20時間 00分'
  */
  String fromMinuteToTimeAndMinute() {
    return '${(this ~/ 60)}時間 ${((this % 60).digits(2))}分';
  }

  /*
  曜日の番号から曜日の文字を返す
  ex)
  1 -> 月
  0 -> 日
  */
  String getWeekday({String locale = "en_US"}) {
    String formatted = '';
    final now = DateTime.now();
    var formatter = DateFormat('E', locale);
    for (var i = 1; i <= 7; i++) {
      final day = now.add(Duration(days: i));
      if (day.weekday == (this == 0 ? 7 : this)) {
        formatted = formatter.format(day);
        break;
      }
    }
    return formatted;
  }

  /*
  dartでは7が日曜日だが、その他言語の大多数は0が日曜日
  7の場合は0を返すことで、この違いに対応する
  */
  int sundayConverter() {
    return this == 7 ? 0 : this;
  }

  /*
    1000 => '1,000円'
  */
  String priceFormatterKanji({bool tax = false}) {
    final _formatter = NumberFormat("#,###");
    var _result = _formatter.format(this);
    final _tax = tax ? '(税込)' : '';
    return '$_result円$_tax';
  }

  /*
    ¥1000 => '1,000'
  */
  String priceFormatter({bool tax = false, bool negative = false}) {
    final _formatter = NumberFormat("#,###");
    var _result = _formatter.format(this);
    final _tax = tax ? '(税込)' : '';
    final negativeSign = (negative) ? '- ' : '';
    return '$negativeSign¥$_result$_tax';
  }
}
