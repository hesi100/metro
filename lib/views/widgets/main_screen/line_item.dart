import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:metro/model/line_model.dart';
import 'package:metro/services/route_management.dart';
import 'package:metro/services/settings.dart';
import 'package:metro/services/text/texts.dart';
import 'package:metro/views/screen/line_screen.dart';
import 'package:metro/views/widgets/share/texts/styled_text.dart';

class LineItem extends StatelessWidget {
  const LineItem({required this.line, Key? key}) : super(key: key);
  final LineModel line;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: () {
        RouteManagement.goToPage(const LineScreen());
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 18),
        height: 100,
        width: width,
        color: line.color,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            StyledTextShow(
              line.name,
              bold: true,
              size: font24,
              color: Colors.white,
            ),
            SvgPicture.asset(icon("arrow_left"))
          ],
        ),
      ),
    );
  }
}
