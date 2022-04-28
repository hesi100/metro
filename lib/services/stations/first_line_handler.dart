import 'package:metro/model/station_model.dart';
import 'package:metro/model/time_model.dart';

class FirstLineHandler {
  static StationModel getElgoliStation() {
    DateTime startTimeToFirst = DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day, 6, 58);
    DateTime startTimeToLast = DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day, 6, 26);

    List<TimeModel> toFirst = [];
    List<TimeModel> toLast = [];

    while (startTimeToFirst.isBefore(DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day, 21, 7))) {
      toFirst.add(TimeModel(time: startTimeToFirst));
      toLast.add(TimeModel(time: startTimeToLast));
      startTimeToFirst = startTimeToFirst.add(const Duration(minutes: 16));
      startTimeToLast = startTimeToLast.add(const Duration(minutes: 16));
    }
    StationModel station = StationModel(name: "ایستگاه ائل گولی");
    station.timesToFirstStation = toFirst;
    station.timesToLastStation = toLast;
    return station;
  }

  static StationModel getSahandStation() {
    DateTime startTimeToFirst = DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day, 6, 55);
    DateTime startTimeToLast = DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day, 6, 29);

    List<TimeModel> toFirst = [];
    List<TimeModel> toLast = [];

    while (startTimeToFirst.isBefore(DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day, 21, 4))) {
      toFirst.add(TimeModel(time: startTimeToFirst));
      toLast.add(TimeModel(time: startTimeToLast));
      startTimeToFirst = startTimeToFirst.add(const Duration(minutes: 16));
      startTimeToLast = startTimeToLast.add(const Duration(minutes: 16));
    }
    StationModel station = StationModel(name: "ایستگاه سهند");
    station.timesToFirstStation = toFirst;
    station.timesToLastStation = toLast;
    return station;
  }

  static StationModel getEmamRezaStation() {
    DateTime startTimeToFirst = DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day, 6, 53);
    DateTime startTimeToLast = DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day, 6, 31);

    List<TimeModel> toFirst = [];
    List<TimeModel> toLast = [];

    while (startTimeToFirst.isBefore(DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day, 21, 2))) {
      toFirst.add(TimeModel(time: startTimeToFirst));
      toLast.add(TimeModel(time: startTimeToLast));
      startTimeToFirst = startTimeToFirst.add(const Duration(minutes: 16));
      startTimeToLast = startTimeToLast.add(const Duration(minutes: 16));
    }
    StationModel station = StationModel(name: "ایستگاه امام رضا");
    station.timesToFirstStation = toFirst;
    station.timesToLastStation = toLast;
    return station;
  }

  static StationModel getKhayyamStation() {
    DateTime startTimeToFirst = DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day, 6, 51);
    DateTime startTimeToLast = DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day, 6, 33);

    List<TimeModel> toFirst = [];
    List<TimeModel> toLast = [];

    while (startTimeToFirst.isBefore(DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day, 21, 0))) {
      toFirst.add(TimeModel(time: startTimeToFirst));
      toLast.add(TimeModel(time: startTimeToLast));
      startTimeToFirst = startTimeToFirst.add(const Duration(minutes: 16));
      startTimeToLast = startTimeToLast.add(const Duration(minutes: 16));
    }
    StationModel station = StationModel(name: "ایستگاه خیام");
    station.timesToFirstStation = toFirst;
    station.timesToLastStation = toLast;
    return station;
  }

  static StationModel get29BahmanStation() {
    DateTime startTimeToFirst = DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day, 6, 49);
    DateTime startTimeToLast = DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day, 6, 35);

    List<TimeModel> toFirst = [];
    List<TimeModel> toLast = [];

    while (startTimeToFirst.isBefore(DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day, 20, 58))) {
      toFirst.add(TimeModel(time: startTimeToFirst));
      toLast.add(TimeModel(time: startTimeToLast));
      startTimeToFirst = startTimeToFirst.add(const Duration(minutes: 16));
      startTimeToLast = startTimeToLast.add(const Duration(minutes: 16));
    }
    StationModel station = StationModel(name: "ایستگاه 29 بهمن");
    station.timesToFirstStation = toFirst;
    station.timesToLastStation = toLast;
    return station;
  }

  static StationModel getOstadShariyarStation() {
    DateTime startTimeToFirst = DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day, 6, 47);
    DateTime startTimeToLast = DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day, 6, 37);

    List<TimeModel> toFirst = [];
    List<TimeModel> toLast = [];

    while (startTimeToFirst.isBefore(DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day, 20, 56))) {
      toFirst.add(TimeModel(time: startTimeToFirst));
      toLast.add(TimeModel(time: startTimeToLast));
      startTimeToFirst = startTimeToFirst.add(const Duration(minutes: 16));
      startTimeToLast = startTimeToLast.add(const Duration(minutes: 16));
    }
    StationModel station = StationModel(name: "ایستگاه استاد شهریار");
    station.timesToFirstStation = toFirst;
    station.timesToLastStation = toLast;
    return station;
  }

  static StationModel getDaneshgahStation() {
    DateTime startTimeToFirst = DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day, 6, 45);
    DateTime startTimeToLast = DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day, 6, 39);

    List<TimeModel> toFirst = [];
    List<TimeModel> toLast = [];

    while (startTimeToFirst.isBefore(DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day, 20, 54))) {
      toFirst.add(TimeModel(time: startTimeToFirst));
      toLast.add(TimeModel(time: startTimeToLast));
      startTimeToFirst = startTimeToFirst.add(const Duration(minutes: 16));
      startTimeToLast = startTimeToLast.add(const Duration(minutes: 16));
    }
    StationModel station = StationModel(name: "ایستگاه دانشگاه");
    station.timesToFirstStation = toFirst;
    station.timesToLastStation = toLast;
    return station;
  }

  static StationModel getAberasanStation() {
    DateTime startTimeToFirst = DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day, 6, 43);
    DateTime startTimeToLast = DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day, 6, 41);

    List<TimeModel> toFirst = [];
    List<TimeModel> toLast = [];

    while (startTimeToFirst.isBefore(DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day, 20, 52))) {
      toFirst.add(TimeModel(time: startTimeToFirst));
      toLast.add(TimeModel(time: startTimeToLast));
      startTimeToFirst = startTimeToFirst.add(const Duration(minutes: 16));
      startTimeToLast = startTimeToLast.add(const Duration(minutes: 16));
    }
    StationModel station = StationModel(name: "ایستگاه آبرسان");
    station.timesToFirstStation = toFirst;
    station.timesToLastStation = toLast;
    return station;
  }

  static StationModel getGotbStation() {
    DateTime startTimeToFirst = DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day, 6, 41);
    DateTime startTimeToLast = DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day, 6, 43);

    List<TimeModel> toFirst = [];
    List<TimeModel> toLast = [];

    while (startTimeToFirst.isBefore(DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day, 20, 52))) {
      toFirst.add(TimeModel(time: startTimeToFirst));
      toLast.add(TimeModel(time: startTimeToLast));
      startTimeToFirst = startTimeToFirst.add(const Duration(minutes: 16));
      startTimeToLast = startTimeToLast.add(const Duration(minutes: 16));
    }
    StationModel station = StationModel(name: "ایستگاه میدان قطب");
    station.timesToFirstStation = toFirst;
    station.timesToLastStation = toLast;
    return station;
  }

  static StationModel getShahidBehestiStation() {
    DateTime startTimeToFirst = DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day, 6, 39);
    DateTime startTimeToLast = DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day, 6, 45);

    List<TimeModel> toFirst = [];
    List<TimeModel> toLast = [];

    while (startTimeToFirst.isBefore(DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day, 20, 50))) {
      toFirst.add(TimeModel(time: startTimeToFirst));
      toLast.add(TimeModel(time: startTimeToLast));
      startTimeToFirst = startTimeToFirst.add(const Duration(minutes: 16));
      startTimeToLast = startTimeToLast.add(const Duration(minutes: 16));
    }
    StationModel station = StationModel(name: "ایستگاه شهید بهشتی");
    station.timesToFirstStation = toFirst;
    station.timesToLastStation = toLast;
    return station;
  }

  static StationModel getMeydanSaatStation() {
    DateTime startTimeToFirst = DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day, 6, 37);
    DateTime startTimeToLast = DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day, 6, 47);

    List<TimeModel> toFirst = [];
    List<TimeModel> toLast = [];

    while (startTimeToFirst.isBefore(DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day, 20, 48))) {
      toFirst.add(TimeModel(time: startTimeToFirst));
      toLast.add(TimeModel(time: startTimeToLast));
      startTimeToFirst = startTimeToFirst.add(const Duration(minutes: 16));
      startTimeToLast = startTimeToLast.add(const Duration(minutes: 16));
    }
    StationModel station = StationModel(name: "ایستگاه میدان ساعت");
    station.timesToFirstStation = toFirst;
    station.timesToLastStation = toLast;
    return station;
  }

  static StationModel getMeydanKohanStation() {
    DateTime startTimeToFirst = DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day, 6, 35);
    DateTime startTimeToLast = DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day, 6, 49);

    List<TimeModel> toFirst = [];
    List<TimeModel> toLast = [];

    while (startTimeToFirst.isBefore(DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day, 20, 46))) {
      toFirst.add(TimeModel(time: startTimeToFirst));
      toLast.add(TimeModel(time: startTimeToLast));
      startTimeToFirst = startTimeToFirst.add(const Duration(minutes: 16));
      startTimeToLast = startTimeToLast.add(const Duration(minutes: 16));
    }
    StationModel station = StationModel(name: "ایستگاه میدان کهن");
    station.timesToFirstStation = toFirst;
    station.timesToLastStation = toLast;
    return station;
  }

  static List<StationModel> getLineStations() {
    List<StationModel> line1Stations = [];
    line1Stations.add(getElgoliStation());
    line1Stations.add(getSahandStation());
    line1Stations.add(getEmamRezaStation());
    line1Stations.add(getKhayyamStation());
    line1Stations.add(get29BahmanStation());
    line1Stations.add(getOstadShariyarStation());
    line1Stations.add(getDaneshgahStation());
    line1Stations.add(getAberasanStation());
    line1Stations.add(getGotbStation());
    line1Stations.add(getShahidBehestiStation());
    line1Stations.add(getMeydanSaatStation());
    line1Stations.add(getMeydanKohanStation());
    return line1Stations;
  }
}
