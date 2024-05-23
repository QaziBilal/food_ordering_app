import 'dart:math';

import 'package:flutter/material.dart';
import 'package:food_ordering_app/src/helper/constants.dart';

Widget customText(
  BuildContext context,
  text, {
  double size = 10.0,
  fontWeight = FontWeight.w100,
  Color color = Colors.white,
  textAlign = TextAlign.center,
  fontstyle = FontStyle.normal,
}) {
  return Text(
    text,
    textAlign: textAlign,
    textScaleFactor: ScaleSize.textScaleFactor(context),
    style: TextStyles.style.copyWith(
        fontSize: size,
        fontWeight: fontWeight,
        color: color,
        fontStyle: fontstyle,
        height: 1.6),
  );
}

class ScaleSize {
  static double textScaleFactor(BuildContext context,
      {double maxTextScaleFactor = 2}) {
    final width = MediaQuery.of(context).size.width;
    double val = (width / 1400) * maxTextScaleFactor;
    return max(1, min(val, maxTextScaleFactor));
  }
}
