import 'package:flutter/material.dart';

extension DoubleConverter on double {
  double responsiveWidth(BuildContext context) {
    return this * (MediaQuery.of(context).size.width / 100);
  }

  double responsiveHeight(BuildContext context) {
    return this * (MediaQuery.of(context).size.height / 100);
  }

  double responsiveWidthSafeArea(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final double safeArea = mediaQuery.padding.left + mediaQuery.padding.right;
    return this * ((mediaQuery.size.width - safeArea) / 100);
  }

  double responsiveHeightSafeArea(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final double safeArea = mediaQuery.padding.top + mediaQuery.padding.bottom;
    return this * ((mediaQuery.size.height - safeArea) / 100);
  }
}
