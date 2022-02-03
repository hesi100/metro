import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:metro/controllers/main_screen_controller.dart';
import 'package:metro/model/line_model.dart';
import 'package:metro/model/station_model.dart';
import 'package:metro/model/time_model.dart';
import 'package:metro/services/colors.dart';
import 'package:metro/services/route_management.dart';
import 'package:metro/services/text/texts.dart';
import 'package:metro/views/widgets/share/headers/header.dart';
import 'package:metro/views/widgets/share/texts/styled_text.dart';
import 'package:metro/views/widgets/station/time_item.dart';


class StationScreen extends StatelessWidget {
  const StationScreen({required this.station, Key? key}) : super(key: key);
  final StationModel station;
  @override
  Widget build(BuildContext context) {
    Duration tofirstNext ;
    Duration tolastNext ;
   tofirstNext = station.timesToFirstStation.first.time.difference(DateTime.now().subtract(const Duration(days: 1)));
  print(tofirstNext);
   for (var element in station.timesToFirstStation) {
     if(element.time.isBefore(DateTime.now())){
       tofirstNext = element.time.difference(DateTime.now());
       break;
     }
   }

    tolastNext = station.timesToLastStation.first.time.difference(DateTime.now().add(const Duration(days: 1)));

    for (var element in station.timesToLastStation) {
      if(element.time.isBefore(DateTime.now())){
        tolastNext = element.time.difference(DateTime.now());
        break;
      }
    }
    return SafeArea(
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
            body: DefaultTabController(

              length: 2,
              child: Column(
                children: [
                  Header(
                    title: station.name,
                    hasBackArrow: true,
                  ),

                  const SizedBox(
                    height: 40,
                    child: TabBar(
                      tabs: [
                        StyledTextShow("به سمت ایل گولی"),
                        StyledTextShow("به سمت میدان کهن")

                      ],
                    ),
                  ),
                  Expanded(child: TabBarView(

                    children: [

                     Column(
                       children: [
                         Container(
                             height: 200,
                             child: StyledTextShow(tofirstNext.inHours.toString() + ":"+tofirstNext.inMinutes.toString() ,size: font20,),
                         ),
                         Expanded(child: ListView.builder(
                             itemCount: station.timesToFirstStation.length,
                             shrinkWrap: true,
                             itemBuilder: (context, index) {
                               return TimeItem(time: station.timesToFirstStation[index],);
                             }),)
                       ],
                     ),
                      ListView.builder(
                          itemCount: station.timesToLastStation.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return TimeItem(time: station.timesToLastStation[index],);
                          }),
                    ],
                  ),)
                ],
              ),
            )),
      ),
    );
  }
}
