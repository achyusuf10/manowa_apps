import 'package:get/get.dart';
import 'package:manowa_apps/features/instruction/controllers/instruction_controller.dart';

class InstructionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<InstructionController>(
      () => InstructionController(),
    );
  }
}
