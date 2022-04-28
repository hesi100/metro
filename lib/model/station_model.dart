import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:metro/model/time_model.dart';

class StationModel {
  StationModel({required this.name,this.lineName = "خط یک",this.firstStationName="ایل گولی",this.lastStationName="لاله"});

  String name = "";
  String lineName = "";
  String firstStationName = "";
  String lastStationName = "";

  List<TimeModel> timesToFirstStation = [];
  List<TimeModel> timesToLastStation = [];
  Color color = Colors.red;
}
