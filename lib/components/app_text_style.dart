
import 'package:flutter/material.dart';
import 'package:students/generated/fonts.gen.dart';

class AppTextStyle {
  static const regular = TextStyle(
    fontFamily: FontFamily.playfairDisplay,
    color: Colors.black,
    fontWeight: FontWeight.w300,
    fontSize: 13,
  );

  static const medium = TextStyle(
    fontFamily: FontFamily.playfairDisplay,
    color: Colors.black,
    fontWeight: FontWeight.w500,
    fontSize: 16,
  );



  static const large = TextStyle(
    fontFamily: FontFamily.playfairDisplayBold,
    color: Colors.black,
    fontWeight: FontWeight.bold,
    fontSize: 20,
  );

  static const largeNormal = TextStyle(
    fontFamily: FontFamily.playfairDisplay,
    color: Colors.black,
    fontWeight: FontWeight.normal,
    fontSize: 20,
  );

  static const largeItalic = TextStyle(
    fontFamily: FontFamily.playfairDisplayItalic,
    color: Colors.black,
    fontSize: 20,
  );

  static const extraLarge = TextStyle(
    fontFamily: FontFamily.playfairDisplay,
    color: Colors.black,
    fontWeight: FontWeight.normal,
    fontSize: 32,
  );



  static const superLarge = TextStyle(
    fontFamily: FontFamily.playfairDisplay,
    color: Colors.black,
    fontWeight: FontWeight.normal,
    fontSize: 64,
  );

  // light theme

  static const extraLargeLight = TextStyle(
    fontFamily: FontFamily.playfairDisplay,
    color: Colors.white,
    fontWeight: FontWeight.normal,
    fontSize: 32,
  );

  static const largeNormalLight = TextStyle(
    fontFamily: FontFamily.playfairDisplay,
    color: Colors.white,
    fontWeight: FontWeight.normal,
    fontSize: 20,
  );

  static const mediumLight = TextStyle(
    fontFamily: FontFamily.playfairDisplay,
    color: Colors.white,
    fontWeight: FontWeight.w500,
    fontSize: 16,
  );
}
