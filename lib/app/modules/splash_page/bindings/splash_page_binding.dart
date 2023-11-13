import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../../../data/repository/base_route_repository.dart';
import '../../../data/source/remote/base_route_remote_data_source.dart';
import '../../../core/helper/constant.dart';
import '../../../data/remote/rms_api_service.dart';
import '../../../data/remote/vms_api_service.dart';
import '../controllers/splash_page_controller.dart';

class SplashPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<SplashPageController>(
      SplashPageController(),
    );

    Get.put<Dio>(
      Dio(),
      permanent: true,
    );

    Dio dio = Get.find();
    dio.options = BaseOptions(
  

      validateStatus: (statusCode) => true,
      connectTimeout: const Duration(milliseconds: CONNECT_TIME_OUT),
      receiveTimeout: const Duration(milliseconds: RECEIVE_TIME_OUT),
    );

    Get.put<VmsApiService>(
      VmsApiService(dio),
      permanent: true,
    );

    Get.put<RmsApiService>(
      RmsApiService(dio),
      permanent: true,
    );

    Get.put<BaseRouteRemoteDataSource>(
      BaseRouteRemoteDataSourceImpl(
        rmsApiService: Get.find(),
      ),
    );

    Get.put<BaseRouteRepository>(
      BaseRouteRepositoryImpl(
        baseRouteRemoteDataSource: Get.find(),
      ),
    );
  }
}
