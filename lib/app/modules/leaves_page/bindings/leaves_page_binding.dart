import 'package:get/get.dart';

import '../../../data/source/remote/driver_leave_remote_data_source.dart';
import '../../../data/source/remote/vehicle_leave_remote_data_source.dart';
import '../../../data/repository/leave_repository.dart';
import '../controllers/leaves_page_controller.dart';

class LeavesPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LeavesPageController>(
      () => LeavesPageController(),
    );

    Get.lazyPut<DriverLeaveRemoteDataSource>(
      () => DriverLeaveRemoteDataSourceImpl(
        vmsApiService: Get.find(),
      ),
    );

    Get.lazyPut<VehicleLeaveRemoteDataSource>(
      () => VehicleLeaveRemoteDataSourceImpl(
        vmsApiService: Get.find(),
      ),
    );

    Get.lazyPut<LeaveRepository>(
      () => LeaveRepositoryImpl(
        driverLeaveRemoteDataSource: Get.find(),
        vehicleLeaveRemoteDataSource: Get.find(),
      ),
    );
  }
}
