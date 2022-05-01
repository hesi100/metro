import 'package:flutter/material.dart';
import 'package:metro/model/station_model.dart';
import 'package:metro/model/time_model.dart';

class FirstLineHandler {
  static void addArrivalTimes(startTimeToFirst, startTimeToLast, List<TimeModel> toFirst, List<TimeModel> toLast, count) {
    for (int i = 0; i < count; i++) {
      toFirst.add(TimeModel(time: startTimeToFirst));
      toLast.add(TimeModel(time: startTimeToLast));
      startTimeToFirst = startTimeToFirst.add(const Duration(minutes: 16));
      startTimeToLast = startTimeToLast.add(const Duration(minutes: 16));
    }
    startTimeToFirst = toFirst.first.time.add(const Duration(days: 1));
    startTimeToLast = toLast.first.time.add(const Duration(days: 1));
    for (int i = 0; i < count; i++) {
      toFirst.add(TimeModel(time: startTimeToFirst));
      toLast.add(TimeModel(time: startTimeToLast));
      startTimeToFirst = startTimeToFirst.add(const Duration(minutes: 16));
      startTimeToLast = startTimeToLast.add(const Duration(minutes: 16));
    }
  }

  static StationModel getStation(
    String stationName,
    TimeOfDay startToFirst,
    TimeOfDay startToLast,
  ) {
    DateTime startTimeFromLast =
        DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day, startToFirst.hour, startToFirst.minute);
    DateTime startTimeFromFirst =
        DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day, startToLast.hour, startToLast.minute);

    List<TimeModel> toFirst = [];
    List<TimeModel> toLast = [];

    addArrivalTimes(startTimeFromLast, startTimeFromFirst, toFirst, toLast, 54);
    StationModel station = StationModel(name: stationName);
    station.timesToFirstStation = toFirst;
    station.timesToLastStation = toLast;
    return station;
  }

  static List<StationModel> getLineStations() {
    List<StationModel> line1Stations = [];
    line1Stations.add(getStation("ایستگاه ائل گولی", const TimeOfDay(hour: 6, minute: 58), const TimeOfDay(hour: 6, minute: 26)));
    line1Stations.add(getStation("ایستگاه سهند", const TimeOfDay(hour: 6, minute: 55), const TimeOfDay(hour: 6, minute: 29)));
    line1Stations.add(getStation("ایستگاه امام رضا", const TimeOfDay(hour: 6, minute: 53), const TimeOfDay(hour: 6, minute: 31)));
    line1Stations.add(getStation("ایستگاه خیام", const TimeOfDay(hour: 6, minute: 51), const TimeOfDay(hour: 6, minute: 33)));
    line1Stations.add(getStation("ایستگاه 29 بهمن", const TimeOfDay(hour: 6, minute: 49), const TimeOfDay(hour: 6, minute: 35)));
    line1Stations
        .add(getStation("ایستگاه استاد شهریار", const TimeOfDay(hour: 6, minute: 47), const TimeOfDay(hour: 6, minute: 37)));
    line1Stations.add(getStation("ایستگاه دانشگاه", const TimeOfDay(hour: 6, minute: 45), const TimeOfDay(hour: 6, minute: 39)));
    line1Stations.add(getStation("ایستگاه آبرسان", const TimeOfDay(hour: 6, minute: 43), const TimeOfDay(hour: 6, minute: 41)));
    line1Stations
        .add(getStation("ایستگاه میدان قطب", const TimeOfDay(hour: 6, minute: 41), const TimeOfDay(hour: 6, minute: 43)));
    line1Stations
        .add(getStation("ایستگاه شهید بهشتی", const TimeOfDay(hour: 6, minute: 39), const TimeOfDay(hour: 6, minute: 45)));
    line1Stations
        .add(getStation("ایستگاه میدان ساعت", const TimeOfDay(hour: 6, minute: 37), const TimeOfDay(hour: 6, minute: 47)));
    line1Stations
        .add(getStation("ایستگاه میدان کهن", const TimeOfDay(hour: 6, minute: 35), const TimeOfDay(hour: 6, minute: 49)));
    return line1Stations;
  }


}
