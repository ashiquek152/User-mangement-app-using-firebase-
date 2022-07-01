import 'package:get/get.dart';

import '../controllers/screen_signup_controller.dart';

class ScreenSignupBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ScreenSignupController>(
      () => ScreenSignupController(),
    );
  }
}
