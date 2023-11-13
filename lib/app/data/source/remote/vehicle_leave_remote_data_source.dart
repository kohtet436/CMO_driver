import '../../model/vehicle_leave.dart';
import '../../model/vehicle_leave_request.dart';
import '../../remote/vms_api_service.dart';
import '../../model/base_response.dart';

abstract class VehicleLeaveRemoteDataSource {
  Future<BaseResponse<VehicleLeave>> getVehicleLeaves();
  Future<BaseResponse<VehicleLeave>> requestVehicleLeave(
      VehicleLeaveRequest vehicleLeaveRequest);
  Future<BaseResponse<VehicleLeave>> cancelVehicleLeave(String id);
}

class VehicleLeaveRemoteDataSourceImpl extends VehicleLeaveRemoteDataSource {
  final VmsApiService vmsApiService;
  VehicleLeaveRemoteDataSourceImpl({required this.vmsApiService});

  @override
  Future<BaseResponse<VehicleLeave>> getVehicleLeaves() {
    return vmsApiService.getVehicleLeaves();
  }

  @override
  Future<BaseResponse<VehicleLeave>> requestVehicleLeave(
      VehicleLeaveRequest vehicleLeaveRequest) {
    return vmsApiService.requestVehicleLeave(vehicleLeaveRequest);
  }

  @override
  Future<BaseResponse<VehicleLeave>> cancelVehicleLeave(String id) {
    return vmsApiService.cancelVehicleLeave(id);
  }
}
