import 'package:flutter/material.dart';
import 'package:metro/model/line_model.dart';
import 'package:metro/services/route_management.dart';
import 'package:metro/views/screen/station_screen.dart';
import 'package:metro/views/widgets/line/station_item.dart';
import 'package:metro/views/widgets/share/headers/header.dart';


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
                          return StationItem(station: line.stations[index]);
                        }),
                  ),)
              ],
            )),
      ),
    );
  }
}
