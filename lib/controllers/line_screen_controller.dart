import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:metro/model/line_model.dart';
import 'package:metro/model/station_model.dart';
import 'package:metro/model/time_model.dart';
import 'package:metro/services/stations/first_line_handler.dart';

import '../model/texts/text_in_model.dart';

class LineController extends GetxController{
  LineController({required this.line});

  final LineModel line;
  List<StationModel> stations = [];

  TextInModel searchText = TextInModel();

  void onSearchTextChange(TextInModel text) {
    stations.clear();
    line.stations.forEach((element) {
      if(element.name.contains(text.textController.text)){
        stations.add(element);
      }
    });
  }

  @override
  void onInit() {
    stations.addAll(line.stations);
    super.onInit();
  }


}