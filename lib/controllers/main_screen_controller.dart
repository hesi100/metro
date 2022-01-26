import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:metro/model/line_model.dart';
import 'package:metro/model/station_model.dart';
import 'package:metro/model/time_model.dart';

class MainScreenController extends GetxController{
  List<LineModel> lines = [];


  @override
  void onInit() {


    DateTime startTimeToFirst = DateTime(DateTime.now().year, DateTime.now().month,DateTime.now().day,6,41);
    DateTime startTimeToLast = DateTime(DateTime.now().year, DateTime.now().month,DateTime.now().day,6,43);

    List<TimeModel> gotbToFirst = [];
    List<TimeModel> gotbToLast = [];

    while(startTimeToFirst.isBefore(DateTime(DateTime.now().year, DateTime.now().month,DateTime.now().day,20,52))){
      gotbToFirst.add(TimeModel(time: startTimeToFirst));
      gotbToLast.add(TimeModel(time: startTimeToLast));
      startTimeToFirst = startTimeToFirst.add(const Duration(minutes: 16));
      startTimeToLast = startTimeToLast.add(const Duration(minutes: 16));

    }
    StationModel gotbRoundAbout = StationModel(name: "میدان قطب");
    gotbRoundAbout.timesToFirstStation = gotbToFirst;
    gotbRoundAbout.timesToLastStation = gotbToLast;
    List<StationModel> line1Stations = [gotbRoundAbout];
    LineModel line1 = LineModel(name: "خط1", stations: line1Stations);
    lines.add(line1);

    super.onInit();
  }
}