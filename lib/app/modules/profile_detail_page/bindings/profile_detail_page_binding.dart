import 'package:get/get.dart';

import '../../../data/repository/driver_repository.dart';
import '../../../data/source/remote/driver_remote_data_source.dart';
import '../controllers/profile_detail_page_controller.dart';

class ProfileDetailPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfileDetailPageController>(
      () => ProfileDetailPageController(),
    );

    Get.lazyPut<DriverRemoteDataSource>(
      () => DriverRemoteDataSourceImpl(
        vmsApiService: Get.find(),
      ),
    );

    Get.lazyPut<DriverRepository>(
      () => DriverRepositoryImpl(
        remoteDataSource: Get.find(),
      ),
    );
  }
}
