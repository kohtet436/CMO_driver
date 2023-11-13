import 'package:get/get.dart';

import '../../../data/repository/driver_repository.dart';
import '../../../data/source/remote/driver_remote_data_source.dart';
import '../controllers/navigation_page_controller.dart';

class NavigationPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NavigationPageController>(
      () => NavigationPageController(),
    );

    Get.lazyPut<DriverRemoteDataSource>(
        () => DriverRemoteDataSourceImpl(
              vmsApiService: Get.find(),
            ),
        tag: 'Drawer-remote-date-source');

    Get.lazyPut<DriverRepository>(
        () => DriverRepositoryImpl(
              remoteDataSource: Get.find(tag: 'Drawer-remote-date-source'),
            ),
        tag: 'Drawer-repository');
  }
}
