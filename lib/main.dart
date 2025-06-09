import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:wether_app_final/Features/Drawer/presention/view/manger/Drawrcontroller.dart';
import 'package:wether_app_final/Features/home/presention/manger/SunController.dart';
import 'package:wether_app_final/Features/home/presention/manger/chang_color.dart';
import 'package:wether_app_final/Features/home/presention/view/homeView.dart';
import 'package:wether_app_final/core/utils/AppRouter%20.dart';
import 'package:wether_app_final/core/utils/mybinding.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        getPages: AppRouter.routes,
        initialBinding: Mybinding(),
        showPerformanceOverlay: false, // أضف هذا السطر

        home: const Homeview());
  }
}
