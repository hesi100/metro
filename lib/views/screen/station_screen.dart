import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:metro/controllers/main_screen_controller.dart';
import 'package:metro/model/line_model.dart';
import 'package:metro/model/station_model.dart';
import 'package:metro/services/route_management.dart';
import 'package:metro/views/widgets/headers/header.dart';
import 'package:metro/views/widgets/texts/styled_text.dart';


class StationScreen extends StatelessWidget {
  const StationScreen({required this.station, Key? key}) : super(key: key);
  final StationModel station;
  @override
  Widget build(BuildContext context) {
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
                  Container(
                    height: 40,
                    child:const TabBar(
                      tabs: [
                        StyledTextShow("به سمت ایل گولی"),
                        StyledTextShow("به سمت میدان کهن")

                      ],
                    ),
                  ),
                  Expanded(child: TabBarView(
                    children: [
                      ListView.builder(
                          itemCount: station.timesToFirstStation.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            DateTime time = station.timesToFirstStation[index].time;
                            return InkWell(
                              onTap: (){
                              },
                              child: Container(
                                height: 40,
                                child: StyledTextShow(time.hour.toString() + ":"+time.minute.toString() ),
                              ),
                            );
                          }),
                      ListView.builder(
                          itemCount: station.timesToLastStation.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            DateTime time = station.timesToLastStation[index].time;
                            return InkWell(
                              onTap: (){
                              },
                              child: Container(
                                height: 40,
                                child: StyledTextShow(time.hour.toString() + ":"+time.minute.toString() ),
                              ),
                            );
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
