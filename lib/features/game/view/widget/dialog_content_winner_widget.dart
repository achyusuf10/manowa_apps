import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:manowa_apps/configs/themes/app_fonts.dart';

import 'package:manowa_apps/constants/core/image_assets_const.dart';
import 'package:manowa_apps/constants/core/lottie_assets_const.dart';
import 'package:manowa_apps/shared/widgets/bordered_text_widget.dart';
import 'package:manowa_apps/shared/widgets/custom_button_widget.dart';

class DialogContentWinnerWidget extends StatelessWidget {
  final Function() onTapPositive;
  final Function() onTapNegative;
  final String desc;
  const DialogContentWinnerWidget({
    super.key,
    required this.onTapPositive,
    required this.onTapNegative,
    required this.desc,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Material(
          type: MaterialType.transparency,
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: 20.w,
              vertical: 14.h,
            ),
            height: 300.h,
            width: 1.sw - 50.w,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.white,
                width: 4,
              ),
              image: const DecorationImage(
                image: AssetImage(
                  ImageAssetsConst.bgApps,
                ),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: [
                LottieBuilder.asset(
                  LottieAssetsConst.animBadgesStar,
                  width: 1.sw / 4,
                  fit: BoxFit.fitWidth,
                ),
                BorderedTextWidget(
                  child: Text(
                    'Congratulation',
                    style: TextStyle(
                      fontFamily: AppFonts.cormorantUpgright,
                      fontSize: 30.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ).animate().fade().scale(),
                SizedBox(
                  height: 10.h,
                ),
                BorderedTextWidget(
                  strokeWidth: 2,
                  child: Text(
                    desc,
                    style: TextStyle(
                      fontFamily: AppFonts.openSans,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ).animate().fade().scale(),
                const Spacer(),
                Row(
                  children: [
                    Expanded(
                      child: CustomButtonWidget.v3(
                        customContentPadding: EdgeInsets.only(
                          left: 10.w,
                          right: 10.w,
                          bottom: 10.h,
                        ),
                        minHeight: 50.h,
                        text: 'Tutup',
                        fontSize: 14.sp,
                        onTap: onTapNegative,
                      ),
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Expanded(
                      child: CustomButtonWidget.v3(
                        customContentPadding: EdgeInsets.only(
                          left: 10.w,
                          right: 10.w,
                          bottom: 10.h,
                        ),
                        minHeight: 50.h,
                        text: 'Main Lagi',
                        fontSize: 14.sp,
                        onTap: onTapPositive,
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
