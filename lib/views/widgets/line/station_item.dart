import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:metro/model/line_model.dart';
import 'package:metro/model/station_model.dart';
import 'package:metro/services/route_management.dart';
import 'package:metro/services/settings.dart';
import 'package:metro/services/text/texts.dart';
import 'package:metro/views/screen/line_screen.dart';
import 'package:metro/views/screen/station_screen.dart';
import 'package:metro/views/widgets/share/texts/styled_text.dart';

class StationItem extends StatelessWidget {
  const StationItem({required this.station, Key? key}) : super(key: key);
  final StationModel station;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: (){
        RouteManagement.goToPage(StationScreen(station: station));
      },
      child:Container(
        padding: const EdgeInsets.symmetric(horizontal: 24,vertical: 18),
        height: 100,
        width: width,
        color: station.color,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            StyledTextShow(station.name,bold: true,size: font24,color: Colors.white,),
            SvgPicture.asset(icon("arrow_left"))

          ],
        ),
      ),
    );
  }
}
