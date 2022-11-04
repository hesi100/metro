import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/cupertino.dart';

import '../../../model/station_model.dart';
import '../../../services/colors.dart';
import '../../../services/settings.dart';
import '../../../services/text/texts.dart';
import '../share/texts/styled_text.dart';

class NextTrainTime extends StatelessWidget {
  const NextTrainTime({required this.station,Key? key}) : super(key: key);
  final StationModel station;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          children: [
            Column(
              children: [
                StyledTextShow(getMinutesToNext(station.timesToFirstStation), size: font12, color: textLight),
                StyledTextShow(station.name ==   "ایستگاه "  +station.firstStationName ? "تا رسیدن قطار بعدی" : "تا حرکت قطار بعدی", bold: true, size: font12, color: textLight),
                Visibility(
                    visible: station.name != "ایستگاه "  +station.firstStationName && station.name != "ایستگاه "  +station.lastStationName,
                    child: StyledTextShow("به سمت " + station.firstStationName,
                        bold: true, size: font12, color: textLight)),
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
                StyledTextShow(getMinutesToNext(station.timesToLastStation), size: font12, color: textLight),
                StyledTextShow("ایستگاه " + station.lastStationName == station.name ? "تا رسیدن قطار بعدی" : "تا حرکت قطار بعدی", bold: true, size: font12, color: textLight),
                Visibility(
                    visible:  station.name !=  "ایستگاه " + station.firstStationName && station.name !=  "ایستگاه " + station.lastStationName,
                    child: StyledTextShow("به سمت " + station.lastStationName,
                        bold: true, size: font12, color: textLight)),

              ],
            ),
          ],
        ),
        // Container(
        //   height: 29,
        //   width: 29,
        //   padding: const EdgeInsets.all(5),
        //   decoration: BoxDecoration(
        //     borderRadius: BorderRadius.circular(8),
        //     gradient: const RadialGradient(
        //       center: Alignment.topLeft,
        //       stops: [0.1,0.99],
        //       colors: [Color(0xff85D3FF),Color(0xff2596D7),
        //       ]
        //     ),
        //
        //   ),
        //   child: SvgPicture.asset(icon("feather_arrow_right"),width: 20),
        // )
      ],
    );
  }
}
