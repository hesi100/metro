import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:metro/controllers/main_screen_controller.dart';
import 'package:metro/model/line_model.dart';
import 'package:metro/services/route_management.dart';
import 'package:metro/views/screen/station_screen.dart';
import 'package:metro/views/widgets/headers/header.dart';
import 'package:metro/views/widgets/texts/styled_text.dart';


class LineScreen extends StatelessWidget {
  const LineScreen({required this.line, Key? key}) : super(key: key);
  final LineModel line;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
            body: Column(
              children: [
                Header(
                  title: line.name,
                  hasBackArrow: true,
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: ListView.builder(
                        itemCount: line.stations.length,
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: (){
                              RouteManagement.goToPage(StationScreen(station: line.stations[index]));
                              },
                            child: Container(
                              height: 200,
                              child: StyledTextShow(line.stations[index].name),
                            ),
                          );
                        }),
                  ),)
              ],
            )),
      ),
    );
  }
}
