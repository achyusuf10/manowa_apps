import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:manowa_apps/configs/routes/app_routes.dart';
import 'package:manowa_apps/configs/themes/app_colors.dart';
import 'package:manowa_apps/configs/themes/app_fonts.dart';
import 'package:manowa_apps/constants/core/image_assets_const.dart';
import 'package:manowa_apps/features/home/controllers/home_controller.dart';
import 'package:manowa_apps/shared/widgets/custom_button_widget.dart';
import 'package:manowa_apps/shared/widgets/my_scaffold_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = HomeController.to;
    return MyScaffoldWidget(
      floatingActionButton: GestureDetector(
        onTap: controller.onToogleMusic,
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: Colors.white,
              width: 4,
            ),
            gradient: const LinearGradient(
              colors: [
                Color(0xffFFB232),
                Color(0xffFFB232),
                Color(0xffFE8400),
              ],
            ),
          ),
          height: 70.h,
          width: 70.h,
          child: StreamBuilder<PlayerState>(
            stream: controller.audioPlayer.onPlayerStateChanged,
            builder: (context, snapshot) {
              if (snapshot.data == PlayerState.playing) {
                return Icon(
                  Icons.music_off_rounded,
                  size: 34.h,
                  color: AppColors.red,
                );
              }
              return Icon(
                Icons.music_note_rounded,
                size: 34.h,
                color: AppColors.red,
              );
            },
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 8.w,
              ),
              child: Image.asset(
                ImageAssetsConst.drawOrnamenHome,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Text(
              'Rumah Trigonometri\nSudut Istimewa',
              style: TextStyle(
                fontFamily: AppFonts.cormorantUpgright,
                fontSize: 26.sp,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                shadows: [
                  Shadow(
                    color: Colors.black.withOpacity(0.25),
                    blurRadius: 4,
                    offset: const Offset(2, 2),
                  ),
                  Shadow(
                    color: Colors.black.withOpacity(0.25),
                    blurRadius: 4,
                    offset: const Offset(1, -1),
                  ),
                ],
              ),
              textAlign: TextAlign.center,
            ).animate().fade().scale(),
            SizedBox(
              height: 24.h,
            ),
            CustomButtonWidget.v1(
              text: 'Start',
              onTap: () async {
                controller.audioPlayer.stop();
                await Get.toNamed(
                  AppRoutes.gameScreen,
                );
                controller.onSetBGM();
              },
            ),
            SizedBox(
              height: 24.h,
            ),
            CustomButtonWidget.v1(
              text: 'MATERI',
              onTap: () {
                Get.toNamed(
                  AppRoutes.materialScreen,
                );
              },
            ),
            SizedBox(
              height: 24.h,
            ),
            CustomButtonWidget.v2(
              text: 'PETUNJUK',
              onTap: () {
                Get.toNamed(
                  AppRoutes.instructionScreen,
                );
              },
            ),
            SizedBox(
              height: 40.h,
            ),
          ],
        ),
      ),
    );
  }
}
