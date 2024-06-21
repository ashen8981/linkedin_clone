import 'package:flutter/material.dart';

Widget commonText(
    String text, {
      double fontSizeFactor = 0.05,
      FontWeight fontWeight = FontWeight.normal,
      TextAlign textAlign = TextAlign.left,
      Color color = Colors.black,
      FontStyle fontStyle = FontStyle.normal,
    }) {
  return Builder(
    builder: (BuildContext context) {
      return Text(
        text,
        textAlign: textAlign,
        style: TextStyle(
          fontSize: fontSizeFactor,
          fontWeight: fontWeight,
          color: color,
          fontStyle: fontStyle,
        ),
      );
    },
  );
}




