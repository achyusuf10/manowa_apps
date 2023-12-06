import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:manowa_apps/configs/themes/app_colors.dart';
import 'package:manowa_apps/shared/widgets/dialog_content/dialog_content_general_widget.dart';
import 'package:manowa_apps/shared/widgets/dialog_content/dialog_content_loading_widget.dart';

class DialogService {
  static bool closeLoading() {
    Get.back();

    return false;
  }

  static void showBasicToast({
    Duration duration = const Duration(milliseconds: 1500),
    required String message,
    Color messageColor = Colors.white,
    Color backgroundColor = Colors.black,
    int maxLines = 2,
    bool withButton = false,
    String? buttonText,
    VoidCallback? onPressedButton,
    Color textButtonColor = AppColors.primary,
  }) {
    Get.showSnackbar(
      GetSnackBar(
        messageText: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 15.w,
                vertical: 10.h,
              ),
              decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    message,
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: messageColor,
                    ),
                    maxLines: maxLines,
                    overflow: TextOverflow.clip,
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  withButton
                      ? InkWell(
                          onTap: onPressedButton ?? () {},
                          child: Text(
                            buttonText ?? 'Lihat Semua',
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: textButtonColor,
                            ),
                          ),
                        )
                      : const SizedBox(),
                ],
              ),
            ),
            const Spacer(),
          ],
        ),
        borderWidth: 0,
        backgroundColor: Colors.transparent,
        duration: duration,
        snackStyle: SnackStyle.GROUNDED,
      ),
    );
  }

  static bool showLoading({
    bool barrierDismissible = false,
    String loadingText = 'Loading...',
  }) {
    Get.dialog(
      DialogContentLoadingWidget(
        barrierDismissible: barrierDismissible,
        loadingText: loadingText,
      ),
      barrierDismissible: barrierDismissible,
    );

    return true;
  }

  static Future<T?> showDrawerGeneral<T>({
    bool withStrip = true,
    double radius = 8,
    required Widget content,
    bool isDismissable = true,
    EdgeInsets padding =
        const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
    double paddingBottom = 25,
  }) async {
    return await Get.bottomSheet<T>(
      SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(radius),
              topRight: Radius.circular(radius),
            ),
          ),
          padding: padding,
          child: Column(
            children: [
              Visibility(
                visible: withStrip,
                child: Container(
                  width: 65.h,
                  height: 5.h,
                  margin: EdgeInsets.only(bottom: 10.h),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(2.5),
                    ),
                    color: withStrip
                        ? const Color(0xffe8e8e8)
                        : Colors.transparent,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: paddingBottom),
                child: content,
              ),
            ],
          ),
        ),
      ),
      isDismissible: isDismissable,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
    );
  }

  static Future<T?> showDialogGeneral<T>({
    double margin = 40,
    double radius = 14,
    Color? color,
    Widget? content,
    bool barrierDismissible = true,
    EdgeInsetsGeometry padding = const EdgeInsets.all(16),
    ScrollPhysics? physics,
  }) async {
    return await Get.dialog<T>(
      PopScope(
        canPop: (barrierDismissible),
        child: Center(
          child: SingleChildScrollView(
            physics: physics,
            child: Material(
              color: Colors.transparent,
              child: Container(
                margin: EdgeInsets.all(margin),
                padding: padding,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(radius.r),
                ),
                child: content ?? const SizedBox(),
              ),
            ),
          ),
        ),
      ),
      barrierDismissible: barrierDismissible,
    );
  }

  static Future<T?> showDialogProblem<T>({
    VoidCallback? buttonOnTap,
    String description = 'Terjadi Kesalahan, Silahkan Coba Lagi',
    String title = 'Upss Ada Masalah',
    String textButton = 'Tutup',
    String? assetPath,
    bool barrierDismissible = true,
  }) async {
    return await showDialogGeneral<T>(
      barrierDismissible: barrierDismissible,
      content: DialogContentGeneralWidget.oneButton(
        barrierDismissible: barrierDismissible,
        onTapPositiveButton: buttonOnTap ??
            () {
              Get.back();
            },
        description: description,
        title: title,
        textPositiveButton: textButton,
        imagePath: assetPath ?? '',
      ),
    );
  }

  static Future<T?> showDialogSuccess<T>({
    VoidCallback? buttonOnTap,
    String description = '',
    String title = 'Berhasil',
    String textButton = 'Tutup',
    bool barrierDismissible = true,
    Color? descColor,
    String? asset,
  }) async {
    return await showDialogGeneral<T>(
      barrierDismissible: barrierDismissible,
      content: DialogContentGeneralWidget.oneButton(
        barrierDismissible: barrierDismissible,
        descColors: descColor,
        onTapPositiveButton: buttonOnTap ??
            () {
              Get.back();
            },
        description: description,
        title: title,
        textPositiveButton: textButton,
        imagePath: asset ?? '',
      ),
    );
  }

  static Future<T?> showDialogPopUp<T>({
    VoidCallback? buttonOnTap,
    String description = '',
    String title = 'Berhasil',
    String textButton = 'Tutup',
    bool barrierDismissible = true,
    required String imagePath,
  }) async {
    return await showDialogGeneral<T>(
      barrierDismissible: barrierDismissible,
      content: DialogContentGeneralWidget.oneButton(
        barrierDismissible: barrierDismissible,
        onTapPositiveButton: buttonOnTap ??
            () {
              Get.back();
            },
        description: description,
        title: title,
        textPositiveButton: textButton,
        imagePath: imagePath,
      ),
    );
  }

  static Future<T?> showDialogChoice<T>({
    final VoidCallback? onTapPositiveButton,
    final VoidCallback? onTapNegativeButton,
    required final String description,
    final String title = 'Uppss...',
    final String textPositiveButton = 'Oke',
    final String textNegativeButton = 'Tutup',
    final String imagePath = '',
    bool barrierDismissible = true,
    bool isHorizontal = true,
    Color? descColor,
    bool isShowCloseButton = false,
  }) async {
    return await showDialogGeneral<T>(
      barrierDismissible: barrierDismissible,
      padding: isShowCloseButton ? EdgeInsets.zero : const EdgeInsets.all(16),
      content: DialogContentGeneralWidget.twoButton(
        barrierDismissible: barrierDismissible,
        imagePath: imagePath,
        textPositiveButton: textPositiveButton,
        textNegativeButton: textNegativeButton,
        description: description,
        title: title,
        onTapPositiveButton: onTapPositiveButton,
        onTapNegativeButton: onTapNegativeButton,
        isHorizontal: isHorizontal,
        descColors: descColor,
        isShowCloseButton: isShowCloseButton,
      ),
    );
  }
}
