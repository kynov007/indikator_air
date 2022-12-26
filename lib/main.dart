import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import 'app/routes/app_pages.dart';

void main() {
  runApp(
    ScreenUtilInit(
      designSize: Size(360, 800),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: ((context, child) => GetMaterialApp(
            debugShowCheckedModeBanner: false,
            title: "Application",
            initialRoute: AppPages.INITIAL,
            getPages: AppPages.routes,
          )),
    ),
  );
}
