import '../../model/request_models/update_employee_attendance_request.dart';
import '../../model/base_response.dart';
import '../../model/daily_route_employee.dart';
import '../../remote/rms_api_service.dart';

abstract class EmployeeRemoteDataSource {
  Future<BaseResponse<DailyRouteEmployee>> getDailyRouteEmployeeList(String id);
  Future<BaseResponse> updateDailyRouteEmployeeStatus(
      List<UpdateEmployeeAttendanceRequest>
          updateEmployeeAttendanceRequestList);
}

class EmployeeRemoteDataSourceImpl extends EmployeeRemoteDataSource {
  final RmsApiService rmsApiService;

  EmployeeRemoteDataSourceImpl({required this.rmsApiService});

  @override
  Future<BaseResponse<DailyRouteEmployee>> getDailyRouteEmployeeList(
      String id) {
    return rmsApiService.getDailyRouteEmployeeList(id);
  }

  @override
  Future<BaseResponse> updateDailyRouteEmployeeStatus(
      List<UpdateEmployeeAttendanceRequest>
          updateEmployeeAttendanceRequestList) {
    return rmsApiService.updateDailyRouteEmployeeAttendance(
        updateEmployeeAttendanceRequestList);
  }
}
