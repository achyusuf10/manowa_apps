import 'package:get/get.dart';
import 'package:manowa_apps/constants/core/image_assets_const.dart';
import 'package:manowa_apps/shared/widgets/dialog_content/dialog_content_view_photo_widget.dart';

class MaterialController extends GetxController {
  static MaterialController get to => Get.find();

  List<String> imageMaterial = [
    ImageAssetsConst.drawExampleMaterial1,
    ImageAssetsConst.drawExampleMaterial2,
    ImageAssetsConst.drawExampleMaterial3,
    ImageAssetsConst.drawExampleMaterial4,
  ];

  void onTapImage(String imageSource) {
    Get.dialog(
      DialogContentViewPhotoWidget(
        imageSource: imageSource,
      ),
    );
  }
}
