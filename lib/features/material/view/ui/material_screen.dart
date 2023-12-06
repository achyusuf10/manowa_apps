import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:manowa_apps/configs/themes/app_fonts.dart';
import 'package:manowa_apps/constants/core/image_assets_const.dart';
import 'package:manowa_apps/features/material/constants/material_assets_constant.dart';
import 'package:manowa_apps/features/material/controllers/material_controller.dart';
import 'package:manowa_apps/shared/widgets/custom_button_widget.dart';
import 'package:manowa_apps/shared/widgets/my_scaffold_widget.dart';

class MaterialScreen extends StatelessWidget {
  MaterialScreen({Key? key}) : super(key: key);

  final assetsConstant = MaterialAssetsConstant;
  final controller = MaterialController.to;

  @override
  Widget build(BuildContext context) {
    return MyScaffoldWidget(
      bgImage: ImageAssetsConst.bgApps,
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 14.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 56.w),
                    child: Image.asset(
                      ImageAssetsConst.drawMateri,
                      width: double.infinity,
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30.w),
                    child: GestureDetector(
                      onTap: () {
                        controller.onTapImage(
                          ImageAssetsConst.drawMaterial,
                        );
                      },
                      child: Image.asset(
                        ImageAssetsConst.drawMaterial,
                        width: double.infinity,
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 25.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25.w),
                    child: Text(
                      'Contoh',
                      style: TextStyle(
                        fontSize: 26.sp,
                        fontFamily: AppFonts.cormorantUpgright,
                        fontWeight: FontWeight.w700,
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
                    ),
                  ),
                  SizedBox(
                    height: 7.h,
                  ),
                  GridView.builder(
                    shrinkWrap: true,
                    padding: EdgeInsets.symmetric(horizontal: 25.w),
                    itemCount: controller.imageMaterial.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 150 / 80,
                      mainAxisSpacing: 5.w,
                      crossAxisSpacing: 10.w,
                    ),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          controller.onTapImage(
                            controller.imageMaterial[index],
                          );
                        },
                        child: Image.asset(
                          controller.imageMaterial[index],
                          width: double.infinity,
                          height: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      );
                    },
                  ),
                  SizedBox(
                    height: 28.h,
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 25.w),
            child: Align(
              alignment: Alignment.centerRight,
              child: CustomButtonWidget.v3(
                onTap: () {
                  Get.back();
                },
                text: 'MENU',
                minHeight: 20.h,
                minWidth: 100.w,
                fontSize: 24.w,
                customContentPadding: EdgeInsets.fromLTRB(
                  30.w,
                  5,
                  30.w,
                  20.h,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 28.h,
          ),
        ],
      ),
    );
  }
}
