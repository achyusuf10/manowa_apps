import 'package:audioplayers/audioplayers.dart';
import 'package:get/get.dart';
import 'package:manowa_apps/configs/routes/app_routes.dart';
import 'package:manowa_apps/constants/core/sound_assets_const.dart';

class HomeController extends SuperController {
  static HomeController get to => Get.find();

  late AudioPlayer audioPlayer;

  @override
  void onInit() {
    audioPlayer = AudioPlayer();
    onSetBGM();
    super.onInit();
  }

  Future<void> onSetBGM() async {
    await audioPlayer.play(
      AssetSource(SoundAssetsConst.soundBGMHome),
    );
    audioPlayer.setReleaseMode(ReleaseMode.loop);
  }

  @override
  void onClose() {
    audioPlayer.dispose();
    super.onClose();
  }

  Future<void> onToogleMusic() async {
    if (audioPlayer.state == PlayerState.playing) {
      await audioPlayer.stop();
    } else {
      audioPlayer.play(
        AssetSource(SoundAssetsConst.soundBGMHome),
      );
    }
  }

  @override
  void onDetached() {
    audioPlayer.stop();
  }

  @override
  void onHidden() {
    audioPlayer.stop();
  }

  @override
  void onInactive() {
    audioPlayer.stop();
  }

  @override
  void onPaused() {
    audioPlayer.stop();
  }

  @override
  void onResumed() {
    if (Get.currentRoute == AppRoutes.gameScreen) return;
    onSetBGM();
  }
}
