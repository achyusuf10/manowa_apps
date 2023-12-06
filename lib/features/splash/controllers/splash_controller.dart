import 'package:get/get.dart';
import 'package:manowa_apps/configs/routes/app_routes.dart';

class SplashController extends GetxController {
  static SplashController get to => Get.find();

  @override
  void onInit() {
    _loadingApps();
    super.onInit();
  }

  Future<void> _loadingApps() async {
    await Future.delayed(const Duration(seconds: 2));
    Get.offNamed(AppRoutes.homeScreen);
  }
}
