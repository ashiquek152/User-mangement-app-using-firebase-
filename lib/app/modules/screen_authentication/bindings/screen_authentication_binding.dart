import 'package:get/get.dart';

import '../controllers/screen_authentication_controller.dart';

class ScreenAuthenticationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ScreenAuthenticationController>(
      () => ScreenAuthenticationController(),
    );
  }
}
