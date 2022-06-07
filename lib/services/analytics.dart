import 'package:firebase_analytics/firebase_analytics.dart';

import 'device.dart';


class AnalyticService {
  static void sendReport(String name, Map<String, dynamic> parameters) async {
    FirebaseAnalytics analytics = FirebaseAnalytics.instance;
    await analytics.logAppOpen();
    await analytics.logEvent(name: name, parameters: parameters);
  }

  static void sendPhoneData() {
    sendReport('device', {
      'brand': DeviceInfoService.getDeviceBrand(),
      'name': DeviceInfoService.getDeviceName(),
    });
  }

  static String changeNameFormat(name) {
    return name.toString().replaceAll(RegExp(r'[^ا-یa-zA-Z0-9_آ]'), '_');
  }

  static void sendData({
    required String mainKey,
    required String analyticKey,
    required String analyticValue,
  }) {
    Map<String, dynamic> mapAnalyze = {};
    mapAnalyze[changeNameFormat(analyticKey)] = analyticValue;
    AnalyticService.sendReport(mainKey, mapAnalyze);
  }
}
