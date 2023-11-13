import 'package:get/get.dart';

import '../../../data/repository/log_in_repository.dart';
import '../../../data/source/remote/log_in_remote_data_source.dart';
import '../controllers/log_in_page_controller.dart';

class LogInPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LogInPageController>(
      () => LogInPageController(),
    );

    Get.lazyPut<LogInRemoteDataSource>(
      () => LogInRemoteDataSourceImpl(
        vmsApiService: Get.find(),
      ),
    );

    Get.lazyPut<LogInRepository>(
      () => LogInRepositoryImpl(
        remoteDataSource: Get.find(),
      ),
    );
  }
}
