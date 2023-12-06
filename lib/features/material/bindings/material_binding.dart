import 'package:get/get.dart';
import 'package:manowa_apps/features/material/controllers/material_controller.dart';

class MaterialBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MaterialController>(
      () => MaterialController(),
    );
  }
}
