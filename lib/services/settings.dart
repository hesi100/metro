import 'package:flutter/material.dart';

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


int getMinutesToNext(){
  return 0 ;
}