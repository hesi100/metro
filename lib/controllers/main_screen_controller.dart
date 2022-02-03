import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:metro/model/line_model.dart';
import 'package:metro/model/station_model.dart';
import 'package:metro/model/time_model.dart';
import 'package:metro/services/stations/first_line_handler.dart';

class MainScreenController extends GetxController{
  List<LineModel> lines = [];




  @override
  void onInit() {

    LineModel line1 = LineModel(name: "خط 1", stations: FirstLineHandler.getLineStations());
    lines.add(line1);

    super.onInit();
  }
}