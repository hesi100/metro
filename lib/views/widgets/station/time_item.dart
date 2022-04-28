import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:metro/model/time_model.dart';
import 'package:metro/services/colors.dart';
import 'package:metro/services/text/texts.dart';
import 'package:metro/views/widgets/share/texts/styled_text.dart';

class TimeItem extends StatelessWidget {
  const TimeItem({required this.time, Key? key}) : super(key: key);
  final TimeModel time;

  @override
  Widget build(BuildContext context) {
    bool isPassed = DateTime.now().isAfter(time.time);
    double width = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: () {},
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 9),
            height: 50,
            width: width,
            color: isPassed ? darkRed : green,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                StyledTextShow(
                  time.time.hour.toString() + ":" + time.time.minute.toString(),
                  color: white,
                  size: font20,
                ),
              ],
            ),
          ),
          Divider(
            color: white,
            height: 0,
            thickness: 5,
          )
        ],
      ),
    );
  }
}
