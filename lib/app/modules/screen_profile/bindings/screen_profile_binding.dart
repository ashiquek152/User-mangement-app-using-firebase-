import 'package:get/get.dart';

import '../controllers/screen_profile_controller.dart';

class ScreenProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ScreenProfileController>(
      () => ScreenProfileController(),
    );
  }
}
