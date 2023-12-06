import 'package:get/get.dart';
import 'package:manowa_apps/shared/widgets/dialog_content/dialog_content_view_photo_widget.dart';

class InstructionController extends GetxController {
  static InstructionController get to => Get.find();

  void onTapImage(String imageSource) {
    Get.dialog(
      DialogContentViewPhotoWidget(
        imageSource: imageSource,
      ),
    );
  }
}
