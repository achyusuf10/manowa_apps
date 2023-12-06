import 'dart:math';
import 'dart:developer' as dev;
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:manowa_apps/configs/routes/app_routes.dart';

import 'package:manowa_apps/constants/core/image_assets_const.dart';
import 'package:manowa_apps/constants/core/sound_assets_const.dart';
import 'package:manowa_apps/features/game/helpers/functions/check_is_winner_func.dart';
import 'package:manowa_apps/features/game/helpers/functions/convert_list_answer_to_tic_tac_toe_func.dart';
import 'package:manowa_apps/features/game/models/answer_model.dart';
import 'package:manowa_apps/features/game/view/widget/dialog_content_winner_widget.dart';
import 'package:manowa_apps/utils/enum/ui_state_enum.dart';
import 'package:manowa_apps/utils/extensions/int_ext.dart';
import 'package:manowa_apps/utils/logger/app_logger.dart';
import 'package:manowa_apps/utils/service/dialog_service.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:motion_toast/resources/arrays.dart';

class GameController extends GetxController {
  static GameController get to => Get.find();

  Rxn<int> selectedAngle = Rxn<int>();
  late AudioPlayer _audioPlayer;

  RxBool isPlayerOneTurn = true.obs;
  RxBool isSin = true.obs;

  final Rx<UIState> stateGenerateAnswer = UIState.idle.obs;

  final RxList<AnswerModel> listAnswer = <AnswerModel>[].obs;

  final List<AnswerModel> _listAnswerEachRow = [
    AnswerModel(
      value: -sin(45.extToRadian),
      imagePath: ImageAssetsConst.textMinOneFrac2Root2,
    ),
    AnswerModel(
      value: -sin(60.extToRadian),
      imagePath: ImageAssetsConst.textMinOneFrac2Root3,
    ),
    AnswerModel(
      value: -sin(30.extToRadian),
      imagePath: ImageAssetsConst.textMinOneFrac2,
    ),
    AnswerModel(
      value: -sin(90.extToRadian),
      imagePath: ImageAssetsConst.textMinOne,
    ),
    AnswerModel(
      value: sin(0.extToRadian),
      imagePath: ImageAssetsConst.text0,
    ),
    AnswerModel(
      value: sin(45.extToRadian),
      imagePath: ImageAssetsConst.textOneFrac2Root2,
    ),
    AnswerModel(
      value: sin(60.extToRadian),
      imagePath: ImageAssetsConst.textOneFrac2Root3,
    ),
    AnswerModel(
      value: sin(30.extToRadian),
      imagePath: ImageAssetsConst.textOneFrac2,
    ),
    AnswerModel(
      value: sin(90.extToRadian),
      imagePath: ImageAssetsConst.text1,
    ),
    AnswerModel(
      value: -sin(45.extToRadian),
      imagePath: ImageAssetsConst.textMinOneFrac2Root2,
    ),
    AnswerModel(
      value: -sin(60.extToRadian),
      imagePath: ImageAssetsConst.textMinOneFrac2Root3,
    ),
    AnswerModel(
      value: -sin(30.extToRadian),
      imagePath: ImageAssetsConst.textMinOneFrac2,
    ),
    AnswerModel(
      value: -sin(90.extToRadian),
      imagePath: ImageAssetsConst.textMinOne,
    ),
    AnswerModel(
      value: sin(0.extToRadian),
      imagePath: ImageAssetsConst.text0,
    ),
  ];

  @override
  void onInit() {
    _onGenerateAnswer();
    _audioPlayer = AudioPlayer();
    super.onInit();
  }

  @override
  void onClose() {
    _audioPlayer.dispose();
    super.onClose();
  }

  Future<void> _onGenerateAnswer() async {
    listAnswer.clear();
    selectedAngle.value = null;
    try {
      stateGenerateAnswer.value = UIState.loading;
      for (int i = 0; i < 5; i++) {
        // listAnswer.addAll(_listAnswerEachRow);
        var temp1 = List<AnswerModel>.from(_listAnswerEachRow);
        temp1.shuffle();
        listAnswer.addAll(temp1);
        listAnswer.shuffle(Random(i * 2));
        await Future.delayed(const Duration(milliseconds: 100));
      }
      stateGenerateAnswer.value = UIState.success;
    } catch (e) {
      stateGenerateAnswer.value = UIState.error;
    }
  }

  void onTapAnswer({
    required AnswerModel answer,
    required int index,
  }) {
    if (selectedAngle.value == null) {
      _audioPlayer.play(
        volume: 1,
        AssetSource(
          SoundAssetsConst.soundWrong,
        ),
      );
      MotionToast.info(
        iconSize: 50.h,
        width: 1.sw - 40.w,
        height: 90.h,
        animationType: AnimationType.fromBottom,
        position: MotionToastPosition.bottom,
        animationDuration: const Duration(milliseconds: 700),
        toastDuration: const Duration(milliseconds: 2000),
        displayBorder: true,
        title: Text(
          "Info",
          style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        description: Text(
          "Pilih sudut terlebih dahulu",
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
          ),
        ),
      ).show(Get.context!);
      return;
    }

    if (answer.isAlreadySelected) {
      _audioPlayer.play(
        volume: 1,
        AssetSource(
          SoundAssetsConst.soundWrong,
        ),
      );
      MotionToast.error(
        iconSize: 50.h,
        width: 1.sw - 40.w,
        height: 90.h,
        animationType: AnimationType.fromBottom,
        position: MotionToastPosition.bottom,
        animationDuration: const Duration(milliseconds: 700),
        toastDuration: const Duration(milliseconds: 2000),
        displayBorder: true,
        title: Text(
          "Peringatan",
          style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        description: Text(
          "Jawaban sudah terpilih, silahkan pilih jawaban lain.",
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
          ),
        ),
      ).show(Get.context!);
      return;
    }
    var isCorrect = _isSelectedAnswerCorrect(answer, selectedAngle.value!);

    // isSin.value = true;
    if (isCorrect == false) {
      selectedAngle.value = null;
      _audioPlayer.play(
        volume: 1,
        AssetSource(
          SoundAssetsConst.soundWrong,
        ),
      );
      MotionToast.error(
        iconSize: 50.h,
        width: 1.sw - 40.w,
        height: 90.h,
        animationType: AnimationType.fromBottom,
        position: MotionToastPosition.bottom,
        animationDuration: const Duration(milliseconds: 700),
        toastDuration: const Duration(milliseconds: 2000),
        displayBorder: true,
        title: Text(
          "Peringatan",
          style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        description: Text(
          "Jawaban yang kamu pilih kurang tepat.",
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
          ),
        ),
      ).show(Get.context!);
      isPlayerOneTurn.value = !isPlayerOneTurn.value;
      return;
    }

    late AnswerModel temp;
    if (isPlayerOneTurn.value) {
      temp = answer.copyWith(
        isSelectedPlayerOne: true,
      );
      dev.log(temp.isAlreadySelected.toString());
    } else {
      temp = answer.copyWith(
        isSelectedPlayerTwo: true,
      );
    }
    listAnswer[index] = temp;
    listAnswer.refresh();

    var isThereAWinner = CheckIsWinnerFunc.call(
        ConverListAnswerToTicTacToeFunc.call(listAnswer));

    if (['1', '2'].contains(isThereAWinner)) {
      Get.dialog(
        PopScope(
          canPop: false,
          child: DialogContentWinnerWidget(
            onTapPositive: () {
              Get.back();
              onInit();
            },
            onTapNegative: () {
              Get.back();
              Get.until((route) => route.settings.name == AppRoutes.homeScreen);
            },
            desc: 'Player $isThereAWinner Menang',
          ),
        ),
        barrierColor: Colors.black.withOpacity(0.8),
        barrierDismissible: false,
      );
      return;
    }
    isPlayerOneTurn.value = !isPlayerOneTurn.value;
    selectedAngle.value = null;
    _audioPlayer.play(
      volume: 1,
      AssetSource(
        SoundAssetsConst.soundCorrect,
      ),
    );
  }

  bool _isSelectedAnswerCorrect(AnswerModel answerModel, int selectedAngle) {
    int convertedAngle = 0;

    int whichKuadran = 1;

    /// Kuadran 1
    if (selectedAngle >= 0 && selectedAngle <= 90) {
      convertedAngle = selectedAngle;
      whichKuadran = 1;
    }

    /// Kuadran 2
    else if (selectedAngle > 90 && selectedAngle <= 180) {
      convertedAngle = (180 - selectedAngle);
      whichKuadran = 2;
    }

    /// Kuadran 3
    else if (selectedAngle > 180 && selectedAngle <= 270) {
      convertedAngle = (selectedAngle - 180);
      whichKuadran = 3;
    }

    /// Kuadran 4
    else if (selectedAngle > 270 && selectedAngle <= 360) {
      convertedAngle = (360 - selectedAngle);
      whichKuadran = 4;
    }

    double result = 0;

    if (isSin.value) {
      result = sin(convertedAngle.extToRadian);
      if (whichKuadran == 3 || whichKuadran == 4) {
        result = -result;
      }
      return answerModel.value == result;
    } else {
      result = sin((90 - convertedAngle).extToRadian);
      if (whichKuadran == 2 || whichKuadran == 3) {
        result = -result;
      }
      return answerModel.value == result;
    }
  }
}
