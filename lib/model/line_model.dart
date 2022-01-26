import 'package:metro/model/station_model.dart';

class LineModel{
  LineModel({required this.name,required this.stations});
  String name = "";
  List<StationModel> stations = [];
}