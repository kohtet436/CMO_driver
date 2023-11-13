import '../../model/request_models/check_in_out_request.dart';
import '../../model/request_models/route_start_end_request.dart';
import '../../model/request_models/daily_route_request.dart';
import '../../model/response_models/daily_route.dart';
import '../../remote/rms_api_service.dart';
import '../../model/base_response.dart';

abstract class DailyRouteRemoteDataSource {
  Future<BaseResponse<DailyRoute>> getDailyRoute(
      DailyRouteRequest dailyRouteRequest);
  Future<BaseResponse<DailyRoute>> startEndRoute(
      RouteStartEndRequest routeStartEndRequest);
  Future<BaseResponse<DailyRoute>> checkInOut(
      CheckInOutRequest checkInOutRequest);
}

class DailyRouteRemoteDataSourceImpl extends DailyRouteRemoteDataSource {
  final RmsApiService rmsApiService;
  DailyRouteRemoteDataSourceImpl({required this.rmsApiService});

  @override
  Future<BaseResponse<DailyRoute>> getDailyRoute(
      DailyRouteRequest dailyRouteRequest) {
    return rmsApiService.getDailyRoute(dailyRouteRequest);
  }

  @override
  Future<BaseResponse<DailyRoute>> startEndRoute(
      RouteStartEndRequest routeStartEndRequest) {
    return rmsApiService.startEndRoute(routeStartEndRequest);
  }

  @override
  Future<BaseResponse<DailyRoute>> checkInOut(
      CheckInOutRequest checkInOutRequest) {
    return rmsApiService.checkInOut(checkInOutRequest);
  }
}
