import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:metro/services/storage/storage.dart';
import 'package:metro/services/storage/storage_controller.dart';
import 'package:metro/views/screen/line_screen.dart';
import 'package:metro/views/screen/onBoarding/onboarding.dart';
Future<void> initService() async {
  WidgetsFlutterBinding.ensureInitialized();
  await StorageService.getInstance();

  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);


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
