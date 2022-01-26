import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class RouteManagement {
  static Future goToPage(
    Widget page, {
    preventDuplicates = true,
  }) async {
    return await Get.to(page,
        transition: Transition.rightToLeft, duration: const Duration(milliseconds: 500), preventDuplicates: preventDuplicates);
  }

  static Future replacePage(Widget page) async {
    return await Get.off(
      page,
      transition: Transition.rightToLeft,
      duration: const Duration(milliseconds: 500),
    );
  }

  static Future replaceAllPage(Widget page) async {
    return await Get.offAll(
      page,
      transition: Transition.rightToLeft,
      duration: const Duration(milliseconds: 500),
    );
  }

  static void back({result}) {
    return Get.back(result: result, canPop: true, closeOverlays: true);
  }

  static void backAll({result}) {
    return Get.until((route) => route.isFirst);
  }
}
