import 'package:get/get.dart';

import '../../../data/repository/base_route_repository.dart';
import '../../../data/source/remote/base_route_remote_data_source.dart';
import '../controllers/base_route_details_page_controller.dart';

class BaseRouteDetailsPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BaseRouteDetailsPageController>(
      () => BaseRouteDetailsPageController(),
    );

    Get.lazyPut<BaseRouteRemoteDataSource>(
        () => BaseRouteRemoteDataSourceImpl(rmsApiService: Get.find()));

    Get.lazyPut<BaseRouteRepository>(
        () => BaseRouteRepositoryImpl(baseRouteRemoteDataSource: Get.find()));
  }
}
