import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:manowa_apps/constants/core/image_assets_const.dart';
import 'package:manowa_apps/features/splash/controllers/splash_controller.dart';
import 'package:manowa_apps/shared/widgets/my_scaffold_widget.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = SplashController.to;
    return MyScaffoldWidget(
      body: Padding(
        padding: EdgeInsets.only(
          left: 12.w,
          right: 12.w,
          bottom: 24.h,
        ),
        child: Center(
          child: Image.asset(
            ImageAssetsConst.drawAyoBermain,
            width: double.infinity,
            fit: BoxFit.fitWidth,
          ),
        ),
      ),
    );
  }
}
