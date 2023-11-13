import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../../../core/helper/app_enum.dart';
import '../../../core/helper/helper.dart';
import '../../../data/model/driver.dart';
import '../../../data/repository/driver_repository.dart';

class NavigationPageController extends GetxController {
  Rxn<Driver> driver = Rxn<Driver>();
  DriverRepository repository = Get.find(tag: 'Drawer-repository');
  var isLoading = true.obs;
  final pageIndex = PageIndex.HOME.obs;
  var appVersion = Rx<String>("N/A");

  @override
  void onInit() {
    getVersion();
    getDriverProfile();
    super.onInit();
  }

  void getVersion() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    appVersion(packageInfo.version);
  }

  void getDriverProfile() async {
    try {
      isLoading(true);
      final data = await repository.getDriver();
      data.fold(
        (driver) => this.driver(driver),
        (error) => Helper.console(error.message),
      );
    } finally {
      isLoading(false);
    }
  }

  void changePage(PageIndex page) {
    Get.back();
    pageIndex(page);
  }
}
