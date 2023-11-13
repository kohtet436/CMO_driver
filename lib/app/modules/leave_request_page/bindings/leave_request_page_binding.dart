import 'package:get/get.dart';

import '../controllers/leave_request_page_controller.dart';

class LeaveRequestPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LeaveRequestPageController>(
      () => LeaveRequestPageController(),
    );
  }
}
