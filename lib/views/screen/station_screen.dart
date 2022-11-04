import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:metro/model/station_model.dart';
import 'package:metro/services/text/texts.dart';
import 'package:metro/views/widgets/share/headers/header.dart';
import 'package:metro/views/widgets/share/texts/styled_text.dart';
import 'package:metro/views/widgets/station/time_item.dart';

import '../../services/colors.dart';
import '../../services/settings.dart';
import '../widgets/line/next_train_time.dart';
import '../widgets/line/train_leave_time.dart';

class StationScreen extends StatelessWidget {
  const StationScreen({required this.station, Key? key}) : super(key: key);
  final StationModel station;

  @override
  Widget build(BuildContext context) {
    print(station.timesToFirstStation.length);
    return SafeArea(
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(

            body: DefaultTabController(
          length: 2,
          child: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(image: AssetImage("assets/images/homepage.png"), fit: BoxFit.cover),
            ),
            child: Column(
              children: [
                Header(
                  title: station.name,
                  hasBackArrow: true,
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          margin: EdgeInsets.all(16),
                          padding: const EdgeInsets.symmetric(vertical: 16,horizontal: 32),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: white,width: 1)
                          ),
                          child: NextTrainTime(station: station,),
                        ),
                        ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: station.timesToFirstStation.length,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return TrainLeaveTime(
                                station: station,
                                index: index,
                              );
                            }),
                      ],
                    ),
                  ),
                ),

              ],
            ),
          ),
        )),
      ),
    );
  }
}
