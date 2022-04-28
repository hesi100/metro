import 'package:flutter/material.dart';

import '../../../../services/colors.dart';
import '../../../../services/text/texts.dart';
import '../loading/loading.dart';

class Button extends StatefulWidget {
  const Button({
    required this.onTap,
    required this.text,
    this.color = mainColor,
    this.rightIcon,
    this.leftIcon,
    this.textColor = semiBlackText,
    this.borderRadius = const BorderRadius.all(Radius.circular(8)),
    this.fontSize = font16,
    this.borderColor = Colors.transparent,
    this.bold = false,
    this.loading = false,
    this.height = 40,
    this.width,
    Key? key,
  }) : super(key: key);

  final Color color;
  final String text;
  final double fontSize;
  final Color textColor;
  final bool bold;
  final Color borderColor;
  final Widget? rightIcon;
  final Widget? leftIcon;
  final VoidCallback onTap;
  final bool loading;
  final double height;
  final double? width;
  final BorderRadius borderRadius;

  @override
  _ButtonState createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Material(
        clipBehavior: Clip.antiAlias,
        borderRadius: widget.borderRadius,
        child: InkWell(
            child: Container(
              width: widget.width ?? width,
              height: widget.height,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: widget.color,
                  borderRadius: widget.borderRadius,
                  gradient: const RadialGradient(colors: [
                    mainColorDark,
                    mainColor,
                  ], stops: [
                    0.2,
                    0.8
                  ], focalRadius: 5, focal: Alignment.center),
                  border: Border.all(color: widget.borderColor, width: 1.5)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  widget.rightIcon ?? Container(),
                  Loading(
                    color: widget.textColor,
                    size: 20,
                    isLoading: widget.loading,
                    child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: Text(
                          widget.text,
                          style: textStyle(
                            widget.fontSize,
                            widget.textColor,
                            fontWeight: widget.bold ? FontWeight.w700 : FontWeight.w400,
                          ),
                        )),
                  ),
                  widget.leftIcon ?? Container()
                ],
              ),
            ),
            onTap: () => widget.onTap()),
      ),
    );
  }
}
