import 'package:flutter/material.dart';

extension TimeOfDayNullConverter on TimeOfDay? {
  TimeOfDay notNull() {
    if (this == null) {
      throw UnsupportedError('日付がnullはありえない');
    }
    return this ?? TimeOfDay.now();
  }
}
