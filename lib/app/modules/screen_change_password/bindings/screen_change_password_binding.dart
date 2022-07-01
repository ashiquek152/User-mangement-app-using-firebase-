import 'package:get/get.dart';

import '../controllers/screen_change_password_controller.dart';

class ScreenChangePasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ScreenChangePasswordController>(
      () => ScreenChangePasswordController(),
    );
  }
}
