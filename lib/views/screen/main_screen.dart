import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:metro/controllers/main_screen_controller.dart';
import 'package:metro/services/route_management.dart';
import 'package:metro/views/widgets/main_screen/line_item.dart';
import 'package:metro/views/widgets/share/headers/header.dart';

import 'line_screen.dart';


class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: GetBuilder<MainScreenController>(
          init: MainScreenController(),
          builder: (controller){
            return Scaffold(
                body: Column(
                  children: [
                    const Header(
                      title: 'خط ها',
                      hasBackArrow: true,
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        child: ListView.builder(
                            itemCount: controller.lines.length,
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return LineItem(line: controller.lines[index],);
                            }),
                      ),)
                  ],
                ));
          },
        ),
      ),
    );
  }
}
