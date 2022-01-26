import 'package:flutter/cupertino.dart';
import 'package:metro/services/colors.dart';
import 'package:metro/services/text/texts.dart';

class StyledTextShow extends StatelessWidget {
  const StyledTextShow(
    this.text, {
    this.size = font14,
    this.color = semiLightGrayText,
    this.direction = TextAlign.right,
    this.max = 1,
    this.bold = false,
    this.decoration = TextDecoration.none,
    this.height = 1.5,
    this.fontWeight = 'medium',
    this.overflow = TextOverflow.ellipsis,
    Key? key,
  }) : super(key: key);
  final String text;
  final double size;
  final Color color;
  final TextAlign direction;
  final int max;
  final bool bold;
  final TextDecoration decoration;
  final double height;
  final String fontWeight;
  final TextOverflow overflow;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: textStyle(size, color, dec: decoration, fontWeight: bold ? FontWeight.bold : weights[fontWeight], height: height),
      textAlign: direction,
      maxLines: max,
      textDirection: TextDirection.rtl,
      overflow: overflow,
    );
  }
}
