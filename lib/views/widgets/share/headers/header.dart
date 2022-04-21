import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:metro/services/colors.dart';
import 'package:metro/services/route_management.dart';
import 'package:metro/services/settings.dart';
import 'package:metro/services/text/texts.dart';
import 'package:metro/views/widgets/share/texts/styled_text.dart';

class Header extends StatelessWidget {
  const Header({this.hasBackArrow = true, this.title, this.leftWidget, Key? key}) : super(key: key);

  final String? title;
  final bool hasBackArrow;
  final Widget? leftWidget;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      color: white,
      padding: EdgeInsets.only(right: hasBackArrow ? 20 : 29),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Visibility(
                visible: hasBackArrow,
                child: GestureDetector(
                  child: Container(
                    width: 24,
                    height: 24,
                    margin: const EdgeInsets.only(left: 15),
                    alignment: Alignment.center,
                    child: SvgPicture.asset(
                      icon('arrow-right'),
                      color: svgColor,
                    ),
                  ),
                  onTap: () {
                    RouteManagement.back();
                  },
                ),
              ),
              title != ''
                  ? StyledTextShow(
                      title!,
                      size: font20,
                      color: lighterGrayText,
                bold: true,
                    )
                  : Container()
            ],
          ),
          leftWidget ?? Container()
        ],
      ),
    );
  }
}
