import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'app/routes/app_pages.dart';
import 'app/routes/app_pages.dart';

void main() {
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    title: "Space Parking",
    initialRoute: AppPages.INITIAL,
    getPages: AppPages.routes,
  ));
}

