import 'package:get/get.dart';

import '../../../data/repository/employee_repository.dart';
import '../../../data/source/remote/employee_remote_data_source.dart';
import '../controllers/employee_attendance_list_page_controller.dart';

class EmployeeAttendanceListPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EmployeeAttendanceListPageController>(
      () => EmployeeAttendanceListPageController(),
    );

    Get.lazyPut<EmployeeRemoteDataSource>(
        () => EmployeeRemoteDataSourceImpl(rmsApiService: Get.find()));

    Get.lazyPut<EmployeeRepository>(
        () => EmployeeRepositoryImpl(remoteDataSource: Get.find()));
  }
}
