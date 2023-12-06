import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:manowa_apps/configs/pages/app_pages.dart';
import 'package:manowa_apps/configs/routes/app_routes.dart';
import 'package:manowa_apps/configs/themes/app_themes.dart';

import 'constants/common/app_const.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      useInheritedMediaQuery: true,
      designSize: AppConst.appDesignSize,
      builder: (context, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Manowa App',
          initialRoute: AppRoutes.splashScreen,
          getPages: AppPages.pages(),
          theme: AppThemes.lightTheme,
          navigatorKey: Get.key,
        );
      },
    );
  }
}
