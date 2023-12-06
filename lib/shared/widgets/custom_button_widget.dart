import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:manowa_apps/configs/themes/app_colors.dart';
import 'package:manowa_apps/configs/themes/app_fonts.dart';
import 'package:manowa_apps/constants/core/image_assets_const.dart';
import 'package:manowa_apps/constants/core/sound_assets_const.dart';
import 'package:manowa_apps/shared/widgets/bordered_text_widget.dart';

class CustomButtonWidget extends StatefulWidget {
  final String text;
  final EdgeInsets? customContentPadding;
  final Function()? onTap;
  final double? minWidth;
  final double? minHeight;
  final double? maxHeight;
  final String bgButton;
  final double? fontSize;
  final List<Shadow>? textShadow;
  const CustomButtonWidget.v1({
    super.key,
    required this.text,
    this.customContentPadding,
    this.onTap,
    this.minWidth,
    this.minHeight,
    this.maxHeight,
    this.fontSize,
    this.textShadow,
  }) : bgButton = ImageAssetsConst.bgButton1;
  const CustomButtonWidget.v2({
    super.key,
    required this.text,
    this.customContentPadding,
    this.onTap,
    this.minWidth,
    this.minHeight,
    this.maxHeight,
    this.fontSize,
    this.textShadow,
  }) : bgButton = ImageAssetsConst.bgButton2;
  const CustomButtonWidget.v3({
    super.key,
    required this.text,
    this.customContentPadding,
    this.onTap,
    this.minWidth,
    this.minHeight,
    this.maxHeight,
    this.fontSize,
    this.textShadow,
  }) : bgButton = ImageAssetsConst.bgButton3;

  @override
  State<CustomButtonWidget> createState() => _CustomButtonWidgetState();
}

class _CustomButtonWidgetState extends State<CustomButtonWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late AudioPlayer _player;
  @override
  void initState() {
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _player = AudioPlayer();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    _player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        if (_controller.isAnimating) return;
        if (_player.state == PlayerState.playing) {
          await _player.stop();
        }
        _player.play(AssetSource(SoundAssetsConst.soundClick));
        _controller.forward(from: 0.8);
        if (widget.onTap == null) return;
        widget.onTap!();
      },
      child: Container(
        constraints: BoxConstraints(
          minHeight: widget.minHeight ?? 94.h,
          maxHeight: widget.maxHeight ?? 120.h,
          minWidth: widget.minWidth ?? 50.w,
        ),
        padding: widget.customContentPadding ??
            EdgeInsets.fromLTRB(
              30.w,
              5,
              30.w,
              30.h,
            ),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              widget.bgButton,
            ),
            fit: BoxFit.fill,
          ),
        ),
        child: BorderedTextWidget(
          strokeColor: Colors.white,
          child: Text(
            widget.text,
            style: TextStyle(
              fontFamily: AppFonts.poetsenOne,
              fontSize: widget.fontSize ?? 48.sp,
              color: AppColors.red,
              shadows: widget.textShadow ??
                  [
                    Shadow(
                      color: Colors.black.withOpacity(0.45),
                      blurRadius: 2,
                      offset: const Offset(4, 5),
                    ),
                  ],
            ),
          ),
        ),
      )
          .animate(
            controller: _controller,
          )
          .scale(),
    );
  }
}
