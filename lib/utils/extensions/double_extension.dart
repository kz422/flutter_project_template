import 'package:flutter/material.dart';

extension DoubleConverter on double {
  double responsiveWidth(BuildContext context) {
    return this * (MediaQuery.of(context).size.width / 100);
  }

  double responsiveHeight(BuildContext context) {
    return this * (MediaQuery.of(context).size.height / 100);
  }

  double responsiveWidthSafeArea(BuildContext context) {
    final _mediaQuery = MediaQuery.of(context);
    final double safeArea =
        _mediaQuery.padding.left + _mediaQuery.padding.right;
    return this * ((_mediaQuery.size.width - safeArea) / 100);
  }

  double responsiveHeightSafeArea(BuildContext context) {
    final _mediaQuery = MediaQuery.of(context);
    final double safeArea =
        _mediaQuery.padding.top + _mediaQuery.padding.bottom;
    return this * ((_mediaQuery.size.height - safeArea) / 100);
  }
}
