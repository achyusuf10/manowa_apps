import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:manowa_apps/configs/themes/app_colors.dart';
import 'package:manowa_apps/shared/widgets/custom_button_widget.dart';

class DialogContentGeneralWidget extends StatelessWidget {
  final VoidCallback? onTapPositiveButton;
  final VoidCallback? onTapNegativeButton;
  final String description;
  final String title;
  final String textPositiveButton;
  final String textNegativeButton;
  final String imagePath;
  final bool barrierDismissible;
  final String type;
  final bool isHorizontal;
  final Color? descColors;
  final bool isShowCloseButton;

  const DialogContentGeneralWidget.oneButton({
    super.key,
    required this.imagePath,
    required this.description,
    required this.title,
    this.onTapPositiveButton,
    required this.textPositiveButton,
    required this.barrierDismissible,
    this.descColors,
    this.isShowCloseButton = false,
  })  : type = 'one-button',
        isHorizontal = true,
        textNegativeButton = '',
        onTapNegativeButton = null;
  const DialogContentGeneralWidget.twoButton({
    super.key,
    required this.imagePath,
    required this.description,
    required this.title,
    this.onTapPositiveButton,
    this.onTapNegativeButton,
    required this.textPositiveButton,
    required this.textNegativeButton,
    required this.barrierDismissible,
    this.isHorizontal = true,
    this.descColors,
    this.isShowCloseButton = false,
  }) : type = 'two-button';

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: barrierDismissible,
      child: Column(
        children: [
          Visibility(
            visible: isShowCloseButton,
            child: Container(
              width: 1.sw,
              alignment: Alignment.topRight,
              child: IconButton(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                icon: Icon(
                  Icons.close,
                  color: Colors.black,
                  size: 24.sp,
                ),
                onPressed: () => Navigator.pop(context),
              ),
            ),
          ),
          Padding(
            padding:
                isShowCloseButton ? const EdgeInsets.all(16) : EdgeInsets.zero,
            child: Column(
              children: [
                imagePath.contains('.json')
                    ? Lottie.asset(
                        imagePath,
                        height: 150.h,
                        fit: BoxFit.fitHeight,
                      )
                    : Image.asset(
                        imagePath,
                        height: 128.h,
                        fit: BoxFit.fitHeight,
                      ),
                SizedBox(
                  height: 24.h,
                ),
                Visibility(
                  visible: title.isNotEmpty,
                  child: Text(
                    title,
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w700,
                      color: AppColors.text_1,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: 12.h,
                ),
                Visibility(
                  visible: description.isNotEmpty,
                  child: Padding(
                    padding: EdgeInsets.only(top: 4.h),
                    child: Builder(builder: (_) {
                      final leng = description.split(" ").length;

                      return Text(
                        description,
                        style: TextStyle(
                          fontSize: leng >= 20 ? 11.sp : 16.sp,
                          color: descColors ?? AppColors.text_1,
                        ),
                        textAlign: TextAlign.center,
                      );
                    }),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Visibility(
                  visible: type == 'two-button',
                  replacement: CustomButtonWidget.v3(
                    text: textPositiveButton,
                    onTap: onTapPositiveButton,
                  ),
                  child: isHorizontal
                      ? Row(
                          children: [
                            Expanded(
                              child: CustomButtonWidget.v3(
                                text: textNegativeButton,
                                onTap: onTapNegativeButton,
                              ),
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            Expanded(
                              child: CustomButtonWidget.v3(
                                text: textPositiveButton,
                                onTap: onTapPositiveButton,
                              ),
                            ),
                          ],
                        )
                      : Column(
                          children: [
                            CustomButtonWidget.v3(
                              text: textPositiveButton,
                              onTap: onTapPositiveButton,
                            ),
                            SizedBox(
                              height: 10.w,
                            ),
                            CustomButtonWidget.v3(
                              text: textNegativeButton,
                              onTap: onTapNegativeButton,
                            )
                          ],
                        ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
