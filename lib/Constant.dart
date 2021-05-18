import 'dart:ui';
import 'package:flutter/material.dart';

class Constant{
  static final background = const Color(0xFF08243A);
  static final backgroundFaded = const Color(0xFF08243A).withOpacity(0.38);
  static final textColor = const Color(0xFFFFFFFF);
  static final textColorQuote = const Color(0xFFa9b4b8);
  static final textStyle = TextStyle(color: textColor);
  static final textStyle2 = TextStyle(color: Constant.background);

  static final buttonColor = ButtonStyle(
  backgroundColor: MaterialStateProperty.all<Color>(Constant.background)
  );
  static final ButtonStyle flatButtonStyle = TextButton.styleFrom(
    primary: Constant.background,
    minimumSize: Size(100, 36),
    padding: EdgeInsets.symmetric(horizontal: 16.0),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(0.0)),
    ),
    backgroundColor: Constant.background,
  );

  static final appName = "ThoughtKeeper";
  static final textQuoteDeleted = "Quote deleted";
}