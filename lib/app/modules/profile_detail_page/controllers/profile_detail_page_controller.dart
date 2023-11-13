import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/model/driver_update_profile.dart';
import '../../../data/model/driver.dart';
import '../../../data/repository/driver_repository.dart';
import '../../../core/helper/helper.dart';

class ProfileDetailPageController extends GetxController {
  Rxn<Driver> driver = Rxn<Driver>();
  var isLoading = true.obs;
  DriverRepository repository = Get.find();

  var isEditable = false.obs;

  final phonefocusNode = FocusNode().obs;

  final addressFocusNode = FocusNode().obs;

  late TextEditingController phoneController;
  late TextEditingController addressController;

  @override
  void onInit() {
    getDriverProfile();
    super.onInit();
  }

  void getDriverProfile() async {
    try {
      isLoading(true);
      var data = await repository.getDriver();
      data.fold(
        (driver) {
          this.driver(driver);
          phoneController = TextEditingController(text: driver.phoneNumber);
          addressController = TextEditingController(text: driver.address);
        },
        (error) => Helper.console(error.message),
      );
    } finally {
      isLoading(false);
    }
  }

  void updateDriverProfile(DriverUpdateProfile driverUpdateProfile) async {
    try {
      isLoading(true);
      var data = await repository.updateDriver(driverUpdateProfile);
      data.fold(
        (driver) {
          getDriverProfile();
        },
        (error) => Helper.console(error.message),
      );
    } finally {
      isLoading(false);
    }
  }

  @override
  void dispose() {
    phonefocusNode.value.dispose();
    addressFocusNode.value.dispose();
    phoneController.dispose();
    addressController.dispose();
    super.dispose();
  }
}
