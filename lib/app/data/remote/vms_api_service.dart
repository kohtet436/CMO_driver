import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../model/vehicle_leave_request.dart';
import '../model/driver_leave.dart';
import '../model/driver_leave_request.dart';
import '../model/driver_update_profile.dart';
import '../model/login_response.dart';
import '../model/driver.dart';
import '../model/base_response.dart';
import '../model/vehicle_leave.dart';

part 'vms_api_service.g.dart';

@RestApi(baseUrl: "https://apivehicle.fms.dev.citymall.com.mm/")
abstract class VmsApiService {
  factory VmsApiService(Dio dio, {String baseUrl}) = _VmsApiService;

  @GET('/api/VehicleEmployeeLeaves/GetAllDriverLeavesByMobile')
  Future<BaseResponse<DriverLeave>> getDriverLeaves();

  @GET('/api/VehicleLeaves/GetAllVehicleLeavesByMobile')
  Future<BaseResponse<VehicleLeave>> getVehicleLeaves();

  @POST('/api/VehicleEmployeeLeaves/AddVehicleEmployeeLeave')
  Future<BaseResponse<DriverLeave>> requestDriverLeave(
    @Body() DriverLeaveRequest driverLeaveRequest,
  );

  @POST('/api/VehicleLeaves/AddVehicleLeave')
  Future<BaseResponse<VehicleLeave>> requestVehicleLeave(
    @Body() VehicleLeaveRequest vehicleLeaveRequest,
  );

  @PATCH('/api/VehicleEmployeeLeaves/DeclineVehicleEmployeeLeave/{id}')
  Future<BaseResponse<DriverLeave>> cancelDriverLeave(@Path() id);

  @PUT('/api/VehicleLeaves/DeclineVehicleLeave/{id}')
  Future<BaseResponse<VehicleLeave>> cancelVehicleLeave(@Path() id);

  @POST('/vms/login')
  Future<BaseResponse<LogInResponse>> logIn(
      @Field("id") driverNumber, @Field("password") password);

  @GET('/api/VehicleEmployees/GetDriverProfile')
  Future<BaseResponse<Driver>> getDriver();

  @PUT('/api/VehicleEmployees/UpdateDriverProfile')
  Future<BaseResponse<Driver>> updateDriver(
    @Body() DriverUpdateProfile driverUpdateProfile,
  );
}
