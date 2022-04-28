import 'package:flutter/cupertino.dart';

const double font8 = 8;
const double font10 = 10;
const double font12 = 12;
const double font14 = 14;
const double font16 = 16;
const double font18 = 18;
const double font20 = 20;
const double font22 = 22;
const double font24 = 24;
const double font26 = 26;
const double font28 = 28;
const double font30 = 30;
const double font32 = 32;
const double font40 = 40;

const Map weights = {
  'thin': FontWeight.w100,
  'light': FontWeight.w300,
  'regular': FontWeight.w400,
  'medium': FontWeight.w500,
  'bold': FontWeight.w700,
  'extraBold': FontWeight.w800,
  'black': FontWeight.w900,
};

String fontFamily = 'iranYekan';

TextStyle textStyle(size, color, {fontWeight = FontWeight.normal, height = 1.0, dec = TextDecoration.none}) {
  return TextStyle(fontFamily: fontFamily, fontSize: size, color: color, fontWeight: fontWeight, height: height, decoration: dec);
}
