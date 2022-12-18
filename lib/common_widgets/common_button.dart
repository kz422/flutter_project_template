import 'package:flutter/material.dart';

import '../constants.dart';

class CommonButton extends StatelessWidget {
  const CommonButton(
      {required this.label,
      this.onPressed,
      this.color = orange,
      this.textColor = Colors.white,
      this.width = 88,
      this.height = 38,
      this.labelFontSize = 11,
      this.labelFontWeight = FontWeight.normal,
      this.icon,
      this.isSimple = false,
      this.isEnable = false,
      Key? key})
      : super(key: key);
  final String label;
  final Function()? onPressed;
  final Color? color;
  final Color? textColor;
  final double width;
  final double height;
  final double labelFontSize;
  final FontWeight labelFontWeight;
  final Icon? icon;
  final bool isSimple;
  final bool isEnable;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        style: TextButton.styleFrom(
          backgroundColor: isSimple ? Colors.white : color,
          padding: const EdgeInsets.symmetric(
            horizontal: defaultSpacing * 1.5,
            vertical: defaultSpacing,
          ),
          side: BorderSide(
            color: isSimple ?  (color ?? orange) : Colors.white,
            width: 1,
            style: BorderStyle.solid,
          ),
        ),
        onPressed: onPressed,
        child: icon != null
        ? Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon!,
            const SizedBox(width: defaultSpacing/2),
            Text(label, style: TextStyle(color: isSimple ? color : textColor, fontWeight: labelFontWeight, fontSize: labelFontSize)),
          ],
        )
        : Text(label, style: TextStyle(color: isSimple ? color : textColor, fontWeight: labelFontWeight, fontSize: labelFontSize)),
      ),
    );
  }
}
