import 'package:cmo_driver/app/core/helper/constant.dart';
import 'package:dartz/dartz.dart';
import 'package:get_storage/get_storage.dart';

import '../../core/helper/app_enum.dart';
import '../../core/helper/response_handler.dart';
import '../model/request_models/check_in_out_request.dart';
import '../model/request_models/daily_route_request.dart';
import '../model/request_models/route_start_end_request.dart';
import '../model/response_error.dart';
import '../model/response_models/daily_route.dart';
import '../source/remote/daily_route_remote_data_source.dart';

abstract class DailyRouteRepository {
  Future<Either<DailyRoute, ResponseError>> getDailyRoute();
  Future<Either<DailyRoute, ResponseError>> startEndRoute(String dailyRouteId);
  Future<Either<DailyRoute, ResponseError>> checkInOut(
      String dailyRouteId, String ferryStopId);
}

class DailyRouteRepositoryImpl extends DailyRouteRepository {
  final DailyRouteRemoteDataSource baseRouteRemoteDataSource;

  DailyRouteRepositoryImpl({required this.baseRouteRemoteDataSource});

  @override
  Future<Either<DailyRoute, ResponseError>> getDailyRoute() async {
    final dailyRouteRequest = DailyRouteRequest(
      baseRouteId: GetStorage().read('baseRouteId'),
      date: DateTime.now(),
      routeType: DateTime.now().hour < 12
          ? DailyRouteType.MORNING
          : DailyRouteType.EVENING,
    );
    final response =
        await baseRouteRemoteDataSource.getDailyRoute(dailyRouteRequest);

    final responseHandlerData = ResponseHandler().checkResponse(response);
    return responseHandlerData.fold(
      (data) => Left(data[0]),
      (error) => Right(error),
    );
  }

  @override
  Future<Either<DailyRoute, ResponseError>> startEndRoute(
      String dailyRouteId) async {
    final routeStartEndRequest = RouteStartEndRequest(
      dailyRouteId: dailyRouteId,
      vehicleEmployeeId: TEST_ID,
    );
    final response =
        await baseRouteRemoteDataSource.startEndRoute(routeStartEndRequest);

    final responseHandlerData = ResponseHandler().checkResponse(response);
    return responseHandlerData.fold(
      (data) => Left(data[0]),
      (error) => Right(error),
    );
  }

  @override
  Future<Either<DailyRoute, ResponseError>> checkInOut(
      String dailyRouteId, String ferryStopId) async {
    final checkInOutRequest = CheckInOutRequest(
      dailyRouteId: dailyRouteId,
      vehicleEmployeeId: TEST_ID,
      ferryStopId: ferryStopId,
    );
    final response =
        await baseRouteRemoteDataSource.checkInOut(checkInOutRequest);

    final responseHandlerData = ResponseHandler().checkResponse(response);
    return responseHandlerData.fold(
      (data) => Left(data[0]),
      (error) => Right(error),
    );
  }
}
