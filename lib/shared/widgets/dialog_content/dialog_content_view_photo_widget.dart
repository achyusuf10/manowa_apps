import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:photo_view/photo_view.dart';

class DialogContentViewPhotoWidget extends StatelessWidget {
  final String imageSource;
  const DialogContentViewPhotoWidget({super.key, required this.imageSource});
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        PhotoView(
          tightMode: true,
          disableGestures: false,
          maxScale: PhotoViewComputedScale.contained * 2,
          imageProvider: AssetImage(
            imageSource,
          ),
          initialScale: PhotoViewComputedScale.contained * 0.8,
          backgroundDecoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6.r),
            color: Colors.transparent,
          ),
          errorBuilder: (context, error, stackTrace) {
            return Container(
              width: double.infinity,
              height: 230.h,
              color: Colors.grey,
              child: Center(
                child: Text(
                  'No Image',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            );
          },
        ),
        Positioned(
          top: 220.h,
          right: 40.w,
          child: GestureDetector(
            onTap: () => Get.back(),
            child: Container(
              height: 36.h,
              width: 36.w,
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.clear,
                size: 16.h,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
