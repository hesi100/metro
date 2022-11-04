import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:metro/model/station_model.dart';
import 'package:metro/services/colors.dart';
import 'package:metro/services/settings.dart';
import 'package:metro/services/text/texts.dart';
import 'package:metro/views/widgets/share/texts/styled_text.dart';

import '../../../services/route_management.dart';
import '../../screen/station_screen.dart';
import 'next_train_time.dart';

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
        height: 120,
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
                    size: font16,
                    color: text,
                    bold: true,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 4),
                    child: StyledTextShow(
                      station.lineName,
                      bold: true,
                      size: font14,
                      color: textLight,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: NextTrainTime(station: station,),
            )
          ],
        ),
      ),
    );
  }
}
