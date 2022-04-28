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
        padding: const EdgeInsets.symmetric(horizontal: 16, ),
        height: 103,
        margin: EdgeInsets.symmetric(vertical: 6,horizontal: 16),
        width: width,
        decoration: BoxDecoration(
          color: white,
          borderRadius: BorderRadius.circular(8)
        ),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 8),
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
              padding: EdgeInsets.only(top: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                    Column(
                      children: [
                        StyledTextShow(
                          station.firstStationName,
                          bold: true,
                          size: font10,
                          color: textLight
                        ),
                        StyledTextShow(
                            station.lineName,
                            size: font10,
                            color: textLight
                        ),
                      ],
                    ),
                  Padding(
                    padding: const EdgeInsets.only(top: 4),
                    child: StyledTextShow(
                      station.lineName,
                      bold: true,
                      size: font10,
                      color: Color(0xff88879C),
                    ),
                  ),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
