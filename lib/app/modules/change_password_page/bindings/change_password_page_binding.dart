import 'package:get/get.dart';

import '../controllers/change_password_page_controller.dart';

class ChangePasswordPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChangePasswordPageController>(
      () => ChangePasswordPageController(),
    );
  }
}
