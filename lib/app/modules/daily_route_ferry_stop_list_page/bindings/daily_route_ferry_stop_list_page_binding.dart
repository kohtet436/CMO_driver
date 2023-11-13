import 'package:get/get.dart';

import '../../../data/repository/daily_route_repository.dart';
import '../../../data/source/remote/daily_route_remote_data_source.dart';
import '../controllers/daily_route_ferry_stop_list_page_controller.dart';

class DailyRouteFerryStopListPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DailyRouteFerryStopListPageController>(
      () => DailyRouteFerryStopListPageController(),
    );

    Get.lazyPut<DailyRouteRemoteDataSource>(
      () => DailyRouteRemoteDataSourceImpl(rmsApiService: Get.find()),
    );

    Get.lazyPut<DailyRouteRepository>(
      () => DailyRouteRepositoryImpl(baseRouteRemoteDataSource: Get.find()),
    );
  }
}
