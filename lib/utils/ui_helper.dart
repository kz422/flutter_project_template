import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';

import '../constants.dart';

class ScreenType {
  static double get _ppi => (Platform.isAndroid || Platform.isIOS) ? 150 : 96;

  static bool isLandscape(BuildContext c) =>
      MediaQuery.of(c).orientation == Orientation.landscape;

  /// Pixels
  static Size size(BuildContext c) => MediaQuery.of(c).size;

  static double width(BuildContext c) => size(c).width;

  static double height(BuildContext c) => size(c).height;

  static double diagonal(BuildContext c) {
    Size s = size(c);
    return sqrt((s.width * s.width) + (s.height * s.height));
  }

  /// Inches
  static Size inches(BuildContext c) {
    Size pxSize = size(c);
    return Size(pxSize.width / _ppi, pxSize.height / _ppi);
  }

  static double widthInches(BuildContext c) => inches(c).width;

  static double heightInches(BuildContext c) => inches(c).height;

  static double diagonalInches(BuildContext c) => diagonal(c) / _ppi;

  static bool isSmallDevice(BuildContext c) =>
      MediaQuery.of(c).size.width <= 320.0;

  static bool isBigDevice(BuildContext c) =>
      MediaQuery.of(c).size.width >= 414.0;
}

//font family
const DIN1451StdMittelschrift = 'DIN1451StdMittelschrift';
const Southpaw = 'Southpaw';
const NotoSansJP = 'NotoSansJP';
const NotoSansJPMedium = 'NotoSansJP-Medium';
const NotoSansJPLight = 'NotoSansJP-Light';
const RobotoMedium = 'Roboto-Medium';


const emptySizedBox = SizedBox();

const defaultSizedBox = SizedBox(
  width: defaultSpacing,
  height: defaultSpacing,
);

const inputLabelStyle = TextStyle(
  fontSize: 13,
  color: black,
);

const labelIndigo15Bold = TextStyle(
  fontSize: 15,
  fontWeight: FontWeight.bold,
  color: Colors.indigo,
);

const labelBlack15Bold = TextStyle(
  fontSize: 15,
  fontWeight: FontWeight.bold,
  color: black,
);

const labelGrey15 = TextStyle(
  fontSize: 15,
  color: gray,
);

const labelGrey9 = TextStyle(
  fontSize: 9,
  color: gray,
);

const labelPrimary15 = TextStyle(
  fontSize: 15,
  color: primaryColor,
);

const labelBlack15 = TextStyle(
  fontSize: 15,
  color: black,
);

const labelWhite15 = TextStyle(
  fontSize: 15,
  color: white,
);

const labelWhite15Bold = TextStyle(
  fontSize: 7,
  fontWeight: FontWeight.bold,
  color: white,
);

const labelBlack13Bold = TextStyle(
  fontSize: 13,
  fontWeight: FontWeight.bold,
  color: black,
);

const labelPrimary15Bold = TextStyle(
  fontSize: 15,
  fontWeight: FontWeight.bold,
  color: primaryColor,
);

const labelPrimary12Bold = TextStyle(
  fontSize: 12,
  fontWeight: FontWeight.bold,
  color: primaryColor,
);

const labelGrey18 = TextStyle(
  fontSize: 18,
  color: gray,
);

const labelPrimary12 = TextStyle(
  fontSize: 12,
  color: primaryColor,
);

const labelGrey12Bold = TextStyle(
  fontSize: 12,
  fontWeight: FontWeight.bold,
  color: gray,
);

const labelGrey12 = TextStyle(
  fontSize: 12,
  color: gray,
);

const labelWhite10 = TextStyle(
  fontSize: 10,
  color: white,
);

const labelGrey10 = TextStyle(
  fontSize: 10,
  color: gray,
);

const labelBlack25Bold = TextStyle(
  fontSize: 25,
  fontWeight: FontWeight.bold,
  color: black,
);

const styleBlack14 = TextStyle(
  fontSize: 14,
  fontWeight: FontWeight.bold,
  color: black,
);

final boxDecoration1 = BoxDecoration(
  color: snow,
  borderRadius: BorderRadius.circular(15),
);

final boxDecoration2 = BoxDecoration(
  color: white,
  borderRadius: BorderRadius.circular(15),
  boxShadow: const [
    BoxShadow(
      color: gray,
      blurRadius: 1.0,
      spreadRadius: 1.0,
    ),
  ],
);

final boxDecoration3 = BoxDecoration(
  color: white,
  borderRadius: BorderRadius.circular(15),
  boxShadow: const [
    BoxShadow(
      color: gray,
      blurRadius: 0.5,
      spreadRadius: 0.5,
    ),
  ],
);

const backIcon = Icon(
  Icons.arrow_back,
);

const cartPlusIconPrimary = Icon(
  Icons.add_circle_outline,
  color: primaryColor,
  size: 25,
);

const cartPlusIconWhite = Icon(
  Icons.add_circle_outline,
  color: white,
  size: 25,
);

const cartMinusIconPrimary = Icon(
  Icons.remove_circle_outline,
  color: primaryColor,
  size: 25,
);

const cartMinusIconWhite = Icon(
  Icons.remove_circle_outline,
  color: white,
  size: 25,
);

const menuIcon = Icon(
  Icons.menu,
  color: primaryColor,
  size: 25,
);

const deleteIcon = Icon(
  Icons.close,
  color: Colors.red,
  size: 25,
);

const smallDeleteIcon = Icon(
  Icons.cancel,
  color: Colors.red,
  size: 20,
);

const searchIconWhite = Icon(
  Icons.search,
  color: primaryColor,
  size: 25,
);

const searchIconPrimary = Icon(
  Icons.search,
  color: primaryColor,
  size: 25,
);

const cancelIcon = Icon(
  Icons.cancel,
  color: primaryColor,
  size: 25,
);

const Widget loadingWidget = Text('');

enum AppBarSearchType { normal, withBack, withCancel }

final appBarHeight = AppBar().preferredSize.height;

const vacancyEnoughIcon = Icon(
  Icons.circle_outlined,
  color: Colors.lightBlue,
);

const vacancyScarceIcon = Icon(
  Icons.warning_amber,
  color: Colors.yellow,
);


// const vacancyTooLateIcon = Icon(
//   Icons.clear,
//   color: Colors.grey,
// );

const checkIcon = Icon(
  Icons.check,
  color: Colors.green,
);

const sendIcon = Icon(
  Icons.send,
  color: Colors.blue,
);

const vacancyUnavailableIcon = Icon(
  Icons.clear,
  color: Colors.grey,
);

const vacancySelectedIcon = checkIcon;

final vacancySelectedStack = Stack(
  children: const [
    Align(
      // alignment: Alignment.bottomCenter,
      child: Text(
        '選択中',
        style: TextStyle(
          color: Colors.green,
          fontSize: 12,
        ),
      ),
    ),
    Align(
      alignment: Alignment.topLeft,
      child: vacancySelectedIcon,
    ),
  ],
);

const boxShadows = [
  BoxShadow(
    color: Colors.black26,
    spreadRadius: 0.1,
    blurRadius: 3.0,
    // offset: Offset(-2, -2),
  )
];
