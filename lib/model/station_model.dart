import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:metro/model/time_model.dart';

class StationModel{
  StationModel({required this.name});
  String name = "";
  List<TimeModel> timesToFirstStation = [];
  List<TimeModel> timesToLastStation = [];
  Color color = Colors.red;

}