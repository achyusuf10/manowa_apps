import 'package:flutter/material.dart';
import 'package:flutter_conditional_rendering/flutter_conditional_rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:manowa_apps/configs/themes/app_colors.dart';
import 'package:manowa_apps/configs/themes/app_fonts.dart';
import 'package:manowa_apps/constants/core/image_assets_const.dart';
import 'package:manowa_apps/features/game/controllers/game_controller.dart';
import 'package:manowa_apps/shared/widgets/custom_button_widget.dart';
import 'package:manowa_apps/shared/widgets/my_scaffold_widget.dart';
import 'package:manowa_apps/utils/enum/ui_state_enum.dart';
import 'package:manowa_apps/utils/extensions/iteration_ext.dart';
import 'package:toggle_switch/toggle_switch.dart';

class GameScreen extends StatelessWidget {
  const GameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = GameController.to;
    return MyScaffoldWidget(
      bgImage: ImageAssetsConst.bgApps,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 44,
              vertical: 10,
            ).r,
            child: Image.asset(
              ImageAssetsConst.drawAyoBermain,
              width: double.infinity,
              fit: BoxFit.fitWidth,
            ),
          ),
          Expanded(
            child: RawScrollbar(
              padding: EdgeInsets.only(right: 4.w),
              thumbColor: Colors.black54,
              thumbVisibility: true,
              thickness: 6.0,
              radius: Radius.circular(12.r),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(
                      width: double.infinity,
                    ),
                    Text(
                      'Rumah Trigonometri\nSudut Istimewa',
                      style: TextStyle(
                        fontFamily: AppFonts.cormorantUpgright,
                        fontSize: 14.sp,
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
                    ),
                    SizedBox(
                      height: 19.h,
                    ),
                    Obx(
                      () => ConditionalSwitch.single(
                        context: context,
                        valueBuilder: (context) =>
                            controller.stateGenerateAnswer.value,
                        caseBuilders: {
                          UIState.loading: (context) => Padding(
                                padding: EdgeInsets.only(top: 1.sh / 5),
                                child: SizedBox(
                                  height: 60.h,
                                  width: 60.h,
                                  child: const CircularProgressIndicator(
                                    strokeWidth: 10,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                          UIState.success: (context) => _ContentGameWidget(
                                controller: controller,
                              ),
                        },
                        fallbackBuilder: (context) => const SizedBox(),
                      ),
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                  ],
                ),
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
            height: 10.h,
          ),
        ],
      ),
    );
  }
}

class _ContentGameWidget extends StatelessWidget {
  const _ContentGameWidget({
    required this.controller,
  });

  final GameController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GridView.builder(
          padding: EdgeInsets.symmetric(horizontal: 14.w),
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: controller.listAnswer.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 7,
            mainAxisSpacing: 0,
            childAspectRatio: 30 / 26,
            crossAxisSpacing: 0,
          ),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                controller.onTapAnswer(
                  answer: controller.listAnswer[index],
                  index: index,
                );
              },
              child: Obx(
                () {
                  var data = controller.listAnswer[index];

                  return Container(
                    width: double.infinity,
                    height: double.infinity,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: controller.isPlayerOneTurn.isTrue
                            ? AppColors.primary
                            : AppColors.secondary,
                        width: 1,
                      ),
                      color: data.isAlreadySelected
                          ? data.isSelectedPlayerOne
                              ? AppColors.primary
                              : AppColors.secondary
                          : AppColors.gray_1,
                    ),
                    child: Image.asset(
                      data.imagePath,
                      width: double.infinity,
                      fit: BoxFit.fitWidth,
                      color: data.isAlreadySelected
                          ? Colors.white
                          : AppColors.text_1,
                    ),
                  );
                },
              ),
            );
          },
        ),
        SizedBox(
          height: 30.h,
        ),
        Obx(
          () => ToggleSwitch(
            minWidth: 70.w,
            minHeight: 40.h,
            initialLabelIndex: controller.isSin.value ? 0 : 1,
            cornerRadius: 12.0,
            activeFgColor: Colors.white,
            inactiveBgColor: AppColors.gray_1,
            borderWidth: 3,
            inactiveFgColor: AppColors.text_1.withOpacity(0.5),
            totalSwitches: 2,
            customTextStyles: [
              TextStyle(
                fontSize: 18.sp,
                fontFamily: AppFonts.charm,
                fontWeight: FontWeight.bold,
              ),
              TextStyle(
                fontSize: 18.sp,
                fontFamily: AppFonts.charm,
                fontWeight: FontWeight.bold,
              ),
            ],
            labels: const [
              'SIN',
              'COS',
            ],
            iconSize: 30.0,
            borderColor: const [
              AppColors.primary,
              AppColors.secondary,
              AppColors.primary,
              AppColors.secondary,
            ],
            dividerColor: Colors.blueGrey,
            activeBgColors: controller.isPlayerOneTurn.value
                ? [
                    [AppColors.primary],
                    [AppColors.primary],
                  ]
                : [
                    [AppColors.secondary],
                    [AppColors.secondary],
                  ],
            onToggle: (index) {
              if (index == 0) {
                controller.isSin.value = true;
              } else {
                controller.isSin.value = false;
              }
            },
          ),
        ),
        SizedBox(
          height: 30.h,
        ),
        SudutIstimewaWidget(
          selectedAngle: controller.selectedAngle,
          onTap: (value) {
            if (controller.selectedAngle.value == value) {
              controller.selectedAngle.value = null;
              return;
            }
            controller.selectedAngle.value = value;
          },
          isPlayerOne: controller.isPlayerOneTurn,
        ),
      ],
    );
  }
}

class SudutIstimewaWidget extends StatelessWidget {
  final Rx<bool> isPlayerOne;
  final Rxn<int> selectedAngle;
  final Function(int value) onTap;
  const SudutIstimewaWidget({
    super.key,
    required this.selectedAngle,
    required this.onTap,
    required this.isPlayerOne,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            0,
            30,
            45,
            60,
            90,
          ]
              .extMapIndexed(
                (data, i) => _fieldWidget(data),
              )
              .toList(),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            120,
            135,
            150,
            180,
            210,
            225,
          ]
              .extMapIndexed(
                (data, i) => _fieldWidget(data),
              )
              .toList(),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            240,
            270,
            300,
            315,
            330,
            360,
          ]
              .extMapIndexed(
                (data, i) => _fieldWidget(data),
              )
              .toList(),
        ),
      ],
    );
  }

  Widget _fieldWidget(int data) {
    return GestureDetector(
      onTap: () {
        onTap(data);
      },
      child: Obx(() {
        bool isSelected = selectedAngle.value == data;
        return Container(
          width: 45.w,
          height: 35.h,
          decoration: BoxDecoration(
            color: isSelected
                ? isPlayerOne.value
                    ? AppColors.primary
                    : AppColors.secondary
                : AppColors.gray_1,
            border: Border.all(
              color:
                  isPlayerOne.isTrue ? AppColors.primary : AppColors.secondary,
              width: 1,
            ),
          ),
          alignment: Alignment.center,
          child: Text(
            '$data°',
            style: TextStyle(
              fontSize: 16.sp,
              color: isSelected ? Colors.white : AppColors.text_1,
              fontFamily: AppFonts.charm,
              fontWeight: FontWeight.w800,
            ),
          ),
        );
      }),
    );
  }
}
