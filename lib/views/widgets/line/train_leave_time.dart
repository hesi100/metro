import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/cupertino.dart';

import '../../../model/station_model.dart';
import '../../../services/colors.dart';
import '../../../services/settings.dart';
import '../../../services/text/texts.dart';
import '../share/texts/styled_text.dart';

class TrainLeaveTime extends StatelessWidget {
  const TrainLeaveTime({required this.station,required this.index,Key? key}) : super(key: key);
  final StationModel station;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: white
      ),
      alignment: Alignment.center,
      padding: EdgeInsets.all(16),
      margin: EdgeInsets.symmetric(horizontal: 16,vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Column(
                children: [
                  Visibility(
                      visible: station.name != "ایستگاه "  +station.firstStationName && station.name != "ایستگاه "  +station.lastStationName,
                      child: StyledTextShow("به سمت " + station.firstStationName,
                          bold: true, size: font12, color: textLight)),
                  StyledTextShow(getMinutesToTime(station.timesToFirstStation[index]), size: font12, color: textLight),
                  StyledTextShow(station.timesToFirstStation[index].time.hour.toString()+":"+station.timesToFirstStation[index].time.minute.toString(), bold: true, size: font12, color: textLight),


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
                  Visibility(
                      visible:  station.name !=  "ایستگاه " + station.firstStationName && station.name !=  "ایستگاه " + station.lastStationName,
                      child: StyledTextShow("به سمت " + station.lastStationName,
                          bold: true, size: font12, color: textLight)),

                  StyledTextShow(getMinutesToTime(station.timesToLastStation[index]), size: font12, color: textLight),
                  StyledTextShow(station.timesToLastStation[index].time.hour.toString()+":"+station.timesToLastStation[index].time.minute.toString(), bold: true, size: font12, color: textLight),

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
      ),
    );
  }
}
