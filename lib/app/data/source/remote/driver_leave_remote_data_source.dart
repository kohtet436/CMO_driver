import '../../model/driver_leave_request.dart';
import '../../model/driver_leave.dart';
import '../../remote/vms_api_service.dart';
import '../../model/base_response.dart';

abstract class DriverLeaveRemoteDataSource {
  Future<BaseResponse<DriverLeave>> getDriverLeaves();
  Future<BaseResponse<DriverLeave>> requestDriverLeave(
      DriverLeaveRequest driverLeaveRequest);
  Future<BaseResponse<DriverLeave>> cancelDriverLeave(String id);
}

class DriverLeaveRemoteDataSourceImpl extends DriverLeaveRemoteDataSource {
  final VmsApiService vmsApiService;
  DriverLeaveRemoteDataSourceImpl({required this.vmsApiService});

  @override
  Future<BaseResponse<DriverLeave>> getDriverLeaves() {
    return vmsApiService.getDriverLeaves();
  }

  @override
  Future<BaseResponse<DriverLeave>> requestDriverLeave(
      DriverLeaveRequest driverLeaveRequest) {
    return vmsApiService.requestDriverLeave(driverLeaveRequest);
  }

  @override
  Future<BaseResponse<DriverLeave>> cancelDriverLeave(String id) {
    return vmsApiService.cancelDriverLeave(id);
  }
}
