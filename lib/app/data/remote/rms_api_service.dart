import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../model/request_models/check_in_out_request.dart';
import '../model/request_models/route_start_end_request.dart';
import '../model/request_models/update_employee_attendance_request.dart';
import '../model/base_route.dart';
import '../model/base_response.dart';
import '../model/daily_route_employee.dart';
import '../model/request_models/daily_route_request.dart';
import '../model/response_models/daily_route.dart';

part 'rms_api_service.g.dart';

@RestApi(baseUrl: "https://apiroute.fms.dev.citymall.com.mm/")
abstract class RmsApiService {
  factory RmsApiService(Dio dio, {String baseUrl}) = _RmsApiService;

  @GET('/api/BaseRoute/GetBaseRouteById/{id}')
  Future<BaseResponse<BaseRoute>> getBaseRoute(@Path("id") id);

  @GET('/api/BaseRoute/GetBaseRouteIdByVehicleEmployeeId/{id}')
  Future<BaseResponse<String>> getBaseRouteId(@Path("id") id);

  @POST('/api/DailyRoute/GetDailyRouteByDateTimeAndRoute')
  Future<BaseResponse<DailyRoute>> getDailyRoute(
    @Body() DailyRouteRequest dailyRouteRequest,
  );

  @GET('/api/DailyRoute/GetEmployeesByDailyRouteId/{id}')
  Future<BaseResponse<DailyRouteEmployee>> getDailyRouteEmployeeList(
      @Path("id") id);

  @PUT('/api/DailyRoute/UpdateDailyRouteByList')
  Future<BaseResponse> updateDailyRouteEmployeeAttendance(
    @Body()
        List<UpdateEmployeeAttendanceRequest>
            updateEmployeeAttendanceRequestList,
  );

  @POST('/api/DailyRoute/DriverStartEndRoute')
  Future<BaseResponse<DailyRoute>> startEndRoute(
    @Body() RouteStartEndRequest routeStartEndRequest,
  );

  @POST('/api/DailyRoute/DriverCheckInCheckOut')
  Future<BaseResponse<DailyRoute>> checkInOut(
    @Body() CheckInOutRequest checkInOutRequest,
  );
}
