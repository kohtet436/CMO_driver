import 'package:get/get.dart';

import '../../../data/repository/daily_route_repository.dart';
import '../../../data/source/remote/daily_route_remote_data_source.dart';
import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(),
      fenix: true,
    );

    Get.lazyPut<DailyRouteRemoteDataSource>(
      () => DailyRouteRemoteDataSourceImpl(rmsApiService: Get.find()),
    );

    Get.lazyPut<DailyRouteRepository>(
      () => DailyRouteRepositoryImpl(baseRouteRemoteDataSource: Get.find()),
    );
  }
}
