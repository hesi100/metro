import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:metro/views/screen/line_screen.dart';

import '../../services/route_management.dart';

class OnBoardingController extends GetxController {
  int currentPage = 0;

  final PageController pageController = PageController();

  List<Map> list = [
    {
      "title": 'از زمان حرکت مترو با خبر شو',
      "img": 'assets/images/on_boarding_time.png',
      'des': 'می تونی از زمان حرکت قطار ها در تموم ایستگاه ها با خبر بشی',
      "id": 1
    },
    {
      "title": 'نزیک ترین ایستگاه مترو را پیدا کن',
      "img": 'assets/images/on_boarding_map.png',
      'des': 'می توانید با استفاده از نقشه نزدیک ترین ایستگاه مترو به موقعیت خود را پیدا کنید',
      "id": 2
    },
    {
      "title": 'از امکانات هر ایستگاه با خبر شو',
      "img": 'assets/images/on_boarding_star.png',
      'des': 'ما لیستی از امکانات موجود در هر ایستگاه را برای شما نمایش می دهیم',
      "id": 3
    },
  ];

  void onSkipTap() {
    RouteManagement.back();
    RouteManagement.goToPage(const LineScreen());
  }

  void onButtonTap() {
    if (currentPage == 2) {
      RouteManagement.goToPage(const LineScreen());
    } else {
      nextPage();
    }
  }

  void onPageChange(page) {
    currentPage = page;
    update();
  }

  void nextPage() {
    currentPage++;
    pageController.nextPage(duration: Duration(microseconds: 300), curve: Curves.easeIn);
    update();
  }
}
