import 'dart:async';

import 'package:get/get.dart';
import 'package:metro/model/line_model.dart';
import 'package:metro/model/station_model.dart';
import 'package:metro/services/stations/first_line_handler.dart';

import '../model/texts/text_in_model.dart';

class LineController extends GetxController {
  LineModel line = LineModel(name: "خط 1", stations: FirstLineHandler.getLineStations());

  List<StationModel> stations = [];

  TextInModel searchText = TextInModel();

  void onSearchTextChange(TextInModel text) {
    stations.clear();
    line.stations.forEach((element) {
      if (element.name.contains(text.textController.text)) {
        stations.add(element);
      }
    });
    update();
  }

  void startTimer() {

    const oneSec = Duration(seconds: 10);
    Timer.periodic(oneSec, (Timer timer) {
      update();
    });
  }

  @override
  void onInit() {
    stations.addAll(line.stations);
    startTimer();
    super.onInit();
  }
}
