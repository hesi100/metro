import 'package:flutter/material.dart';

import '../model/time_model.dart';
import 'colors.dart';

String icon(txt) {
  return 'assets/svgs/${txt.toString()}.svg';
}

String image(text) {
  return 'assets/images/${text.toString()}.png';
}

BoxShadow boxShadow = BoxShadow(
  color: black.withOpacity(0.1),
  spreadRadius: 3,
  blurRadius: 10,
  offset: const Offset(0, 3),
);

String  getMinutesToNext(List<TimeModel> times) {
  for (var element in times) {
    if (element.time.isAfter(DateTime.now())) {
      int minutes = element.time.difference(DateTime.now()).inMinutes;
      if(minutes < 60){
        return "$minutes دقیقه";
      }else{
        return "${minutes~/60} ساعت و "+"${minutes%60} دقیقه";
      }

    }
  }
  return "";
}

String getMinutesToTime(TimeModel element) {
  int minutes = element.time.difference(DateTime.now()).inMinutes;
  if(minutes < 60){
    return "$minutes دقیقه";
  }else{
    return "${minutes~/60} ساعت و "+"${minutes%60} دقیقه";
  }
  return "";
}
