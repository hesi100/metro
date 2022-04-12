import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:metro/services/route_management.dart';
import 'package:metro/views/screen/main_screen.dart';
import 'package:metro/views/widgets/share/texts/styled_text.dart';


import '../../../controllers/onBoarding/on_boarding_controller.dart';
import '../../../services/colors.dart';
import '../../../services/settings.dart';
import 'onboarding_page.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => OnBoardingState();
}

class OnBoardingState extends State<OnBoarding> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Directionality(
          textDirection: TextDirection.rtl,
          child: Scaffold(
              body: Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/homepage.png"),
                      fit: BoxFit.cover),
                ),
                child: Directionality(
                  textDirection: TextDirection.ltr,
                  child: GetBuilder<OnBoardingController>(
                    init: OnBoardingController(),
                    builder: (controller) {
                      return Column(
                        children: [
                          Container(
                            alignment: Alignment.topRight,
                            margin: EdgeInsets.symmetric(horizontal: 16, vertical: 25),
                            child: controller.currentPage != 3
                                ? InkWell(
                                    onTap: () {
                                      RouteManagement.back();
                                      RouteManagement.goToPage(const MainScreen());
                                    },
                                    child: StyledTextShow("پرش")
                                  )
                                : Container(),
                          ),
                          Expanded(
                              child: PageView.builder(
                            controller: controller.pageController,
                            onPageChanged: controller.onPageChange,
                            itemBuilder: (context, position) {
                              return OnBoardingPage(
                                position: position,
                                item: controller.list[position],
                              );
                            },
                            itemCount: 3,
                          )),
                          Container(
                                  width: width,
                                  margin: EdgeInsets.only(top: 32, left: 16, right: 16, bottom: 48),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      AnimatedContainer(
                                        duration: Duration(milliseconds: 500),
                                        margin: EdgeInsets.symmetric(horizontal: 2),
                                        width: controller.currentPage == 0 ? 16 : 8,
                                        height: controller.currentPage == 0 ? 4 : 2,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(8),
                                            color: controller.currentPage == 0 ? blue : border),
                                      ),
                                      AnimatedContainer(
                                        duration: Duration(milliseconds: 500),
                                        margin: EdgeInsets.symmetric(horizontal: 2),
                                        width: controller.currentPage == 1 ? 16 : 8,
                                        height: controller.currentPage == 1 ? 4 : 2,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(8),
                                            color: controller.currentPage == 1 ? blue : border),
                                      ),
                                      AnimatedContainer(
                                        duration: Duration(milliseconds: 500),
                                        margin: EdgeInsets.symmetric(horizontal: 2),
                                        width: controller.currentPage == 2 ? 16 : 8,
                                        height: controller.currentPage == 2 ? 4 : 2,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(8),
                                            color: controller.currentPage == 2 ? blue : border),
                                      ),

                                    ],
                                  ),
                                )
                        ],
                      );
                    },
                  ),
                ),
                width: width,
              ))),
    );
  }
}
