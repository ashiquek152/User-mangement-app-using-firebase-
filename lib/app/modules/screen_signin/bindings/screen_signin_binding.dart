import 'package:get/get.dart';

import '../controllers/screen_signin_controller.dart';

class ScreenSigninBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ScreenSigninController>(
      () => ScreenSigninController(),
    );
  }
}
