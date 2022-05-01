import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:metro/model/station_model.dart';
import 'package:metro/services/colors.dart';
import 'package:metro/services/route_management.dart';
import 'package:metro/services/settings.dart';
import 'package:metro/services/text/texts.dart';
import 'package:metro/views/screen/station_screen.dart';
import 'package:metro/views/widgets/share/texts/styled_text.dart';

class StationItem extends StatelessWidget {
  const StationItem({required this.station, Key? key}) : super(key: key);
  final StationModel station;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: () {
        RouteManagement.goToPage(StationScreen(station: station));
      },
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
        ),
        height: 103,
        margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 16),
        width: width,
        decoration: BoxDecoration(color: white, borderRadius: BorderRadius.circular(8)),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  StyledTextShow(
                    station.name,
                    size: font14,
                    color: text,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 4),
                    child: StyledTextShow(
                      station.lineName,
                      bold: true,
                      size: font10,
                      color: textLight,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Column(
                        children: [
                          StyledTextShow("به سمت "+station.firstStationName, bold: true, size: font10, color: textLight),
                          StyledTextShow(getMinutesToNext(station.timesToFirstStation), size: font10, color: textLight),
                        ],
                      ),
                      Container(
                        margin: EdgeInsetsDirectional.only(start: 10),
                        height: 6,
                        width: 6,
                        decoration:
                            BoxDecoration(color: lightBlue, border: Border.all(color: blue, width: 1), shape: BoxShape.circle),
                      ),
                      const DottedLine(
                        direction: Axis.horizontal,
                        lineLength: 72,
                        lineThickness: 1.0,
                        dashLength: 4.0,
                        dashColor: gray,
                        dashRadius: 0.0,
                        dashGapLength: 4.0,
                      ),
                      Container(
                        margin: EdgeInsetsDirectional.only(end: 10),

                        height: 6,
                        width: 6,
                        decoration:
                            BoxDecoration(color: lightBlue, border: Border.all(color: blue, width: 1), shape: BoxShape.circle),
                      ),
                      Column(
                        children: [
                          StyledTextShow("به سمت "+station.lastStationName, bold: true, size: font10, color: textLight),
                          StyledTextShow(getMinutesToNext(station.timesToLastStation), size: font10, color: textLight),
                        ],
                      ),
                    ],
                  ),
                  Container(
                    height: 29,
                    width: 29,
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      gradient: const RadialGradient(
                        center: Alignment.topLeft,
                        stops: [0.1,0.99],
                        colors: [Color(0xff85D3FF),Color(0xff2596D7),
                        ]
                      ),
                      
                    ),
                    child: SvgPicture.asset(icon("feather_arrow_right"),width: 20),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
