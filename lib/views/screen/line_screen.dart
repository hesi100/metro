import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:metro/controllers/line_screen_controller.dart';
import 'package:metro/model/line_model.dart';
import 'package:metro/services/route_management.dart';
import 'package:metro/services/settings.dart';
import 'package:metro/views/screen/station_screen.dart';
import 'package:metro/views/widgets/line/station_item.dart';
import 'package:metro/views/widgets/share/headers/header.dart';
import 'package:metro/views/widgets/share/search_bar.dart';

import '../../services/colors.dart';


class LineScreen extends StatelessWidget {
  const LineScreen({required this.line, Key? key}) : super(key: key);
  final LineModel line;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: GetBuilder<LineController>(
          init: LineController(line: line),
          builder: (controller) {
            return Scaffold(
                body: Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(image: AssetImage("assets/images/homepage.png"), fit: BoxFit.cover),
                  ),
                  child: Column(
                    children: [
                      const Header(
                        title: "لیست ایستگاه ها",
                        hasBackArrow: true,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child:SearchBar(onChange: controller.onSearchTextChange,searchText: controller.searchText,)
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                          child: ListView.builder(
                              itemCount: controller.stations.length,
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return StationItem(station: controller.stations[index]);
                              }),
                        ),)
                    ],
                  ),
                ));
          }
        ),
      ),
    );
  }
}
