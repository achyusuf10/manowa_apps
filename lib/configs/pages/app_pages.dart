import 'package:get/get.dart';
import 'package:manowa_apps/configs/routes/app_routes.dart';
import 'package:manowa_apps/features/game/bindings/game_binding.dart';
import 'package:manowa_apps/features/game/view/ui/game_screen.dart';
import 'package:manowa_apps/features/home/bindings/home_binding.dart';
import 'package:manowa_apps/features/home/view/ui/home_screen.dart';
import 'package:manowa_apps/features/instruction/bindings/instruction_binding.dart';
import 'package:manowa_apps/features/instruction/view/ui/instruction_screen.dart';
import 'package:manowa_apps/features/material/bindings/material_binding.dart';
import 'package:manowa_apps/features/material/view/ui/material_screen.dart';
import 'package:manowa_apps/features/splash/bindings/splash_binding.dart';
import 'package:manowa_apps/features/splash/view/ui/splash_screen.dart';

class AppPages {
  static List<GetPage> pages() {
    return [
      GetPage(
        binding: SplashBinding(),
        name: AppRoutes.splashScreen,
        page: () => const SplashScreen(),
      ),
      GetPage(
        binding: HomeBinding(),
        name: AppRoutes.homeScreen,
        page: () => const HomeScreen(),
      ),
      GetPage(
        binding: MaterialBinding(),
        name: AppRoutes.materialScreen,
        page: () => MaterialScreen(),
      ),
      GetPage(
        binding: InstructionBinding(),
        name: AppRoutes.instructionScreen,
        page: () => const InstructionScreen(),
      ),
      GetPage(
        name: AppRoutes.gameScreen,
        binding: GameBinding(),
        page: () => const GameScreen(),
      ),
    ];
  }
}
