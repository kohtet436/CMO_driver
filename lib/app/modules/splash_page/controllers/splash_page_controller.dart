import 'dart:async';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../core/helper/constant.dart';
import '../../../core/helper/helper.dart';
import '../../../data/repository/base_route_repository.dart';
import '../../../routes/app_pages.dart';

class SplashPageController extends GetxController {
  @override
  void onReady() {
    super.onReady();
    Future.delayed(
      const Duration(seconds: 3),
      () {
        if (GetStorage().read('baseRouteId') == null) {
          getBaseRouteId(TEST_ID);
        }
        Get.offAllNamed(Routes.LOG_IN_PAGE);
      },
    );
  }

  void getBaseRouteId(String employeeId) async {
    BaseRouteRepository baseRouteRepository = Get.find();
    var data = await baseRouteRepository.getBaseRouteId(employeeId);
    data.fold(
      (baseRouteId) {
        GetStorage().write('baseRouteId', baseRouteId);
      },
      (error) => Helper.console(error.message),
    );
  }
}
