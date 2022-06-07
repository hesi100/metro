import 'dart:isolate';
import 'dart:typed_data';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_statusbarcolor_ns/flutter_statusbarcolor_ns.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:metro/services/analytics.dart';
import 'package:metro/services/device.dart';
import 'package:metro/services/storage/storage.dart';
import 'package:metro/services/storage/storage_controller.dart';
import 'package:metro/views/screen/line_screen.dart';
import 'package:metro/views/screen/onBoarding/onboarding.dart';
Future<void> initService() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  await StorageService.getInstance();

  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  // crashlytics
  if (kDebugMode) {
    await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(false);
  } else {
    await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);

    FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
    Isolate.current.addErrorListener(RawReceivePort((pair) async {
      final List<dynamic> errorAndStacktrace = pair;
      await FirebaseCrashlytics.instance.recordError(
        errorAndStacktrace.first,
        errorAndStacktrace.last,
      );
    }).sendPort);
  }
  await DeviceInfoService.getInstance();
  AnalyticService.sendPhoneData();
  await FlutterStatusbarcolor.setStatusBarColor(Colors.white);
  await FlutterStatusbarcolor.setNavigationBarColor(Colors.white);

  WidgetsFlutterBinding.ensureInitialized();
}



void main() async{
  await initService();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tabriz Metro',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: StorageController.isFirst() ? const OnBoarding() : const LineScreen(),
    );
  }
}
