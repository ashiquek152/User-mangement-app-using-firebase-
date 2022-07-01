import 'package:get/get.dart';

import '../controllers/screen_update_controller.dart';

class ScreenUpdateBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ScreenUpdateController>(
      () => ScreenUpdateController(),
    );
  }
}
