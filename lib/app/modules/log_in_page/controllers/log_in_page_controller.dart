import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../core/helper/helper.dart';
import '../../../data/repository/log_in_repository.dart';
import '../../../core/values/color_manager.dart';
import '../../../data/model/login_response.dart';
import '../../../routes/app_pages.dart';

class LogInPageController extends GetxController {
  final userIdTextController = TextEditingController().obs;
  final passwordTextController = TextEditingController().obs;

  final iconColor = ColorManager.lightGrey.obs;

  final LogInRepository repository = Get.find();

  final isLoading = false.obs;

  final logInResponse = Rxn<LogInResponse>();

  final errorMessage = Rxn<String>();

  @override
  void onInit() {
    userIdTextController.value = TextEditingController();
    passwordTextController.value = TextEditingController();
    super.onInit();
  }

  void logIn(String driverNumber, String password) async {
    try {
      isLoading(true);
      Helper.console(isLoading.toString());
      final response = await repository.logIn(driverNumber, password);
      response.fold(
        (data) {
          Helper.console(data.token);
          logInResponse(data);
          Helper.console(logInResponse.value!.token);
        },
        (error) {
          if (error.statusCode == 401) {
            errorMessage(error.message);
          }
        },
      );
    } finally {
      isLoading(false);
      if (logInResponse.value != null) {
        Get.offAllNamed(Routes.NAVIGATION_PAGE);
      } else {
        Helper.showQuickToast(
          "Your password or email is incorrect. Please try again or contact admin.",
        );
      }
      Helper.console(isLoading.toString());
    }
  }

  @override
  void dispose() {
    userIdTextController.value.dispose();
    passwordTextController.value.dispose();
    super.dispose();
  }
}
